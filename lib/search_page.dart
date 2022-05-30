import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prak_b_123190086_123190093/home_page.dart';
import 'package:prak_b_123190086_123190093/preferences/shared_preference.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Dictionary App"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(33, 38, 45, 1),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: myController,
                      style: TextStyle(
                          color: Colors.black
                      ),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.black, width: 0.5)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromRGBO(35, 41, 47, 1))
                          ),
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.black)
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      SharedPreference().setLogin(myController.text);
                      return HomePage(username: myController.text,);
                    })).then((value) => setState(() {}));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 25, 20, 0),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 20, 0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("History",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 20, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: FutureBuilder(
                  future: SharedPreference().getUsername(),
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return HomePage(username: "${snapshot.data}",);
                        }));
                      },
                      child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(33, 38, 45, 1),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)
                      ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("${snapshot.data}",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    );
                    //   RichText(text: TextSpan(
                    //   children: [
                    //     TextSpan(
                    //       text: 'Pencarian Terakhir',
                    //       style: new TextStyle(color: Colors.blue),
                    //     ),
                    //     TextSpan(
                    //       text: '"${snapshot.data}"',
                    //       style: new TextStyle(color: Colors.blue),
                    //       recognizer: new TapGestureRecognizer()
                    //         ..onTap = () {
                    //           Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //             return HomePage(username: "${snapshot.data}",);
                    //           }));
                    //         },
                    //     )
                    //   ]
                    // ),
                    // );
                  },
                ),
              ),
            )

          ],
        )
      ),
    );
  }
}
