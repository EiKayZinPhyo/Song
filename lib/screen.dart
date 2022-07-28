import 'package:flutter/material.dart';

class ScreenPage extends StatelessWidget {
  const ScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFfF8EFBA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/microphone.png',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'registerpage');
            },
            style: ElevatedButton.styleFrom(primary: Colors.pink),
            child: const Text('Register'),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'loginpage');
            },
            style: ElevatedButton.styleFrom(primary: Colors.pink),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
