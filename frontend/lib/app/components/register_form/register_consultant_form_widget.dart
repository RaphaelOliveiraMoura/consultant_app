import 'package:consultant_app/app/components/category_select/category_select_widget.dart';
import 'package:flutter/material.dart';

class RegisterConsultantFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategorySelectWidget(),
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
