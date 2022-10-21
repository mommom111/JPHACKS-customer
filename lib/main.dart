import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

  String location1Congestion = '大混雑！！';

  String locationCommentCongestion = '今日はいつもより人が多いです！';

  Future<void> congestionChange() async  {
    print('3秒後に切り替わる');
    Future.delayed(
      Duration(seconds: 3),
      () {
        setState(()=> location1Congestion = '快適',);
      },
    );
  }

  // final TextEditingController _controller = TextEditingController();
  // // websocket通信と接続
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
  );

  Future<void> congestionCommentChange() async  {
    print('3秒後に切り替わる');
    Future.delayed(
      Duration(seconds: 3),
      () {
        setState(()=> locationCommentCongestion = '比較的人が少ないです',);
      },
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    congestionChange();
    congestionCommentChange();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 218,
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
                StreamBuilder(
                  stream: _channel.stream,
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.hasData ? '大混雑！' : '快適',
                      style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 50, 
                    ),
                    );
                  },
                )
                // Text(
                //   location1Congestion, 
                //   style: TextStyle(
                //     fontWeight: FontWeight.w500, fontSize: 50, 
                //   ),
                // ),
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
                    child: StreamBuilder(
                      stream: _channel.stream,
                      builder: (context, snapshot) {
                        return Text(snapshot.hasData ? '今日はいつもより人が多いです！' : '空いていますよ！');
                      },
                    )
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

  // void _sendMessage() {
  //   if (_controller.text.isNotEmpty) {
  //     _channel.sink.add(_controller.text);
  //   }
  // }

  // @override
  // void dispose() {
  //   _channel.sink.close();
  //   _controller.dispose();
  //   super.dispose();
  // }
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
      height: 218,
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

  class location2 extends StatefulWidget {
  const location2({
    Key? key,
  }) : super(key: key);

  @override
  State<location2> createState() => _location2State();
}

class _location2State extends State<location2> {
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

class location1 extends StatefulWidget {
  const location1({
    Key? key,
  }) : super(key: key);

  @override
  State<location1> createState() => _location1State();
}

class _location1State extends State<location1> {
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