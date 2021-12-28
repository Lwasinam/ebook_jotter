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
   final TextEditingController? textController = new TextEditingController();




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
      final directory = await getApplicationDocumentsDirectory();
 

      if (result != null) {
        //get pdf file
       PlatformFile pdfFile = result.files.first;
       // saving  all file info as list for accesibility
          List pdfFileList = [pdfFile.name, pdfFile.bytes, pdfFile.size,pdfFile.extension, pdfFile.path];
         //getting pdf filePath
         String? filePath = pdfFile.path;

          // convert first page to image
          final document = await PdfDocument.openFile(filePath!);
          final page = await document.getPage(1);
          final coverImage = await page.render(width: page.width, height: page.height);
          await page.close();
         
         // convert image file to bytes
        Uint8List? coverImageString = coverImage?.bytes;

        BookNameDialog(pdfFileList,coverImageString, directory, context );
       

          
 } 
 else {
                         // User canceled the picker
      }
  }


  //dialog to write book name
  Future BookNameDialog(pdfFileList, coverImageString, directory, context) => showDialog(
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
          var model = Provider.of<DataProvider>(context, listen: false);
          model.pdfmodel =  pdfModels(pdfFileList:pdfFileList ,imageFile: coverImageString ,pageNumber: 1, notePath: directory.path, bookName:textController?.text, noteFile: [] );
        }, child: Text("Ok"))
      ],
    )


  );












}
