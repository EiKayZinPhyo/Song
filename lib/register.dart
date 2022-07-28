import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  // var UserList = ["eikayzin", "12345678"];

  bool _passwordvisible = false;

  var userErrorText = '';
  var passwordErrorText = '';

  void error() {
    if (username.text.isEmpty == true) {
      userErrorText = "Username can't be blank";
    } else {
      userErrorText = '';
    }
    if (password.text.isEmpty == true) {
      passwordErrorText = 'Password can not be blank';
    } else {
      passwordErrorText = '';
    }
  }

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username.text.toString());
    prefs.setString('password', password.text.toString());
    // if (username.text == UserList[0] &&
    //     password.text == UserList[1]) {
    Navigator.pushNamed(context, "loginpage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffb8b8),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(null),
          onPressed: () {},
        ),
        backgroundColor: Color(0xFFffb8b8),
        elevation: 0.0,
        title: const Text(
          "Register",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(width: 300, image: AssetImage('assets/microphone.png')),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                width: double.infinity,
                child: const Text(
                  "Username",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding: const EdgeInsets.all(20),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.person,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'Enter your username',
                  errorText: userErrorText,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: double.infinity,
                child: const Text(
                  "Password",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: password,
                obscureText: !_passwordvisible,
                decoration: InputDecoration(
                  errorText: passwordErrorText,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
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
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    error();
                  });

                  if (username.text.isNotEmpty && password.text.isNotEmpty) {
                    saveData();
                    // } else {
                    //   const snackBar = SnackBar(
                    //     backgroundColor: Colors.red,
                    //     content: Text(
                    //       "Invalid username or Password!",
                    //       style: TextStyle(fontSize: 18),
                    //     ),
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // }
                  }
                },
                style:
                    ElevatedButton.styleFrom(primary: const Color(0xFFff6348)),
                child: const Text("Register"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
