import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Article extends StatefulWidget {
  @override
  _MyAppState1 createState() => _MyAppState1();
}
//επικεφαλιδα και τα url
class _MyAppState1 extends State<Article> {
  var text = ['What is depression?', 'WHY IS THIS A PROBLEM?', 'WHEN IS DEPRESSION CAUSED BY STRESS?', 'WHY DOES IT SEEM THAT DEPRESSION IS CAUSED BY STRESS?'];
  var shortDescription = [
    'How often does a depressed person hear comments such as these?',
    'The misunderstanding occurs because just about everyone has experienced sadness or “feeling down.”',
    'Such a condition is typically diagnosed as an adjustment disorder ',
    'The fact is that the depressive disorders, as is true of most of the physical disorders, are reactive to stress. ',
  ];
  List<String> images = [
    "https://imaginemd.net/wp-content/uploads/2009/03/down.jpg",
    "https://c4.wallpaperflare.com/wallpaper/117/406/506/depression-by-justin-cherry-wallpaper-preview.jpg",
    "https://c7.alamy.com/comp/KNEX28/mature-man-with-hand-on-head-near-window-concept-image-for-depression-KNEX28.jpg",
    "https://c7.alamy.com/comp/GG5BG2/a-woman-hanging-suicide-dark-blur-and-noise-concept-GG5BG2.jpg",
  ];

  Widget customcard1(
      String text, String imagepath, String shortDescription, String route) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(route);

          print(
              'card tapped'); //τυπωνεται οταν πατιεται η καρτα λογω του InkWell
        },
        child: Card(
          elevation: 10.0, //η σκια που θελουμε να φαινεται

          child: Wrap(
            children: [
              Image.network(imagepath),
              ListTile(
                title: Text(text),
                subtitle: Text(shortDescription),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Suggestions';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 400.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160,
              child: customcard1(
                  text[0], images[0], shortDescription[0], '/article1'),
            ),
            Container(
              width: 160,
              child: customcard1(
                  text[1], images[1], shortDescription[1], '/article2'),
            ),
            Container(
              width: 160,
              child: customcard1(
                  text[2], images[2], shortDescription[2], '/article3'),
            ),
            Container(
              width: 160,
              child: customcard1(
                  text[3], images[3], shortDescription[3], '/article4'),
            ),
          ],
        ),
      ),
    );
  }
}



class Question1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _MyAppState();
  }
}
//εκτυπωνει
class _MyAppState extends State<Question1> {
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override  //οι ερωτησεις με τις απαντησεις,τις αρχικοποιο
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': '"Over the last 2 weeks, how often have you been bothered by any of the following problems?" \n'
            'Little interest or pleasure in doing things?',
        'answers': ['Not at all', 'Several days', 'More than half days' , 'Nearly every day'],
      },
      {
        'questionText': 'Feeling down,depressed, or hopeless',
        'answers': ['Not at all', 'Several days', 'More than half days' , 'Nearly every day'],
      },
      {
        'questionText': 'Trouble falling or staying asleep, or sleeping too much?',
        'answers': ['Not at all', 'Several days', 'More than half days' , 'Nearly every day'],
      },
      {
        'questionText': 'Feeling tired or having little energy?',
        'answers': ['Not at all', 'Several days', 'More than half days' , 'Nearly every day'],
      },
      {
        'questionText': 'Poor appetite or overeating?',
        'answers': ['Not at all', 'Several days', 'More than half days' , 'Nearly every day'],
      },
      {
        'questionText': 'Feeling bad about yourself - or tht you are a failure or have let yourself or your family down?',
        'answers': ['Not at all', 'Several days', 'More than half days' , 'Nearly every day'],
      },
      {
        'questionText': 'Trouble concentrating on things,such as reading the newspaper or watching television?',
        'answers': ['Not at all', 'Several days', 'More than half days' , 'Nearly every day'],
      },
      {
        'questionText': 'Moving or speaking so slowly that other people could have noticed.Or ?',
        'answers': ['Not at all', 'Several days', 'More than half days' , 'Nearly every day'],
      },
      {
        'questionText': 'Thoughts that you would be better off dead, or of hurting yourself?',
        'answers': ['Not at all', 'Several days', 'More than half days' , 'Nearly every day'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questionnaire'),
        ),
        body: _questionIndex <
            questions
                .length //Εαν ειναι μικροτερο απο το length εκτελεσε τον κωδικα μετα το "?""
            ? Column(
          children: [
            Question(questions[_questionIndex]['questionText']),
            ...(questions[_questionIndex]['answers'] as List<String>) // με το as List<String> δηλωνουμε στο flutter οτι θα ειναι παντα λιστα το questions
                .map((answer) {
              //κανουμε map το list question
              return Answer(_answerQuestion, answer);
            }).toList() //με το toList λεμε στο map οτι θελω να επιστρεφεις μια λιστα
          ],
        )
            :  Container(//εφτιαξα ενα container για να βαλω και το text και το κουμπι απο κατω
      child: Column(
      children: <Widget>[
    Container(
    margin: EdgeInsets.only(top: 200.0, bottom: 10.0),
    child: Text("You did it",
    style: TextStyle(
    color: Colors.lightBlue,
    fontWeight: FontWeight.bold,
    fontSize: 19.0))),
    Container(
    margin: EdgeInsets.only(
        left: 0.0,top: 0.0, right: 0.0,bottom: 0.0),
    child: Column(

    children: <Widget>[
    Container(
    margin: EdgeInsets.all(140.0),
    child: OutlineButton(
    child: Text('Homepage'),
    textColor: Colors.lightBlue,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40.0)),
    onPressed: () {
      Navigator.pushNamed(context, '/homepage');
    },
    ),
    )
    ],
    ),
    )
    ],
    ),
    ),
      ),
    );
  }
}
