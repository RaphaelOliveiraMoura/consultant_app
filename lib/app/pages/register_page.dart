import 'package:consultant_app/app/components/register_form/register_consultant_form_widget.dart';
import 'package:consultant_app/app/components/register_form/register_entrepreneur_form_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 26, right: 26, bottom: 12),
            child: Column(
              children: [
                Image.network(
                  'https://catracalivre.com.br/wp-content/uploads/2015/04/empreendedor.png',
                  width: 180,
                ),
                SizedBox(height: 26),
                Text(
                  'Categoria',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                      value: 'entrepreneur',
                      groupValue: 'category',
                      onChanged: (_) {},
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    Text('Empreendedor'),
                    SizedBox(width: 32),
                    Radio(
                      value: 'consultant',
                      groupValue: 'category',
                      onChanged: (_) {},
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    Text('Consultor')
                  ],
                ),
                SizedBox(height: 12),
                // RegisterEntrepreneurFormWidget(),
                RegisterConsultantFormWidget(),
                SizedBox(height: 18),
                RaisedButton(
                  onPressed: () {},
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
