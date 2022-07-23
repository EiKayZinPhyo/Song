import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:song/login.dart';

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
        initialRoute: 'loginpage',
        routes: {
          'loginpage': (context) => LoginPage(),
          'musicpage': (context) => MyHomePage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List musicList = [
    {
      'image':
          'https://images.pexels.com/photos/1770809/pexels-photo-1770809.jpeg?cs=srgb&dl=pexels-luis-dalvan-1770809.jpg&fm=jpg',
      'title': "LaMinLay",
      'singername': 'myanmar song',
      'url':
          'https://msicoursematerial.s3.us-west-2.amazonaws.com/-La_min_Lay_(getmp3.pro).mp3',
    },
    {
      'image':
          'https://i.scdn.co/image/ab67616d0000b2738ff7c3580d429c8212b9a3b6',
      'title': 'Amazing Day',
      'singername': 'Cold Play',
      'url':
          'https://msicoursematerial.s3.us-west-2.amazonaws.com/Amazing_Day_(getmp3.pro).mp3',
    },
    {
      'image':
          'https://images.genius.com/7063b4e5a2ea364a0c87dba2243eac6b.1000x1000x1.jpg',
      'title': 'Please Please',
      'singername': 'The Smith',
      'url':
          'https://msicoursematerial.s3.us-west-2.amazonaws.com/The_Smiths_-_Please_Please_Please_(getmp3.pro).mp3',
    },
    {
      'image':
          'https://media.socastsrm.com/wordpress/wp-content/blogs.dir/2900/files/2022/03/selena-and-coldplay.jpeg',
      'title': 'Let Somebody Go',
      'singername': 'Cold Play and Selena Gomez',
      'url':
          'https://msicoursematerial.s3.us-west-2.amazonaws.com/Coldplay+X+Selena+Gomez+-+Let+Somebody+Go+(Official+Video).mp3',
    },
    {
      "image":
          "https://images.genius.com/31c7d09c4aa1b324bb911d0db72453a3.1000x1000x1.jpg",
      "title": "Night Changes",
      "singername": "One Direction",
      'url':
          "https://drive.google.com/uc?export=view&id=1JkJggiaX_vQaFKHdWQ8TX0tuQ7UpL23-",
    },
    {
      'title': "Heat Waves",
      'image':
          "https://upload.wikimedia.org/wikipedia/en/b/b0/Glass_Animals_-_Heat_Waves.png",
      'singername': "Glass Animals",
      'url':
          "https://drive.google.com/uc?export=view&id=15B8vLhKXbUljr060Y5vo8V9XjJ37NTpG",
    },
  ];

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
      backgroundColor: const Color(0xFfFB9F63),
      appBar: AppBar(
        backgroundColor: const Color(0xFfFB9F63),
        title: const Text(
          "My Playlist",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: musicList.length,
              itemBuilder: (context, index) => ListTileWidget(
                onTap: () {
                  playmusic(musicList[index]['url']);
                  setState(() {
                    currentimage = musicList[index]['image'];
                    currenttitle = musicList[index]['title'];
                    currentsingername = musicList[index]['singername'];
                    // currenturl = musicList[index]['url'];
                  });
                },
                image: musicList[index]['image'],
                title: musicList[index]['title'],
                singername: musicList[index]['singername'],
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
