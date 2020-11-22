import 'package:flutter/material.dart';

class CategorySelectWidget extends StatelessWidget {
  final List<String> categoryOptions = [
    'Recursos Humanos',
    'Tecnologia',
    'Financeiro'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        isExpanded: true,
        value: 'Recursos Humanos',
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            labelText: "Categoria",
            hintText: "Digite seu nome completo"),
        items: categoryOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {});
  }
}
