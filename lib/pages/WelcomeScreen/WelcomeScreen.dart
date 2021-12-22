import 'package:ebook_jotter/import/imports.dart';
import 'package:ebook_jotter/providers/DataProvider.dart';



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
               DataProvider().pickBook(context);
                }, icon: Icon(Icons.add))),
            )
          ],
        ),
      ),
    );
  }
}