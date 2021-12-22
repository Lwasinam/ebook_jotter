import 'package:ebook_jotter/import/imports.dart';

class Recent extends StatelessWidget {
  const Recent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text("Recent", style: TextStyle(fontSize: 25),),
    
    );
  }
}

class Books extends StatelessWidget {
  const Books({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text("Books", style: TextStyle(fontSize: 25),),
    
    );
  }
}
