// ignore: file_names
class Song {
  late String url;
  String title;
  String singername;
  String image;

  Song(
      {required this.url,
      required this.title,
      required this.singername,
      required this.image});
}

class MusciList {
  final List<Song> _mymusiclist = [
    Song(
      image:
          'https://images.pexels.com/photos/1770809/pexels-photo-1770809.jpeg?cs=srgb&dl=pexels-luis-dalvan-1770809.jpg&fm=jpg',
      title: "LaMinLay",
      singername: 'myanmar song',
      url:
          'https://msicoursematerial.s3.us-west-2.amazonaws.com/-La_min_Lay_(getmp3.pro).mp3',
    ),
    Song(
      image: 'https://i.scdn.co/image/ab67616d0000b2738ff7c3580d429c8212b9a3b6',
      title: 'Amazing Day',
      singername: 'Cold Play',
      url:
          'https://msicoursematerial.s3.us-west-2.amazonaws.com/Amazing_Day_(getmp3.pro).mp3',
    ),
    Song(
      image:
          'https://images.genius.com/7063b4e5a2ea364a0c87dba2243eac6b.1000x1000x1.jpg',
      title: 'Please Please',
      singername: 'The Smith',
      url:
          'https://msicoursematerial.s3.us-west-2.amazonaws.com/The_Smiths_-_Please_Please_Please_(getmp3.pro).mp3',
    ),
    Song(
      image:
          'https://media.socastsrm.com/wordpress/wp-content/blogs.dir/2900/files/2022/03/selena-and-coldplay.jpeg',
      title: 'Let Somebody Go',
      singername: 'Cold Play and Selena Gomez',
      url:
          'https://msicoursematerial.s3.us-west-2.amazonaws.com/Coldplay+X+Selena+Gomez+-+Let+Somebody+Go+(Official+Video).mp3',
    ),
    Song(
      image:
          "https://images.genius.com/31c7d09c4aa1b324bb911d0db72453a3.1000x1000x1.jpg",
      title: "Night Changes",
      singername: "One Direction",
      url:
          "https://drive.google.com/uc?export=view&id=1JkJggiaX_vQaFKHdWQ8TX0tuQ7UpL23-",
    ),
    Song(
      title: "Heat Waves",
      image:
          "https://upload.wikimedia.org/wikipedia/en/b/b0/Glass_Animals_-_Heat_Waves.png",
      singername: "Glass Animals",
      url:
          "https://drive.google.com/uc?export=view&id=15B8vLhKXbUljr060Y5vo8V9XjJ37NTpG",
    )
  ];
  String getUrl(int index) {
    return _mymusiclist[index].url;
  }

  String getTitle(int index) {
    return _mymusiclist[index].title;
  }

  String getSingerName(int index) {
    return _mymusiclist[index].singername;
  }

  int getLength() {
    return _mymusiclist.length;
  }

  String getImage(int index) {
    return _mymusiclist[index].image;
  }
}
