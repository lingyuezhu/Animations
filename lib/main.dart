import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animations-409631560'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Offset offset = Offset.zero;
  bool state = false;
  void _slideUp() {
    setState(() => offset -= const Offset(0, 10));
    state = true;
  }
  void _slideDown() {
    setState(() => offset += const Offset(0, 10));
    state = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            AnimatedSlide(
              offset: offset,
              duration: const Duration(seconds: 5),
              curve: Curves.easeInOut,
              onEnd: (){
                if(state == true){
                  _slideDown();
                }
              },
              child: Icon(Icons.airplanemode_active,color: Colors.blue,size: 48,),
            ),
            ElevatedButton(child: Text("按一下這個"), onPressed: () {
              _slideUp();
            },)
          ],
        ),
      ),
    );
  }
}
