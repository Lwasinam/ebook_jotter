import 'dart:typed_data';

import 'package:ebook_jotter/import/imports.dart';
import 'package:ebook_jotter/models/Model.dart';
import 'package:ebook_jotter/providers/DataProvider.dart';
import 'package:native_pdf_view/native_pdf_view.dart';



class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}



class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hey There, Import your first book", style: TextStyle(fontSize: 20.sp),),
            SizedBox(height: ScreenUtil().setHeight(50),),
            GestureDetector(
              onTap: ()async{
              

              },
              child: Container(
                height: ScreenUtil().setHeight(60),
                width: ScreenUtil().setHeight(60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 60,
                    spreadRadius: 1,
                  )]
                ),
                child: IconButton(onPressed: () async {
               pickBook(context);
                }, icon: Icon(Icons.add))),
            )
          ],
        ),
      ),
    );
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
          final model = Provider.of<pdfModels>(context).DataProvider().
       
              addToHive(pdfModels(filepath:file ,imageFile: coverImageString ,pageNumber: 1, notePath: '', bookName:textController?.text ));
        }, child: Text("Ok"))
      ],
    )


  );












}
