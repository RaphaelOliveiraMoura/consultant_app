import 'package:consultant_app/app/pages/register/register_page.dart';
import 'package:flutter/material.dart';

class RegisterEntrepreneurFormWidget extends StatefulWidget {
  final EntrepreneurFormData entrepreneurFormData;

  RegisterEntrepreneurFormWidget(this.entrepreneurFormData);

  @override
  _RegisterEntrepreneurFormWidgetState createState() =>
      _RegisterEntrepreneurFormWidgetState(entrepreneurFormData);
}

class _RegisterEntrepreneurFormWidgetState
    extends State<RegisterEntrepreneurFormWidget> {
  EntrepreneurFormData entrepreneurFormData;

  _RegisterEntrepreneurFormWidgetState(this.entrepreneurFormData);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        onChanged: (value) => {
          setState(() {
            entrepreneurFormData.email = value;
          })
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            labelText: "E-mail",
            hintText: "Digite seu e-mail"),
      ),
      SizedBox(height: 12),
      TextFormField(
        onChanged: (value) => {
          setState(() {
            entrepreneurFormData.password = value;
          })
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            labelText: "Senha",
            hintText: "Digite sua senha"),
      ),
      SizedBox(height: 12),
      TextFormField(
        onChanged: (value) => {
          setState(() {
            entrepreneurFormData.confirmPassword = value;
          })
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            labelText: "Confirmar senha",
            hintText: "Digite sua senha novamente"),
      ),
    ]);
  }
}
