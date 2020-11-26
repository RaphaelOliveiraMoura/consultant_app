import 'package:flutter/material.dart';

class AddContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar vídeo'), actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/login');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.exit_to_app, size: 26.0),
          ),
        )
      ]),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 24, left: 26, right: 26, bottom: 12),
            child: Column(
              children: [
                TextFormField(
                  controller: null,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      labelText: "Link video youtube",
                      hintText: "Digite o link do video do youtube"),
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: null,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      labelText: "Título",
                      hintText: "Digite o título do seu conteúdo"),
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: null,
                  textInputAction: TextInputAction.send,
                  maxLines: 8,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      labelText: "Descrição",
                      hintText: "Digite uma descrição para seu contéudo"),
                ),
                SizedBox(height: 18),
                RaisedButton(
                  onPressed: () {},
                  child: Text('ADICIONAR'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
