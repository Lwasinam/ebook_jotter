
import 'package:ebook_jotter/import/imports.dart';
import 'package:ebook_jotter/main.dart';
import 'package:flutter/material.dart';

  enum _SelectedTab { home, favorite, search, person }
  
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
     
     // backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(),
              SizedBox(height: ScreenUtil(). setHeight(19),), 
              Recent(),
              SizedBox(height: ScreenUtil(). setHeight(19),), 
              BookInfo(text: "The Bold Guy",),
              Books(),
              SizedBox(height: ScreenUtil(). setHeight(19),), 
              BookInfo(text: "The Bold Guy",),
              SizedBox(height: ScreenUtil(). setHeight(69),), 
            ],
            ),
        ),
      ),
      
    );
  }
}
