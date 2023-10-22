import 'package:finance_app/components/dropdown.dart'; // Özel dropdown bileşeni buradan içe aktarılmalı
import 'package:finance_app/components/textformfield.dart';
import 'package:finance_app/constants/colors.dart';
import 'package:finance_app/constants/padding.dart';
import 'package:finance_app/controllers/transaction_controller.dart';
import 'package:finance_app/models/transaction_model.dart';
import 'package:finance_app/widget/textformfield_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({Key? key}) : super(key: key);

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

final TextEditingController categoryCntrl = TextEditingController();
final TextEditingController descriptionCntrl = TextEditingController();
final TextEditingController totalBalanceCntrl = TextEditingController();
final TransactionController transactionController = Get.find();
bool isIncome = true; // Varsayılan olarak "Gelir" seçili

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: MyPaddings.paddingLarge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextFormFieldText(text: 'Kategori'),
            CustomTextFormField(
              controller: categoryCntrl,
            ),
            const TextFormFieldText(text: 'Açıklama'),
            CustomTextFormField(
              controller: descriptionCntrl,
            ),
            const TextFormFieldText(text: 'Tutar'),
            CustomTextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: totalBalanceCntrl,
            ),
            CustomDropdown<String>(
              value: isIncome ? 'Gelir' : 'Gider',
              items: ['Gelir', 'Gider']
                  .map((key) => DropdownMenuItem(
                        value: key,
                        child: Text(key),
                      ))
                  .toList(),
              onChanged: _selectStatus,
            ),
            ElevatedButton(
              onPressed: () {
                if (categoryCntrl.text.isEmpty) {
                  // Kategori alanı boşsa hata göster
                  Get.snackbar(
                    'Hata',
                    'Kategori alanı boş bırakılamaz.',
                    backgroundColor: kRedColor,
                    colorText: kBackgroundColor,
                  );
                } else {
                  transactionController.addTransaction(TransactionModel(
                    description: descriptionCntrl.text,
                    icon: Icons.add,
                    category: categoryCntrl.text.trim(),
                    time: DateTime.now(),
                    pay: double.tryParse(totalBalanceCntrl.text) ?? 0.0,
                    isIncome: isIncome,
                  )); // Form alanlarını temizle
                  categoryCntrl.clear();
                  descriptionCntrl.clear();
                  totalBalanceCntrl.clear();
                }
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }

  _selectStatus(String? newValue) {
    setState(() {
      isIncome = newValue == 'Gelir';
      print('Kategori: $newValue, Değer: $isIncome');
    });
  }
}
