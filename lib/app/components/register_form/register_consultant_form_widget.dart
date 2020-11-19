import 'package:flutter/material.dart';

class RegisterConsultantFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
            isExpanded: true,
            value: 'Recursos Humanos',
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                labelText: "Tipo",
                hintText: "Digite seu nome completo"),
            items: <String>['Recursos Humanos', 'TI', 'Financeiro']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {}),
        SizedBox(height: 12),
        TextFormField(
          controller: null,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              labelText: "Nome",
              hintText: "Digite seu nome completo"),
        ),
        SizedBox(height: 12),
        TextFormField(
          controller: null,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              labelText: "E-mail",
              hintText: "Digite seu e-mail"),
        ),
        SizedBox(height: 12),
        TextFormField(
          controller: null,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              labelText: "Senha",
              hintText: "Digite sua senha"),
        ),
        SizedBox(height: 12),
        TextFormField(
          controller: null,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              labelText: "Confirmar senha",
              hintText: "Digite sua senha novamente"),
        ),
      ],
    );
  }
}
