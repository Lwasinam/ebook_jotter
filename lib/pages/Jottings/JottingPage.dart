import 'package:ebook_jotter/import/imports.dart';



class JottingPage extends StatelessWidget {
  const JottingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,title: Text("Jotting", style: TextStyle(color: Colors.white),), centerTitle: true,),
      body: 
      SingleChildScrollView(
    
        child: Column(
          mainAxisSize: MainAxisSize.min,
         // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        
            Container(
              width: ScreenUtil().screenWidth,
              height:  0.9*ScreenUtil().screenHeight,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return   Center(
                  child: Container(
                    margin:EdgeInsets.only(top: ScreenUtil().setHeight(10), bottom: ScreenUtil().setHeight(10)) ,
                    // color: Colors.blue,
                    height: ScreenUtil().setHeight(150),
                    width: ScreenUtil().screenWidth,
                    child: Stack(children: [
                    Center(child: Container(
                      margin:EdgeInsets.only(left: ScreenUtil().setWidth(60)),
                   
                      width: ScreenUtil().setWidth(260),
                      height: ScreenUtil().setHeight(140),
                      decoration: BoxDecoration(
                           color: Colors.white,
                        borderRadius: BorderRadius.circular(40.r),
                            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 50, spreadRadius: 0.8)]
                      ),
                    )),
                    Positioned(
                      left: 20,
                      top: 26,
                      child: Container(
                     
                        width: ScreenUtil().setWidth(105),
                        height: ScreenUtil().setHeight(105),
                         decoration: BoxDecoration(
                              color: Colors.black,
                     
                        borderRadius: BorderRadius.circular(30.r),
                        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 50, spreadRadius: 0.8)]
                      ),
                      ),
                    )
                    ],)
                    ,),
                );
                },
              ),
            ),
             SizedBox(height: ScreenUtil().setHeight(50))
            
          ],
        ),
      )
      ,
    );
  }
}