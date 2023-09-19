import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:instagram_follow/home/followget.dart';
import 'package:instagram_follow/interface/getdetail.dart';


Future<Getdetails> getfollow(String username, int userid,
    String followstatus) async {
 // print(userid);
Map data = {
  'username': username,
      'userid': userid,
      'followstatus': followstatus
};

String body = json.encode(data);
  final http.Response response = await http.post(
    'https://ad.ditroinfotech.com/instagram/follow.php',
    //'http://localhost:8888/instagram/follow.php',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body
    
    );
  //print(data);

  if (response.statusCode == 200) {
   
    final jsonresponse = response.body;
    
    return getdetailsFromJson(jsonresponse);
  } else {
    throw Exception('Failed to create album.');
  }
}

Future<List<Welcome>> getlist(String username, String password,
    String followuser, String searchtag, String countdata, String status) async {
  //print(password);

  final http.Response response = await http.post(
    'https://ad.ditroinfotech.com/instagram/getcounts.php',
    //'http://localhost:8888/instagram/getcounts.php',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
      'followuser': followuser,
      'searchtag': searchtag,
      'countdata': countdata,
      'status': status
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
class Listdata extends StatefulWidget {
  Future<List<Welcome>> products;
  
  var title;
  var instauser;
  var pass;
  var user;
  var status;
  var tag;
  Listdata({this.products, this.title ,this.instauser, this.pass ,this.user, this.status, this.tag});

  @override
  _ListdataState createState() => _ListdataState();
}

class _ListdataState extends State<Listdata> {
  Future<List<Welcome>> getdata;
  Future<Getdetails> _listdata;
  List<String> nameList = [];
String btnText;
  final limit = TextEditingController();
int i=0;

var listdata;
//   getbuttontext(int index, String status){
//    var data;
//    return data[index]=status;
//  }

  @override
  Widget build(BuildContext context) {
     bool showFriendList = false;
    //print(products);
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.title}"),
        ),
        body: 
         Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
            child: Row(
              children: <Widget>[
                Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
                  controller: limit,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Limit',
                  ),
                ),
      ),
              
    ),
    
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
                child: Text('limit',style: TextStyle(
                                                          color: Colors.white)),
                onPressed: () {
                  setState(() {
                    getdata=getlist(
                                        "${widget.user}",
                                        "${widget.pass}",
                                        "${widget.instauser}",
                                        "${widget.tag}",
                                        limit.text,
                                        "${widget.status}");
                  });
                  
                },
                color: Colors.red[200],
                                                      shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                              BorderRadius.circular(
                                                                  20.0))
              ),
      ),
    
              ],
            ),
         
             ),
          ),
          getdata ==null ? 
           widget.products != null ? 
          Expanded(
                    child:
                     FutureBuilder<List<Welcome>>(
                        future: widget.products,
                        builder: (context, snapshot) {
                          //print(snapshot.hasData);
                          if (snapshot.hasData) {
                            return Scrollbar(
                                                          child: ListView.builder(
                                  //scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    i = i+ 1;
                                    var followers = snapshot.data[index];
                                  
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 5.0),
                                      child: Card(
                                        elevation: 10.0,
                                        shape: BeveledRectangleBorder(
                                            //borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0)),
                                            ),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    width: 55.0,
                                                    height: 55.0,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      foregroundColor:
                                                          Colors.green,
                                                      backgroundImage:
                                                          NetworkImage(
                                                              followers.image),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 5.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(followers.username,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.0,
                                                    vertical: 10.0),
                                                child: RaisedButton(
                                                  onPressed: () {
                                                    //nameList.clear();
                                                    nameList.remove(snapshot.data[index].username);
                                                    nameList.add(snapshot.data[index].username);
                                                    //print(nameList);
                                                    setState(() {
                                                        
                                                      _listdata ==null ?
                                                     _listdata=  getfollow(followers.selfuser,followers.userid,followers.followstatus)
                                                    : _listdata=  getfollow(followers.selfuser,followers.userid,btnText);
                                                    //print(listdata.followstatus);
                                                    listdata=_listdata;
                                                    //  btnText[i] == null ? followers.followstatus=="Follow" ? btnText[i] = 'Followed' : followers.followstatus== "Requested" ? btnText[i] = 'Unfollow' : btnText[i] = 'follow' : 
                                                    //  btnText[i] =='Follow' ? btnText[i] ='Followed' : btnText[i] =='Followed' ? btnText[i] ='Unfollowed' : btnText[i] ='Followed' ;
                                                   widget.status=="follow" ? btnText ='Followed' : btnText ='Follow' ;
                                                   
                                                    });
                                                    
                                                    ///print(listdata.followstatus);
                                                  },
                                                  
                                                  color: Colors.red[200],
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0)),
                                                  child: Text(btnText==null || !nameList.contains(snapshot.data[index].username)  ? followers.followstatus: btnText
                                                    
                                                   
                                                    ,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          return Center(child: CircularProgressIndicator());
                        }),
                  )
                : Center(child: CircularProgressIndicator())
                : Expanded(
                    child:
                     FutureBuilder<List<Welcome>>(
                        future: getdata,
                        builder: (context, snapshot) {
                          //print(snapshot.hasData);
                          if (snapshot.hasData) {
                            print(snapshot.hasData);
                            return Scrollbar(
                                                          child: ListView.builder(
                                  //scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    i = i+ 1;
                                    var followers = snapshot.data[index];
                                  
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 5.0),
                                      child: Card(
                                        elevation: 10.0,
                                        shape: BeveledRectangleBorder(
                                            //borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0)),
                                            ),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    width: 55.0,
                                                    height: 55.0,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      foregroundColor:
                                                          Colors.green,
                                                      backgroundImage:
                                                          NetworkImage(
                                                              followers.image),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 5.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(followers.username,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.0,
                                                    vertical: 10.0),
                                                child: RaisedButton(
                                                  onPressed: () {
                                                    //nameList.clear();
                                                    nameList.remove(snapshot.data[index].username);
                                                    nameList.add(snapshot.data[index].username);
                                                    //print(nameList);
                                                    setState(() {
                                                        
                                                      _listdata ==null ?
                                                     _listdata=  getfollow(followers.selfuser,followers.userid,followers.followstatus)
                                                    : _listdata=  getfollow(followers.selfuser,followers.userid,btnText);
                                                    //print(listdata.followstatus);
                                                    listdata=_listdata;
                                                    //  btnText[i] == null ? followers.followstatus=="Follow" ? btnText[i] = 'Followed' : followers.followstatus== "Requested" ? btnText[i] = 'Unfollow' : btnText[i] = 'follow' : 
                                                    //  btnText[i] =='Follow' ? btnText[i] ='Followed' : btnText[i] =='Followed' ? btnText[i] ='Unfollowed' : btnText[i] ='Followed' ;
                                                   widget.status=="follow" ? btnText ='Followed' : btnText ='Follow' ;
                                                    });
                                                    
                                                    ///print(listdata.followstatus);
                                                  },
                                                  
                                                  color: Colors.red[200],
                                                  shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                          BorderRadius.circular(
                                                              20.0)),
                                                  child: Text(btnText==null || !nameList.contains(snapshot.data[index].username)  ? followers.followstatus: btnText
                                                    
                                                   
                                                    ,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          return Center(child: CircularProgressIndicator());
                        }),
                  )
          
        ]
      )
            
         
        );
        
        
  }
}
