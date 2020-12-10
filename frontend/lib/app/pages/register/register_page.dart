import 'package:consultant_app/app/components/register_form/register_consultant_form_widget.dart';
import 'package:consultant_app/app/components/register_form/register_entrepreneur_form_widget.dart';
import 'package:flutter/material.dart';

enum RegisterFormTypes { Entrepreneur, Consultant }

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterFormTypes currentFormActive = RegisterFormTypes.Entrepreneur;

  String imageUrl = 'assets/empreendedor.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Cadastre-se')),
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 26, right: 26, bottom: 12),
              child: Column(
                children: [
                  Image.asset(imageUrl, width: 180),
                  SizedBox(height: 4),
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
                            imageUrl = 'assets/empreendedor.png';
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Text('Microempreendedor'),
                      SizedBox(width: 32),
                      Radio(
                        value: RegisterFormTypes.Consultant,
                        groupValue: currentFormActive,
                        onChanged: (RegisterFormTypes value) {
                          setState(() {
                            currentFormActive = value;
                            imageUrl = 'assets/consultor.png';
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Text('Consultor')
                    ],
                  ),
                  SizedBox(height: 12),
                  currentFormActive == RegisterFormTypes.Entrepreneur
                      ? RegisterEntrepreneurFormWidget()
                      : RegisterConsultantFormWidget(),
                ],
              ),
            ),
          ),
        ));
  }
}
