import 'dart:io';

// import 'package:atividade1/routes.dart';

import 'package:brag/model/login_class.dart';
import 'package:brag/pages/camera_page.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  Color color = const Color.fromARGB(0xFF, 0x40, 0xBF, 0xFF);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double sideLenght = 100;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value?.isEmpty ?? false) {
      return "O campo não pode ser vazio";
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value != null && value.length < 8) {
      return "Digite pelo menos 8 caracteres!";
    } else {
      return null;
    }
  }

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  void _login() {
    // A _key será útil aqui para invocarmos a validação dos formulário.
    if (_formKey.currentState?.validate() ?? false) {
      final email = emailController.text;
      final password = passwordController.text;
      final login = LoginClass(
        user: email,
        password: password,
      );
    } else {
      // Mostra um erro ou algum alerta!
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/single_icon_blue.png'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Let's Get Started",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(0xFF, 0x22, 0x32, 0x63),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Create a new account',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(0xFF, 0x90, 0x98, 0xB1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 343,
                  height: 48,
                  child: TextFormField(
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return "Insira seu nome completo";
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    keyboardType: TextInputType.text,
                    controller: nameController,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Full Name',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.person),
                        ),
                        fillColor: Colors.white70,
                        filled: true),
                    // validator: _validateEmail,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 343,
                  height: 48,
                  child: TextFormField(
                    validator: _validateEmail,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    keyboardType: TextInputType.url,
                    controller: emailController,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Your Email',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.email),
                        ),
                        fillColor: Colors.white70,
                        filled: true),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 343,
                  height: 48,
                  child: TextFormField(
                    validator: _validatePassword,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    // controller: passwordController,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Password',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.lock),
                        ),
                        fillColor: Colors.white70,
                        filled: true),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 343,
                  height: 48,
                  child: TextFormField(
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return "Insira uma imagem";
                      }
                      return null;
                    },
                    onChanged: (text) {
                      setState(() {});
                    },
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    controller: imageController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Imagem',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.image),
                        ),
                        fillColor: Colors.white70,
                        filled: true),
                  ),
                ),
              ),
              Container(
                width: 72,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.blue),
                ),
                child: InkWell(
                  onTap: () async {
                    await availableCameras().then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CameraPage(cameras: value))));
                    setState(() {});
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageController.text,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset('assets/images/nophoto.png');
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 57,
                  width: 343,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: color),
                    child: const Text('Sign Up'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Logando'),
                          ),
                        );
                        // Navigator.of(context)
                        //     .pushReplacementNamed(RouterGenerator.homePage);
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "have a account?",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 12, color: color),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
