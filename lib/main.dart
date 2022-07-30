import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:song/login.dart';
import 'package:song/musicList.dart';
import 'package:song/register.dart';
import 'package:song/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'screenpage',
        routes: {
          'screenpage': (context) => ScreenPage(),
          'loginpage': (context) => LoginPage(),
          'musicpage': (context) => MyHomePage(),
          'registerpage': (context) => RegisterPage()
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MusciList list = MusciList();
  String currentimage = '';
  String currenttitle = '';
  String currentsingername = '';
  String currenturl = '';
  IconData btnIcon = Icons.play_arrow;

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  playmusic(String url) async {
    if (isPlaying && currenturl != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currenturl = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
          btnIcon = Icons.pause;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffb8b8),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('username');
              Navigator.pushNamed(context, 'screenpage');
            },
          ),
        ],
        backgroundColor: const Color(0xFFffb8b8),
        title: const Text(
          "My Playlist",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.getLength(),
              itemBuilder: (context, index) => ListTileWidget(
                onTap: () {
                  playmusic(list.getUrl(index));
                  setState(() {
                    currentimage = list.getImage(index);
                    currenttitle = list.getTitle(index);
                    currentsingername = list.getSingerName(index);
                    // currenturl = musicList[index]['url'];
                  });
                },
                image: list.getImage(index),
                title: list.getTitle(index),
                singername: list.getSingerName(index),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(currentimage),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        currenttitle,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Cinzel'),
                      ),
                      Text(
                        currentsingername,
                        style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontFamily: 'Edu'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    onPressed: () {
                      if (isPlaying) {
                        audioPlayer.pause();
                        setState(() {
                          btnIcon = Icons.play_arrow;
                          isPlaying = false;
                        });
                      } else {
                        audioPlayer.resume();
                        setState(() {
                          btnIcon = Icons.pause;
                          isPlaying = true;
                        });
                      }
                    },
                    iconSize: 40.0,
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget ListTileWidget({image, title, singername, onTap, icon}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(image),
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, color: Colors.black, fontFamily: 'Cinzel'),
                ),
                Text(
                  singername,
                  style: const TextStyle(
                      fontSize: 10, color: Colors.black, fontFamily: 'Edu'),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
