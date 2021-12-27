import 'dart:typed_data';

import 'package:ebook_jotter/import/imports.dart';
import 'package:ebook_jotter/main.dart';
import 'package:ebook_jotter/models/Model.dart';
import 'package:native_pdf_renderer/native_pdf_renderer.dart';

class DataProvider extends ChangeNotifier {
 

  static Box<pdfModels>  openHiveBox() => Hive.box("BookDatabase");

  pdfModels _pdfodel = pdfModels(bookName: '', filepath: '', notePath: '', pageNumber: 0, imageFile: Uint8List.fromList([00]), noteFile: []);
  
  pdfModels get pdfmodel => _pdfodel;

  set pdfmodel (pdfModels newModel){
    _pdfodel = newModel;
    _addToHive(_pdfodel);
    notifyListeners();

  }


  //adds instance of class to hive database
   _addToHive(pdfModels pdfmodel) async {
    Box  box = DataProvider.openHiveBox();// adds to database
    box.add(pdfmodel);
    notifyListeners();
   box.isEmpty ? print ("true") : print ("false");
  }


//Todo implement pick book function which gets filepath and pdf cover pic
//reading efficiently from hive db
//notes....saving notes 



} 