import 'dart:typed_data';

import 'package:ebook_jotter/import/imports.dart';
import 'package:ebook_jotter/models/Model.dart';
import 'package:ebook_jotter/pages/ReadingPage/ReadingPage.dart';
import 'package:ebook_jotter/providers/DataProvider.dart';
import 'package:native_pdf_renderer/native_pdf_renderer.dart';

class BookInfo extends StatelessWidget {
  final String? text;

  BookInfo({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      width: ScreenUtil().screenWidth,
      // height: ScreenUtil().setHeight(250),
      child: ValueListenableBuilder<Box<pdfModels>>(
          valueListenable: DataProvider.openHiveBox().listenable(),
          builder: (context, data, child) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: data.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (data.length > index) {
                  print(index);
                  pdfModels? pdfmodel = data.getAt(index);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReadingPage(pdfmodel: pdfmodel)),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      margin: EdgeInsets.only(left: 10, right: 10),
                      // color: Colors.cyanAccent,
                      height: ScreenUtil().setHeight(150),
                      width: ScreenUtil().screenWidth,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment(0, -0.8),
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              height: ScreenUtil().setHeight(160),
                              width: ScreenUtil().setWidth(140),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  image: DecorationImage(
                                      image: MemoryImage(pdfmodel!.imageFile!)),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              // margin: const EdgeInsets.only(left: 20,right: 20),

                              height: ScreenUtil().setHeight(30),
                              width: ScreenUtil().setWidth(280),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 35,
                                      spreadRadius: 2,
                                      blurStyle: BlurStyle.outer,
                                      color: Colors.black.withOpacity(0.2),
                                    )
                                  ]),
                              child: Align(
                                alignment: Alignment(0, 0.4),
                                child: Text(pdfmodel.bookName!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: ScreenUtil().setSp(11),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return IconButton(
                    onPressed: () async {
                      pickBook(context);
                    },
                    icon: Icon(Icons.add));
              },
            );
          }),
    );
  }
}

final TextEditingController? textController = new TextEditingController();
pickBook(context) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  final directory = await getApplicationDocumentsDirectory();

  if (result != null) {
    //get pdf file
    PlatformFile pdfFile = result.files.first;
    // saving  all file info as list for accesibility
    List pdfFileList = [
      pdfFile.name,
      pdfFile.bytes,
      pdfFile.size,
      pdfFile.extension,
      pdfFile.path
    ];
    //getting pdf filePath
    String? filePath = pdfFile.path;

    // convert first page to image
    final document = await PdfDocument.openFile(filePath!);
    final page = await document.getPage(1);
    final coverImage =
        await page.render(width: page.width, height: page.height);
    await page.close();

    // convert image file to bytes
    Uint8List? coverImageString = coverImage?.bytes;

    BookNameDialog(pdfFileList, coverImageString, directory, context);
  } else {
    // User canceled the picker
  }
}

//dialog to write book name
Future BookNameDialog(pdfFileList, coverImageString, directory, context) =>
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Write book name"),
              content: TextField(
                controller: textController,
                autofocus: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      var model =
                          Provider.of<DataProvider>(context, listen: false);
                      model.pdfmodel = pdfModels(
                          pdfFileList: pdfFileList,
                          imageFile: coverImageString,
                          pageNumber: 1,
                          notePath: directory.path,
                          bookName: textController?.text,
                          noteFile: []);
                      Navigator.pushNamed(context, '/second');
                    },
                    child: Text("Ok"))
              ],
            ));
