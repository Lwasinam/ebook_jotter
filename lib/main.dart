import 'dart:io';

import 'package:ebook_jotter/models/Model.dart';
import 'package:ebook_jotter/pages/WelcomeScreen/WelcomeScreen.dart';
import 'package:ebook_jotter/providers/DataProvider.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';


import 'package:path_provider/path_provider.dart'  as pathProvider;

import 'package:ebook_jotter/import/imports.dart';
import 'package:flutter/services.dart';

//late Box box;
Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();

Hive.registerAdapter<pdfModels>(pdfModelsAdapter());
await Hive.initFlutter();
await Hive.openBox<pdfModels>('BookDatabase');
//Hive.box<pdfModels>("BookDatabase").deleteFromDisk();

 SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
statusBarColor: Colors.black,
statusBarIconBrightness: Brightness.light));

  runApp( ChangeNotifierProvider(
      create: (context) => DataProvider(),
      
    child: MyApp()));
 
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
 
  @override
  Widget build(BuildContext context) {

   
  
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
          
      //  primarySwatch: Colors.blue,
      ),
      home:FloatingNavBar(
        cardWidth: 20,
        borderRadius: 30,
        unselectedIconColor: Colors.black,
        selectedIconColor: Colors.blue,
        color: Colors.white,
        items: [
          FloatingNavBarItem(
            iconData: Icons.home,
            title: 'Home',
            page:   Hive.box<pdfModels>("BookDatabase").isEmpty ? WelcomeScreen() : HomePage()
            // WelcomeScreen()
            // Hive.box<pdfModels>("BookDatabase").isEmpty ? WelcomeScreen() : HomePage()
          ),
          FloatingNavBarItem(
            iconData: Icons.library_books_rounded,
            title: 'Account',
            page: JottingPage(),
          ),
            FloatingNavBarItem(
            iconData: Icons.account_circle,
            title: 'Profile',
            page: ProfilePage(),
          )
        ],
       
        hapticFeedback: true,
        horizontalPadding: 30,
      ),
    ));
  }
}
