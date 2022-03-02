import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listImages = [
    //η λιστα με τις εικονες που θα εμφανισουμε
    'assets/images/suggestion-box-improve-business.jpg',
    'assets/images/de.jpg'
  ];

  Widget customcard(String langname, String imagepath, String route) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(route);
          print('card tapped'); //τυπωνεται οταν πατιεται η καρτα λογω του InkWell
        },
        child: Card(
          //το wdiget Card
          color: Colors.blue,
          elevation: 10.0, //η σκια που θελουμε να φαινεται
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0), //συμμετρικη αποσταση στον καθετο αξονα
                  child: Material(
                    //χρησιμοποιουμε το material για την σκιαση κτλ
                    elevation: 5.0, //σκια
                    borderRadius: BorderRadius.circular(
                        100), //για να γινει στρογγυλο το container που περιεχει την εικονα
                    child: Container(
                      height:
                          200, //χρειαζονται για να φανει η στρογγυλοποιηση του Material αλλιως η εικονα ειναι μεγαλυτερη και δεν φαινεται (στο συγκεκριμενο παραδειγμα)
                      width: 200,
                      child: ClipOval(
                        //κοβει την εικονα και την κανει στρογγυλη

                        child: Image(
                          fit: BoxFit.contain, //να γεμιζει η εικονα τον χωρο
                          image: AssetImage(imagepath), //δυναμικο path εικονας
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname, //δυναμικο κειμενο εικονας
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text("",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
        //  ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Depression CBT”"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          customcard("Suggestions",listImages[0],'/article'), //περναμε τιτλο και εικονα απο την λιστα
          customcard("Questionnaire",listImages[1],'/questions1')],
      ),
    );
  }
}
