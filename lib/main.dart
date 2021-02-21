import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() => runApp(MusicalInstrumentApp());

class MusicalInstrumentApp extends StatelessWidget {
  void playSound(int number) {
    final player = AudioCache();
    player.play('$number.mp3');
  }

  List<String> sure = [
    'El-Felek',
    'En-Nas',
    'El-Fatiha',
    'Al-Kawser',
    'Al-Bakarah',
    'Ali-Imran'
  ];

  Container newSurah(int sura, int suraAudio) => Container(
        margin: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 7))
            ]),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.music_note, color: Colors.blue),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sure[sura],
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Recited by Yasser Dosari',
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    playSound(suraAudio);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Play',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage('images/background2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(30),
                  child: Center(
                    child: Text(
                      'Quran Audio',
                      style: TextStyle(
                          fontFamily: 'NewsReader',
                          fontSize: 40,
                          color: Colors.white),
                    ),
                  ),
                ),
                newSurah(0, 113),
                newSurah(1, 114),
                newSurah(2, 114),
                newSurah(3, 114),
                newSurah(3, 114),
                newSurah(3, 114),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.blue, boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.3)),
          ]),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                  rippleColor: Colors.grey[300],
                  hoverColor: Colors.grey[100],
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100],
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.list,
                      text: 'Likes',
                    ),
                    GButton(
                      icon: Icons.search,
                      text: 'Search',
                    ),
                    GButton(
                      icon: Icons.account_circle,
                      text: 'Profile',
                    ),
                  ],
                  onTabChange: () {}),
            ),
          ),
        ),
      ),
    );
  }
}
