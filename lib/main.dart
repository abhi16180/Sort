import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future urlauncher() async {
  await launch('https://github.com/abhi16180');
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = TextEditingController();
  List string = [];
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        leading: IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              AlertDialog alert = AlertDialog(
                title: Center(
                  child: Text(
                    'About',
                    style: TextStyle(
                        fontFamily: 'productSans',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                content: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'App by Abhilash Hegde\n\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'productSans',
                      ),
                    ),
                    TextSpan(
                        text: 'Link to Github',
                        style: TextStyle(
                            color: Colors.blue, fontStyle: FontStyle.italic),
                        recognizer: TapGestureRecognizer()..onTap = urlauncher),
                  ]),
                ),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            }),
        title: Text(
          'Sort',
          style:
              TextStyle(fontFamily: 'Cocogoose', fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: TextStyle(fontFamily: 'productSans'),
                decoration: InputDecoration(
                  hintText: 'Enter the words separated by space here',
                  hintStyle: TextStyle(
                    fontFamily: 'productSans',
                  ),
                  contentPadding: EdgeInsets.only(left: 20),
                ),
                controller: controller,
                onFieldSubmitted: (String ans) {
                  setState(() {
                    string = ans.split(' ');
                    string.sort();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: string.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Card(
                        child: Container(
                          width: 200,
                          height: 40,
                          child: Center(
                            child: Text(
                              string[i],
                              style: TextStyle(
                                  fontFamily: 'solomon',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          setState(() {
            controller.clear();
            string = [];
          });
        },
        child: Icon(
          Icons.clear,
          color: Colors.black,
        ),
      ),
    );
  }
}
