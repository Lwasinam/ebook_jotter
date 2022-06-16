

// ignore_for_file: unused_field

import 'dart:io';

import 'package:ebook_jotter/import/imports.dart';
import 'package:ebook_jotter/models/Model.dart';
//import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
//import 'package:flutter_balloon_slider/flutter_balloon_slider.dart';
//import 'package:syncfusion_flutter_sliders/sliders.dart';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:flutter_quill/flutter_quill.dart';

class ReadingPage extends StatefulWidget {
//QuillController _quillController; QuillController.basic();
pdfModels? pdfmodel; 


 

//PlatformFile? pdfmodel.

ReadingPage({this.pdfmodel});
  @override
  _ReadingPageState createState() => _ReadingPageState();
}
class _ReadingPageState extends State<ReadingPage> {
  
 
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Reading Page")),
      body: SlidingUpPanel(
       minHeight: ScreenUtil().setHeight(30),
        panel: Center(child: Text("hiiiiiiiiiiiiiiiii")),
        body: SfPdfViewer.file(
          
          File(widget.pdfmodel!.pdfFileList![4]))
        
        
        
        )
      );
      //child: SfPdfViewer.file(file),
    
  }
}