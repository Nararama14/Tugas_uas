import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_app_2110020031/Home/MainMenu.dart';

class ProfilePage extends StatelessWidget {

  final double coverHaight = 280;
  final double profilHaigt = 144;
  
  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),

        title: const Text("My Profil",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            
      ),

      body : ListView(
            children: <Widget>[
            buildTop(),
            BuildContent(),
            ],
      ),
    );
  }

  Widget buildTop(){
      final top = coverHaight - profilHaigt / 2;
      final bottom = profilHaigt / 2;

    return Stack( 
      clipBehavior: Clip.none,
      alignment : Alignment.center,
      children : [   
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(), 
        ),
        Positioned(
          top: top,
          child : buildProfileIm(),
        ),
       ],
      );


  }


  Widget buildCoverImage() => Container(
    color: Colors.blue.shade300 ,
    child: Image.network(
        'https://source.unsplash.com/weekly?coding',
        width: double.infinity,
        height: coverHaight,
        fit: BoxFit.cover,
    ),
  );

  Widget buildProfileIm() => CircleAvatar(
    radius: profilHaigt / 2,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: AssetImage('assets/images/Profil.jpg'
    ),
);


  Widget  BuildContent() => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         const SizedBox(height: 16), 
        Text(
          'RAMADHAN',
           style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, ),
            ),

           const SizedBox(height: 16), 
           Text(
            '5A REGULER BANJARMASIN',
            style: TextStyle(fontSize: 20, height : 1.4 ),
           ),


           const SizedBox(height: 16), 
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              buildSosialicon(CupertinoIcons.photo_camera),
              const SizedBox(width: 16),
             buildSosialicon(CupertinoIcons.mail),
              const SizedBox(width: 16),
              ],
           ),

          const SizedBox(height: 25), 
           Text(
            ' NPM : 2110020031',
            style: TextStyle(fontSize: 20, height : 1.4 ),
           ),
            const SizedBox(height: 16), 
           Text(
            'Kontak : 082159305132',
            style: TextStyle(fontSize: 20, height : 1.4 ),
           ),
            const SizedBox(height: 16),
            Text(
            'Alamat : Andyaksaya 6',
            style: TextStyle(fontSize: 20, height : 1.4 ),
           ),
                    const SizedBox(height: 100),
            Text(
            'myportofolio : nararama14.github.io/portofolio',
            style: TextStyle(fontSize: 14, height : 1.4 ),
           ),




      ],
    ),
  );

  Widget buildSosialicon(IconData icon) => CircleAvatar(
    radius: 25,
    child: Material(
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
            child: Center(child: Icon(icon, size: 32)),
      ),
    ),


  );




}
