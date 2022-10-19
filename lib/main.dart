import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: congestionPage(),
    );
  }
}

class congestionPage extends StatefulWidget {
  const congestionPage({super.key});

  @override
  State<congestionPage> createState() => _congestionPageState();
}

class _congestionPageState extends State<congestionPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FFL'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 50,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(width: 1.8, color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text('混雑度',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            location1(),
            location1Detail(),
            location2(),
            location2Detail(),
          ],
        ),
      ),
    );
  }
}

// 1個目の情報

class location1Detail extends StatefulWidget {
  location1Detail({
    Key? key,
  }) : super(key: key);

  @override
  State<location1Detail> createState() => _locationDetailState();
}

class _locationDetailState extends State<location1Detail> {

  String location1Congestion = '大混雑';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 210,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 213, 113, 231),
        border: Border.all(width: 4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: 280,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(location1Congestion, 
                  style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 50, 
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                ),
                child: Text('')
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(9),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('今日はいつもより人が多いです！')
                  ),
                  Container(
                    margin: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    ),
                    child: ElevatedButton(
                    child: const Text('評価 : ⭐️⭐️⭐️', style: TextStyle(color: Colors.black,),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

// 2個目の情報

class location2Detail extends StatefulWidget {
  location2Detail({
    Key? key,
  }) : super(key: key);

  @override
  State<location2Detail> createState() => _location2DetailState();
}

class _location2DetailState extends State<location2Detail> {

  String location2Congestion = '普通';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 210,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 79, 176, 255),
        border: Border.all(width: 4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: 280,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(location2Congestion, 
                  style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 50, 
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                ),
                child: Text('')
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(9),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('今日はいつもより人が多いです！')
                  ),
                  Container(
                    margin: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    ),
                    child: ElevatedButton(
                    child: const Text('評価 : ⭐️⭐️⭐️', style: TextStyle(color: Colors.black,),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class location2 extends StatelessWidget {
  const location2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.all(1),
      child: Text('食堂２',
        style: TextStyle(
          color: Colors.transparent,
          shadows: [
            Shadow(
              offset: Offset(0, -2),
            ),
          ],
          decoration: TextDecoration.underline,
          decorationColor: Colors.black,
        ),
      ),
    );
  }
}

class location1 extends StatelessWidget {
  const location1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: EdgeInsets.all(1),
      child: Text('食堂１',
        style: TextStyle(
          color: Colors.transparent,
          shadows: [
            Shadow(
              offset: Offset(0, -2),
            ),
          ],
          decoration: TextDecoration.underline,
          decorationColor: Colors.black,
        ),
      ),
    );
  }
}