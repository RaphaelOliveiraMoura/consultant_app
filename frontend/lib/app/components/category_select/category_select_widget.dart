import 'package:flutter/material.dart';

class CategorySelectWidget extends StatelessWidget {
  final value;
  final onChanged;
  final validator;
  final label;
  final bool allOptions;

  CategorySelectWidget(
      {this.value,
      this.onChanged,
      this.validator,
      this.allOptions = false,
      this.label});

  final List<String> categoryOptions = [
    'Tecnologia',
    'Recursos Humanos',
    'Financeiro',
    'Gestão financeira',
    'Gestão de marketing',
    'Logística',
    'Planejamento estratégico',
    'Vendas',
  ];

  @override
  Widget build(BuildContext context) {
    if (allOptions && categoryOptions.indexOf('Todos') < 0) {
      categoryOptions.insert(0, 'Todos');
    }

    return DropdownButtonFormField<String>(
        isExpanded: true,
        value: value,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            labelText: label ?? "Categoria",
            hintText: "Selecione a categoria"),
        items: categoryOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
        validator: validator);
  }
}
