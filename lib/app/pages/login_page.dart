import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final focus = FocusNode();

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 66, left: 26, right: 26, bottom: 12),
            child: Column(
              children: [
                Image.network(
                  'https://images.vexels.com/media/users/3/156177/isolated/preview/7f4abdb379d195b2fd525d0bf5f303a5-l--mpada-com-sol-dentro-do---cone-by-vexels.png',
                  width: 136,
                ),
                SizedBox(height: 42),
                TextFormField(
                  controller: null,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(focus);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      labelText: "E-mail",
                      hintText: "Digite seu e-mail"),
                ),
                SizedBox(height: 18),
                TextFormField(
                  controller: null,
                  obscureText: true,
                  focusNode: focus,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      labelText: "Senha",
                      hintText: "Digite sua senha"),
                ),
                SizedBox(height: 26),
                RaisedButton(
                  onPressed: () {},
                  child: Text('LOGIN'),
                ),
                SizedBox(height: 34),
                Text('Não é cadastrado ?'),
                RaisedButton(
                  onPressed: () {},
                  child: Text('CADASTRE-SE'),
                  color: Colors.greenAccent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
