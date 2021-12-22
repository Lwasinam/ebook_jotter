import 'package:ebook_jotter/import/imports.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Stack(
      children:   
        [
           Positioned(
          left: 35,
          top: 390,
          child: Container(
            decoration: BoxDecoration(
                 color: Colors.white,
              borderRadius: BorderRadius.circular(20),
                 boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 1, blurRadius:50)]
              
            ),
         
            height: ScreenUtil().setHeight(150),
            width: ScreenUtil().setWidth(300),
            
          ),
        ),
          Positioned(
            top: 250,
            left: 100,
            child: Container(
              height: ScreenUtil().setHeight(170),
        
              width: ScreenUtil().setHeight(170),
                 decoration: BoxDecoration(
                 color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius:50)]
            ),
              ),
          ),
    
       
      ],
    );
  }
}