import 'package:consultant_app/app/services/login_service.dart';
import 'package:consultant_app/app/utils/validator_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum RegisterFormTypes { Entrepreneur, Consultant }

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  RegisterFormTypes currentFormActive = RegisterFormTypes.Entrepreneur;

  bool loading = false;

  Future checkAuth() async {
    try {
      setState(() {
        loading = true;
      });

      var sharedPreferencesInstance = await SharedPreferences.getInstance();

      bool isLoggedIn = sharedPreferencesInstance.getBool('isLoggedIn');

      if (isLoggedIn) {
        Navigator.of(context).pushReplacementNamed('/');
      }
    } catch (e) {} finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    final focus = FocusNode();

    final form = GlobalKey<FormState>();
    final Map<String, Object> formData = {};

    return Scaffold(
      key: _scaffoldKey,
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: SingleChildScrollView(
                child: Form(
                  key: form,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 66, left: 26, right: 26, bottom: 12),
                    child: Column(
                      children: [
                        Image.asset('assets/logo.png', width: 136),
                        SizedBox(height: 42),
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
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                            Text('Microempreendedor'),
                            SizedBox(width: 32),
                            Radio(
                              value: RegisterFormTypes.Consultant,
                              groupValue: currentFormActive,
                              onChanged: (RegisterFormTypes value) {
                                setState(() {
                                  currentFormActive = value;
                                });
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                            Text('Consultor')
                          ],
                        ),
                        TextFormField(
                          onSaved: (value) => formData['email'] = value,
                          validator: (value) => validateEmail(value),
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
                          onSaved: (value) => formData['password'] = value,
                          validator:
                              isRequired('Preencha esse campo com sua senha'),
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
                          onPressed: () async {
                            if (!form.currentState.validate()) {
                              return;
                            }

                            try {
                              form.currentState.save();

                              bool isConsultant = currentFormActive ==
                                  RegisterFormTypes.Consultant;

                              await LoginService.login(
                                  formData: formData,
                                  isConsultant: isConsultant);

                              Navigator.of(context).pushReplacementNamed('/');
                            } catch (e) {
                              final snackBar = SnackBar(
                                  content: Text(
                                      'Login inválido, verifique seus dados novamente'),
                                  backgroundColor: Colors.red);

                              _scaffoldKey.currentState.showSnackBar(snackBar);
                            }
                          },
                          child: Text('LOGIN'),
                        ),
                        SizedBox(height: 34),
                        Text('Não é cadastrado ?'),
                        RaisedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/register')
                                .then((createdMessage) {
                              if (createdMessage is String) {
                                final snackBar = SnackBar(
                                    content: Text(createdMessage),
                                    backgroundColor: Colors.green);

                                _scaffoldKey.currentState
                                    .showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Text('CADASTRE-SE'),
                          color: Colors.greenAccent,
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
