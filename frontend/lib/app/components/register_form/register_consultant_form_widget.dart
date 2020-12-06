import 'package:consultant_app/app/components/category_select/category_select_widget.dart';
import 'package:consultant_app/app/services/consultant_service.dart';
import 'package:consultant_app/app/utils/http_error_utils.dart';
import 'package:flutter/material.dart';

class RegisterConsultantFormWidget extends StatelessWidget {
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
    return Form(
      key: form,
      autovalidate: true,
      child: Column(
        children: [
          CategorySelectWidget(
              onChanged: (value) => formData['specialization'] = value),
          SizedBox(height: 12),
          TextFormField(
            onSaved: (value) => formData['name'] = value,
            validator: isRequired('O campo de nome é obrigatório'),
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                labelText: "Nome",
                hintText: "Digite seu nome completo"),
          ),
          SizedBox(height: 12),
          TextFormField(
            onSaved: (value) => formData['email'] = value,
            validator: isRequired('O campo de email é obrigatório'),
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
            validator: isRequired('Digite sua senha corretamente'),
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

                await ConsultantService.create(formData);

                Navigator.of(context).pop('Consultor criado com sucesso =)');
              } on HttpError catch (e) {
                var errorsMapping = {
                  HttpErrorTypes.serverNotFound:
                      'Erro ao se comunicar com o servidor!! Por favor verifique sua conexão com a internet',
                  HttpErrorTypes.unauthorized:
                      'Você não tem autorização para realizar essa ação, certifique que tem os acessos necessários para realizar essa operação',
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
        ],
      ),
    );
  }
}
