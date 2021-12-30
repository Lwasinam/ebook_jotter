

import 'dart:io';

import 'package:ebook_jotter/import/imports.dart';
import 'package:ebook_jotter/models/Model.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class ReadingPage extends StatefulWidget {

pdfModels? pdfmodel;
 

//PlatformFile? pdfmodel.

ReadingPage({this.pdfmodel});
  @override
  _ReadingPageState createState() => _ReadingPageState();
 

}
class _ReadingPageState extends State<ReadingPage> {
   static final int _initialPage = 1;
  int _actualPageNumber = _initialPage, _allPagesCount = 0;
  bool isSampleDoc = true;
  late PdfController _pdfController;

  @override
  void initState() {
    _pdfController = PdfController(
      document: PdfDocument.openFile(widget.pdfmodel!.pdfFileList![4]),
      initialPage: _initialPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Reading Page")),
      body: SlidingUpPanel(
        panel: Center(child: Text("hiiiiiiiiiiiiiiiii")),
        body: PdfView(
          backgroundDecoration: BoxDecoration(
            color: Colors.white24
          ),
        controller: _pdfController,
        pageBuilder: (
          Future<PdfPageImage> pageImage,
          int index,
          PdfDocument document,
        ) => PhotoViewGalleryPageOptions(
        imageProvider: PdfPageImageProvider(
          pageImage,
          index,
          document.id,
        ),
        minScale: PhotoViewComputedScale.contained * 1.0,
        maxScale: PhotoViewComputedScale.contained * 3.0,
        initialScale: PhotoViewComputedScale.contained * 1.0,
        heroAttributes: PhotoViewHeroAttributes(tag: '${document.id}-$index'),
          ),
      ),
      )
      );
      //child: SfPdfViewer.file(file),
    
  }
}