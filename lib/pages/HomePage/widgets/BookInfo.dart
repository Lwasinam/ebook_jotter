import 'package:ebook_jotter/import/imports.dart';
import 'package:ebook_jotter/models/Model.dart';
import 'package:ebook_jotter/providers/DataProvider.dart';


class BookInfo extends StatelessWidget {
 final String? text;

 BookInfo({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20,right: 20),
      width: ScreenUtil().screenWidth,
      height: ScreenUtil(). setHeight(250),
      child: ValueListenableBuilder <Box<pdfModels>>(
        valueListenable: DataProvider.openHiveBox().listenable(),
        builder: (context, data, child) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection:  Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
           
             pdfModels? pdfmodel = data.getAt(index);
              return Container(
                padding: EdgeInsets.only(bottom: 50),
              
                margin: EdgeInsets.only(left: 20,right: 20),
               // color: Colors.cyanAccent,
                height: ScreenUtil().setHeight(150),
                width: ScreenUtil().screenWidth,
                child: Stack(
                  children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          // margin: const EdgeInsets.only(left: 20,right: 20),
                        
                          height: ScreenUtil(). setHeight(60),
                          width: ScreenUtil(). setWidth(250),
                          decoration: BoxDecoration(
                             color: Colors.white,
                            boxShadow: [BoxShadow(blurRadius: 35,spreadRadius:3,color: Colors.black.withOpacity(0.2), )]
                          ),
                          child: Align(
                            alignment: Alignment(0,0.3),
                            child: Text(pdfmodel!.bookName!, style: TextStyle(fontWeight: FontWeight.bold,fontSize: ScreenUtil().setSp(18),)),),
                        ),
                      ),
                       Align(
                         alignment: Alignment(0, -0.8),
                         child: Container(
                          margin: const EdgeInsets.only(left: 20,right: 20),
                        
                          height: ScreenUtil(). setHeight(160),
                          width: ScreenUtil(). setWidth(140),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                            borderRadius: BorderRadius.circular(30)
                          ),
                                               ),
                       ),
                ],),
              ) ;
            },
          );
        }
      ),
    );
  }
}
