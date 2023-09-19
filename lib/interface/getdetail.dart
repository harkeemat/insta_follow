// import 'dart:convert';

// List<Getdetails> getdetailsFromJson(String str) => List<Getdetails>.from(json.decode(str).map((x) => Getdetails.fromJson(x)));

// String getdetailsToJson(List<Getdetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
// class Getdetails {
//     Getdetails({
//         this.username,
//         this.userid,
        
//         this.followstatus,
        
//     });

//      String username;
//      int userid;
     
//      String followstatus;
     
// factory Getdetails.fromJson(Map<String, dynamic> json) {
//     return Getdetails(
//         username: json["username"],
//         userid: json["userid"],
        
//         followstatus: json["followstatus"],
       
//     );
// }
//      Map<String, dynamic> toJson() {
//      final Map<String, dynamic> data = new Map<String, dynamic>();
//      data['username'] = this.username;
//      data['userid'] = this.userid;
     
//      data['followstatus'] = this.followstatus;
     
//      return data;
//    }
// }
// To parse this JSON data, do
//
//     final getdetails = getdetailsFromJson(jsonString);

import 'dart:convert';

Getdetails getdetailsFromJson(String str) => Getdetails.fromJson(json.decode(str));

String getdetailsToJson(Getdetails data) => json.encode(data.toJson());

class Getdetails {
    

    int userid;
    String username;
    String followstatus;
    Getdetails({
        this.userid,
        this.username,
        this.followstatus,
    });

    factory Getdetails.fromJson(Map<String, dynamic> json) => Getdetails(
        userid: json["userid"],
        username: json["username"],
        followstatus: json["followstatus"],
    );

     Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['userid'] = this.userid;
      data['username'] = this.username;
       data['followstatus'] = this.followstatus;
        return data;
    }
}