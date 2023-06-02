import 'package:app_gastos/components/adaptative/adaptative_datepicker.dart';
import 'package:flutter/material.dart';

import 'package:app_gastos/components/adaptative/adaptative_button.dart';
import 'package:app_gastos/components/adaptative/adaptative_textfield.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AdaptativeTextfield(
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                labelText: 'Titulo'),
            AdaptativeTextfield(
              controller: _valueController,
              keybordType: const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              labelText: 'Valor (R\$)',
            ),
            AdaptativeDatepicker(
              selectedDate: _selectedDate,
              onDateChanged: (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AdaptativeButton(
                  onPressed: _submitForm,
                  label: 'Adicionar Transação',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
