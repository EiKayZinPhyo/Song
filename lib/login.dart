import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  var UserList = ["eikayzin", "12345678"];

  bool _passwordvisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFfFB9F63),
      appBar: AppBar(
        backgroundColor: Color(0xFfFB9F63),
        elevation: 0.0,
        title: const Text(
          "LoginPage",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(width: 100, image: AssetImage('assets/imgg.jpg')),
              const Padding(
                padding: EdgeInsets.only(right: 300.0, bottom: 10),
                child: Text(
                  "Username",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1, 5),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: username,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: FaIcon(
                            FontAwesomeIcons.person,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                        hintText: 'Enter your username',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 300.0, bottom: 10),
                child: Text(
                  "Password",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1, 5),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: password,
                      obscureText: !_passwordvisible,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(10),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FaIcon(
                            FontAwesomeIcons.lock,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                        hintText: 'Enter your Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordvisible = !_passwordvisible;
                            });
                          },
                          icon: Icon(
                            _passwordvisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (username.text == UserList[0] &&
                        password.text == UserList[1]) {
                      Navigator.pushNamed(context, "musicpage");
                    } else {
                      const snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Invalid username or Password!",
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFf4bcffa)),
                  child: const Text("Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
