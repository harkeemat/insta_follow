import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:instagram_follow/home/bgimage.dart';
import 'package:instagram_follow/home/followget.dart';
import 'package:instagram_follow/home/listfollow.dart';

Future<List<Welcome>> following(String username, String password,
    String followuser, String searchtag) async {
  //print(password);

  final http.Response response = await http.post(
    'https://ad.ditroinfotech.com/instagram/userget.php',
    //'http://localhost:8888/instagram/userget.php',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
      'followuser': followuser,
      'searchtag': searchtag,
      'status': 'follow'
    }),
  );

  if (response.statusCode == 200) {
    final jsonresponse = response.body;
    //print(jsonresponse);

    return welcomeFromJson(jsonresponse);
  } else {
    throw Exception('Failed to create album.');
  }
}

// Create a Form widget.
class MyCustomfollow extends StatefulWidget {
  //final Future<List<Welcome>> products;

  //MyCustomForm({Key key, this.products}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomfollow> {
  Future<List<Welcome>> product;

  //MyCustomFormState({Key key, this.product});
  final username = TextEditingController();
  final userPassword = TextEditingController();
  final instafolllow = TextEditingController();
  final searchtag = TextEditingController();
  final countdata = TextEditingController();
  //Future<List<Welcome>> _futureAlbum;
  String shofiledfollow = "false";
  String searchbtn = "false";
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  var valule;
  _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return null;
    } else {
      return true;
    }
  }

  @override
// void initState() {
//     super.initState();
// print(_futureAlbum);
//   }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          title: Text("Insta Follow"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Bgimage(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Form(
                            key: _formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: username,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter a Usrename';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Enter User Name",
                                        labelText: "Username"),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: userPassword,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter a Password';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Enter User Password",
                                        labelText: "Password"),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                      controller: instafolllow,
                                      decoration: InputDecoration(
                                          hintText: "Enter follow Username",
                                          labelText: "followUser"),
                                      enabled:
                                          searchbtn == "false" ? true : false,
                                      onChanged: (String value) async {
                                        setState(() {
                                          value != ''
                                              ? shofiledfollow = "true"
                                              : shofiledfollow = "false";
                                          //print(shofiledfollow);
                                        });
                                      }),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: searchtag,
                                    enabled: shofiledfollow == "false"
                                        ? true
                                        : false,
                                    onChanged: (String value) async {
                                      setState(() {
                                        value != ''
                                            ? searchbtn = "true"
                                            : searchbtn = "false";
                                        //print(shofiledfollow);
                                      });
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Enter Search Tag",
                                        labelText: "SearchTag"),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {
                              valule = _submit();
                              //print(valule);
                              setState(() {
                                if (valule != null) {
                                  product = following(
                                    username.text,
                                    userPassword.text,
                                    instafolllow.text,
                                    searchtag.text,
                                  );

                                  if (product != null) {
                                    var titles = "Insta following";
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Listdata(
                                            products: product,
                                            title: titles,
                                            user: username.text,
                                            pass: userPassword.text,
                                            instauser: instafolllow.text,
                                            status: "follow",
                                            tag: searchtag.text),
                                      ),
                                    );
                                  } else {
                                    Center(child: CircularProgressIndicator());
                                  }
                                }
                              });
                            },
                            child: Text("follow"),
                            color: Colors.orange,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
