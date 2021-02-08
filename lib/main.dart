import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        buttonColor: Colors.purple,
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      ),
    );
  }
}

class Kittens {
  String name;
  int age;
  String about;
  String image;
  Kittens({this.name, this.age, this.about, this.image});
}

List<Kittens> kittenlist = [
  Kittens(
      name: 'Fluffy',
      age: 2,
      about: 'this is a gfluffy kitten',
      image: 'kitone.jpg'),
  Kittens(
      name: 'Puppy',
      age: 3,
      about: 'this is a good kitten',
      image: 'kittwo.png'),
  Kittens(
      name: 'Tome',
      age: 4,
      about: 'this is a best kitten',
      image: 'kitfour.jpg'),
  Kittens(
      name: 'Miky',
      age: 3,
      about: 'this is a bed kitten',
      image: 'kitthree.jpg'),
  Kittens(
      name: 'Jerry',
      age: 1,
      about: 'this is a good kitten',
      image: 'kitfive.jpg'),
];
Widget _showDialog(BuildContext context, Kittens kitten) {
  String image = kitten.image;
  return SimpleDialog(
    contentPadding: EdgeInsets.zero,
    children: [
      Image.asset(
        'assets/$image',
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kitten.name,
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 4,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${kitten.age} month',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 3,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              kitten.about,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 3,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                children: [
                  FlatButton(
                    onPressed: () => {
                      Navigator.pop(context),
                    },
                    child: Text('I/AM ALERGIC'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text('ADOPT'),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}

Widget listItemWidget(BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (context) => _showDialog(context, kittenlist[index]));
    },
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        kittenlist[index].name,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 4.0,
        ),
      ),
    ),
  );
}

Widget bulildList(BuildContext context) {
  return Container(
      child: ListView.builder(
    itemCount: kittenlist.length,
    itemBuilder: listItemWidget,
  ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my home page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30),
        child: bulildList(context),
      ),
    );
  }
}
