import 'package:flutter/material.dart';

class RegisterEntrepreneurFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        controller: null,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            labelText: "E-mail",
            hintText: "Digite seu e-mail"),
      ),
      SizedBox(height: 12),
      TextFormField(
        controller: null,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            labelText: "Senha",
            hintText: "Digite sua senha"),
      ),
      SizedBox(height: 12),
      TextFormField(
        controller: null,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            labelText: "Confirmar senha",
            hintText: "Digite sua senha novamente"),
      ),
    ]);
  }
}
