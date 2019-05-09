import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:async';
//import 'dart:convert';
import 'cook.dart';
import 'api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.amber,
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Yemek Uygulaması'),
      ),
      body: Container(
        child: FutureBuilder(
          future: getCooks(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null){
                return Container(
                  child: Center(
                    child: Text("Veriler alınıyor..."),
                  ),
                );
              }else{
                return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data[index].picture),
                      ),
                      title: Text(snapshot.data[index].cookName),
                      subtitle: Text(snapshot.data[index].person + " kişilik"),
                      onTap: (){
                        print(snapshot.data[index].cookName);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => Divider(
                    color: Colors.grey[300],
                  ),
                  itemCount: snapshot.data.length,
                );
              }
            }
        ),
      ),
    );
  }
}

