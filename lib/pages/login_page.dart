// import 'package:atividade1/routes.dart';
import 'package:brag/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color color = const Color.fromARGB(0xFF, 0x100, 0xBF, 0xFF);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  double widthLenght = 300;
  double heightLenght = 57;

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[700],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 100),
            //   child: Container(
            //     alignment: Alignment.center,
            //     child: Image.asset('assets/images/single_icon_blue.png'),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: AnimatedContainer(
                    width: selected ? 100.0 : 100.0,
                    height: selected ? 100.0 : 100.0,
                    color: selected ? Colors.white : Colors.transparent,
                    alignment: selected
                        ? Alignment.center
                        : AlignmentDirectional.center,
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    child: selected
                        ? const FlutterLogo(size: 100)
                        : Text(
                            'BRAGA CLUBE',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Poppins'),
                          ),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                height: 48,
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)),
                      hintText: 'Email',
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.email),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                height: 48,
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: true,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)),
                      hintText: 'Password',
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.lock),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 57,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: color),
                  child: const Text('Entrar'),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RouterGenerator.initialPage);
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'OR',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 57,
                width: 300,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Image.asset('lib/assets/google.png'),
                      ),
                      const Text(
                        'Login with Google',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 57,
                width: 300,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Image.asset('lib/assets/facebook.png'),
                      ),
                      const Text(
                        'Login with facebook',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 12, color: color),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Don't have account?",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  TextButton(
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 12, color: color),
                    ),
                    onPressed: () {
                      // Navigator.of(context)
                      //     .pushNamed(RouterGenerator.registerForm);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
