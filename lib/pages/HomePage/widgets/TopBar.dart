
import 'package:ebook_jotter/import/imports.dart';
class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Good Morning", style: TextStyle(color: Colors.white, fontSize: 25),),
        SizedBox(height: ScreenUtil().setHeight(14),),
        Text("Lwasinam Dilli", style: TextStyle(color: Colors.white, fontSize: 30),),
          SizedBox(height: ScreenUtil().setHeight(30),),
        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(fontSize: 20)
            ),
          ),
          height: ScreenUtil().setHeight(45),
          width: ScreenUtil().setWidth(300),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
        )
      ],),
      height: 45/100 * ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
           color: Colors.black,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30) )
      ),
    );
  }
}