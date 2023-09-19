//To parse this JSON data, do

    //final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    Welcome({
        this.username,
        this.userid,
        this.image,
        this.followstatus,
        
        this.outgoingrequest,
        this.selfuser,
        this.isprivate,
    });

     String username;
     var userid;
     String image;
     String followstatus;
    
     String outgoingrequest;
     String selfuser;
     String isprivate;
factory Welcome.fromJson(Map<String, dynamic> json) {
    return Welcome(
        username: json["username"],
        userid: json["userid"],
        image: json["image"],
        followstatus: json["followstatus"],
        
        outgoingrequest: json["outgoingrequest"],      
        selfuser: json["selfuser"],
        isprivate: json["isprivate"],
    );
}
     Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['username'] = this.username;
     data['userid'] = this.userid;
     data['image'] = this.image;
     data['followstatus'] = this.followstatus;
    
     data['outgoingrequest'] = this.outgoingrequest;
     data['selfuser'] = this.selfuser;
     data['isprivate'] = this.isprivate;
     return data;
   }
}
// List<Getdetails> getdetailsFromJson(String str) => List<Getdetails>.from(json.decode(str).map((x) => Getdetails.fromJson(x)));

// String getdetailsToJson(List<Getdetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
// class Getdetails {
//     Getdetails({
//         this.username,
//         this.userid,
//         this.image,
//         this.followstatus,
//         this.incomingrequest,
//         this.outgoingrequest,
//         this.selfuser,
//         this.isprivate,
//     });

//      String username;
//      int userid;
//      String image;
//      String followstatus;
//      String incomingrequest;
//      String outgoingrequest;
//      String selfuser;
//      String isprivate;
// factory Getdetails.fromJson(Map<String, dynamic> json) {
//     return Getdetails(
//         username: json["username"],
//         userid: json["userid"],
//         image: json["image"],
//         followstatus: json["followstatus"],
//         incomingrequest: json["incomingrequest"],
//         outgoingrequest: json["outgoingrequest"],      
//         selfuser: json["selfuser"],
//         isprivate: json["isprivate"],
//     );
// }
//      Map<String, dynamic> toJson() {
//      final Map<String, dynamic> data = new Map<String, dynamic>();
//      data['username'] = this.username;
//      data['userid'] = this.userid;
//      data['image'] = this.image;
//      data['followstatus'] = this.followstatus;
//      data['incomingrequest'] = this.incomingrequest;
//      data['outgoingrequest'] = this.outgoingrequest;
//      data['selfuser'] = this.selfuser;
//      data['isprivate'] = this.isprivate;
//      return data;
//    }
// }
// List<Welcome> WelcomeFromJson(String str) => List<Welcome>.from(
//     json.decode(str).map((x) => Welcome.fromJson(x)));

// String WelcomeToJson(List<Welcome> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Welcome {
 
//   String username;
//   String following;
  

//   Welcome(
//       {
//       this.username,
//       this.following
//       });

//   factory Welcome.fromJson(Map<String, dynamic> json) {
//     return Welcome(
        
//         username: json['username'],
//         following: json['following']);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
    
//     data['username'] = this.username;
//     data['following'] = this.following;
    
//     return data;
//   }
// }
// class Welcome {
//   String username;
//   String following;

//   Welcome({this.username, this.following});

//   Welcome.fromJson(Map<String, dynamic> json) {
//     username = json['username'];
//     following = json['following'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['username'] = this.username;
//     data['following'] = this.following;
//     return data;
//   }
// }
