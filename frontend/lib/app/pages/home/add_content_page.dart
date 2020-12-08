import 'package:consultant_app/app/services/login_service.dart';
import 'package:consultant_app/app/services/video_content_service.dart';
import 'package:flutter/material.dart';

class AddContentPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final form = GlobalKey<FormState>();
  final Map<String, Object> formData = {};

  isRequired(String requiredMessage) {
    return (value) {
      if (value.isEmpty) {
        return requiredMessage;
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Adicionar vídeo'), actions: [
        GestureDetector(
          onTap: () {
            LoginService.logout().then((result) {
              Navigator.of(context).pushReplacementNamed('/login');
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.exit_to_app, size: 26.0),
          ),
        )
      ]),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: form,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 24, left: 26, right: 26, bottom: 12),
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (value) => formData['youtubeUrl'] = value,
                    validator: isRequired('Adicione um link do youtube válido'),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        labelText: "Link video youtube",
                        hintText: "Digite o link do video do youtube"),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    onSaved: (value) => formData['title'] = value,
                    validator: isRequired('O título é um campo obrigátorio'),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        labelText: "Título",
                        hintText: "Digite o título do seu conteúdo"),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    onSaved: (value) => formData['description'] = value,
                    validator: isRequired(
                        'Digite uma breve descrição para seu conteúdo'),
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
                    onPressed: () async {
                      if (!form.currentState.validate()) {
                        return;
                      }

                      try {
                        form.currentState.save();

                        await VideoContentService.saveContent(formData);

                        form.currentState.reset();

                        final snackBar = SnackBar(
                            content: Text('Conteúdo adicionado com sucesso =)'),
                            backgroundColor: Colors.green);

                        _scaffoldKey.currentState.showSnackBar(snackBar);
                      } catch (e) {
                        final snackBar = SnackBar(
                            content: Text(
                                'Verifique se preencheu todas as informações do formulário corretamente'),
                            backgroundColor: Colors.green);

                        _scaffoldKey.currentState.showSnackBar(snackBar);
                      }
                    },
                    child: Text('ADICIONAR'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
