import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ThemeData 설정
      theme: ThemeData(
        // textTheme를 설정
        textTheme: TextTheme(
          // bodyLarge를 설정
          bodyLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Color(0XFFF4EDDB),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [showTitle ? MyLargeTitle() : Container()],
            ),
            IconButton(
              onPressed: toggleTitle,
              icon: Icon(
                showTitle
                    ? Icons.toggle_on_outlined
                    : Icons.toggle_off_outlined,
                size: 48,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({super.key});

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    super.initState();

    print('initState');
  }

  @override
  void dispose() {
    super.dispose();

    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    return Text(
      'My Large Title',
      style: TextStyle(
        /**
         *  상위 Material Design의 텍스트 스타일을 사용 
         *  
         *  bodyLarge?.color, 에서
         *  ?. 이 붙었다는 것은 maybe
         *  ?! 이 붙었다는 것은 무조건
         */
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: 24,
      ),
    );
  }
}
