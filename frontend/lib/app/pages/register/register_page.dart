import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:consultant_app/app/components/register_form/register_consultant_form_widget.dart';
import 'package:consultant_app/app/components/register_form/register_entrepreneur_form_widget.dart';
import 'package:flutter/material.dart';

enum RegisterFormTypes { Entrepreneur, Consultant }

class EntrepreneurFormData {
  String email;
  String password;
  String confirmPassword;

  EntrepreneurFormData({this.email, this.password, this.confirmPassword});
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterFormTypes currentFormActive = RegisterFormTypes.Entrepreneur;

  EntrepreneurFormData entrepreneurFormData = new EntrepreneurFormData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 26, right: 26, bottom: 12),
            child: Column(
              children: [
                Image.network(
                  'https://catracalivre.com.br/wp-content/uploads/2015/04/empreendedor.png',
                  width: 180,
                ),
                SizedBox(height: 26),
                Text(
                  'Tipo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                      value: RegisterFormTypes.Entrepreneur,
                      groupValue: currentFormActive,
                      onChanged: (RegisterFormTypes value) {
                        setState(() {
                          currentFormActive = value;
                        });
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    Text('Empreendedor'),
                    SizedBox(width: 32),
                    Radio(
                      value: RegisterFormTypes.Consultant,
                      groupValue: currentFormActive,
                      onChanged: (RegisterFormTypes value) {
                        setState(() {
                          currentFormActive = value;
                        });
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    Text('Consultor')
                  ],
                ),
                SizedBox(height: 12),
                currentFormActive == RegisterFormTypes.Entrepreneur
                    ? RegisterEntrepreneurFormWidget(entrepreneurFormData)
                    : RegisterConsultantFormWidget(),
                SizedBox(height: 18),
                RaisedButton(
                  onPressed: () async {
                    http.post('https://c302809fc454.ngrok.io/entrepreneurs',
                        headers: {
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonEncode({
                          "email": entrepreneurFormData.email,
                          "password": entrepreneurFormData.password,
                          "confirmPassword":
                              entrepreneurFormData.confirmPassword
                        }));
                  },
                  child: Text('CADASTRAR'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
