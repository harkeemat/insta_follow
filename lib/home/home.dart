


import 'package:flutter/material.dart';
import 'package:instagram_follow/follow/home.dart';
import 'package:instagram_follow/home/bgimage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_follow/unfolllow/home.dart';


class HomePage extends StatefulWidget {
   //final Future<List<Welcome>> products;

   //MyCustomForm({Key key, this.products}) : super(key: key);
    
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
Size screenSize(BuildContext context) {
 
  return MediaQuery.of(context).size;
}
double screenHeight(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).height / dividedBy;
}
// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<HomePage> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      //print(screenSize);
      body: Stack(
        fit: StackFit.expand,
        children: [
          Bgimage(),
          Center(
            child: Padding(
              
              padding: const EdgeInsets.all(16),
              child: Column(children: <Widget>[
               
                SizedBox(height: screenHeight(context,
              dividedBy: 2.5)),
                RaisedButton(
                  padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 18),
                  color: Colors.lightBlue[400],
                  onPressed: () =>   Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyCustomfollow(),
              ),
            ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Bot to follow",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 18),
                  color: Colors.lightBlue[400],
                  onPressed: () =>   Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyCustomunfollow(),
              ),
            ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Bot to Unfollow",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ),
          ),

      ],
      ),
     ) ;
  }
}
