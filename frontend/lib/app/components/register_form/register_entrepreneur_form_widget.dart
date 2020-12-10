import 'package:consultant_app/app/services/entrepreneurs_service.dart';
import 'package:consultant_app/app/utils/http_error_utils.dart';
import 'package:consultant_app/app/utils/validator_utils.dart';
import 'package:flutter/material.dart';

class RegisterEntrepreneurFormWidget extends StatefulWidget {
  @override
  _RegisterEntrepreneurFormWidgetState createState() =>
      _RegisterEntrepreneurFormWidgetState();
}

class _RegisterEntrepreneurFormWidgetState
    extends State<RegisterEntrepreneurFormWidget> {
  final form = GlobalKey<FormState>();
  final Map<String, Object> formData = {};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      autovalidate: false,
      child: Column(children: [
        TextFormField(
          onSaved: (value) => formData['email'] = value,
          validator: (value) => validateEmail(value),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              labelText: "E-mail",
              hintText: "Digite seu e-mail"),
        ),
        SizedBox(height: 12),
        TextFormField(
          obscureText: true,
          onSaved: (value) => formData['password'] = value,
          validator: isRequired('A senha não pode ser vazia'),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              labelText: "Senha",
              hintText: "Digite sua senha"),
        ),
        SizedBox(height: 12),
        TextFormField(
          obscureText: true,
          onSaved: (value) => formData['confirmPassword'] = value,
          validator: isRequired('Digite sua senha'),
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              labelText: "Confirmar senha",
              hintText: "Digite sua senha novamente"),
        ),
        SizedBox(height: 18),
        RaisedButton(
          onPressed: () async {
            if (!form.currentState.validate()) {
              return;
            }

            try {
              form.currentState.save();

              await EntrepreneursService.create(formData);

              Navigator.of(context).pop('Empreendedor criado com sucesso =)');
            } on HttpError catch (e) {
              var errorsMapping = {
                HttpErrorTypes.serverNotFound:
                    'Erro ao se comunicar com o servidor!! Por favor verifique sua conexão com a internet',
                HttpErrorTypes.unauthorized:
                    'Você não tem autorização para realizar essa ação, certifique que tem os acessos necessários para realizar essa operação',
                'email_already_exists':
                    'Esse email já está em uso, verifique se digitou o email corretamente',
                'password_mismatch':
                    'Senhas não correspondem, confirme se as senhas digitadas são iguais'
              };

              String snackBarErrorMessage = errorsMapping[e.type] ??
                  'Verifique se preencheu todas as informações do formulário corretamente';

              final snackBar = SnackBar(
                  content: Text(snackBarErrorMessage),
                  backgroundColor: Colors.red);

              Scaffold.of(context).showSnackBar(snackBar);
            }
          },
          child: Text('CADASTRAR'),
        )
      ]),
    );
  }
}
