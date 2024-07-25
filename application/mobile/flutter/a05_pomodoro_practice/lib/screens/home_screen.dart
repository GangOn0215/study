import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Text(
                '25:00',
                style: TextStyle(
                  color: Theme.of(context).textTheme.headlineSmall?.color,
                  fontWeight: FontWeight.w600,
                  fontSize: 60,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              color: Theme.of(context).textTheme.headlineSmall?.color,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_circle_outline_rounded,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  size: 120,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              // color: Theme.of(context).scaffoldBackgroundColor,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Round',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).textTheme.headlineSmall?.color,
                        ),
                      ),
                      Text(
                        '0/4',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Goal',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).textTheme.headlineSmall?.color,
                        ),
                      ),
                      Text(
                        '0/4',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
