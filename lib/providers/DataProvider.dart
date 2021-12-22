import 'dart:typed_data';

import 'package:ebook_jotter/import/imports.dart';
import 'package:ebook_jotter/main.dart';
import 'package:ebook_jotter/models/Model.dart';
import 'package:native_pdf_renderer/native_pdf_renderer.dart';

class DataProvider extends ChangeNotifier {
  final TextEditingController? textController = new TextEditingController();

  static Box<pdfModels>  openHiveBox() => Hive.box("BooksDatabase");

  //dialog to write book name
  Future BookNameDialog(file, coverImageString, context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Write book name"),
    
      content: TextField(
        controller: textController ,
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
        ),
      ),
        actions: [
      
        TextButton(onPressed: ()  {
          Navigator.of(context).pop();
       
              addToHive(pdfModels(filepath:file ,imageFile: coverImageString ,pageNumber: 1, notePath: '', bookName:textController?.text ));
        }, child: Text("Ok"))
      ],
    )


  );

  //adds instance of class to hive database
  addToHive(pdfModels pdfModel) async {
    Box  box = DataProvider.openHiveBox();// adds to database
    box.add(pdfModel);
    notifyListeners();
   box.isEmpty ? print ("true") : print ("false");
  }

  pickBook(context) async {
    
   

     FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        //get pdf path
          String? file = result.files.single.path;

          // convert first page to image
          final document = await PdfDocument.openFile(file!);
          final page = await document.getPage(1);
          final coverImage = await page.render(width: page.width, height: page.height);
          await page.close();
         
         // convert image file in bytes to string
        Uint8List? coverImageString = coverImage?.bytes;

        BookNameDialog(file,coverImageString, context );
       

          
 } 
 else {
                         // User canceled the picker
                    }
  }

//Todo implement pick book function which gets filepath and pdf cover pic
//reading efficiently from hive db
//notes....saving notes 



} 