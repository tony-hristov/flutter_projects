import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Stacked cards'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.blue,
                height: 50,
                child: const Center(child: Text('Start stacked cards example')),
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: StackedCards(children: [CardOne(), CardTwo(), CardThree()]),
              ),
              const SizedBox(height: 12),
              Container(
                color: Colors.blue,
                height: 50,
                child: const Center(child: Text('Start stacked cards example')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StackedCards extends StatefulWidget {
  final List<Widget> children;
  const StackedCards({
    required this.children,
    super.key,
  });

  @override
  State<StackedCards> createState() => _StackedCardsState();
}

class _StackedCardsState extends State<StackedCards> {
  bool _expanded = false;

  void toggle() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  List<Widget> _joinWidgetsWithMargin(List<Widget> widgets, double margin) {
    var joined = <Widget>[];
    for (var i = 0; i < widgets.length; i++) {
      if (i != widgets.length - 1) {
        joined.add(widgets[i]);
        joined.add(SizedBox(height: margin));
      } else {
        joined.add(widgets[i]);
      }
    }
    return joined;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: toggle,
              child: _expanded ? const Text('[-]') : const Text('[+]'),
            ),
          ],
        ),
        ...(_expanded ? _joinWidgetsWithMargin(widget.children, 20) : [widget.children[0]]),
      ],
    );
  }
}

class CardOne extends StatelessWidget {
  const CardOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      title: 'Card Number 1',
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Container(color: Colors.cyan, height: 50, width: 100),
            ),
          ),
          const Flexible(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Elit ullamco fugiat amet in velit esse. Irure commodo laboris irure amet sint eiusmod. Ea dolore aliqua ex nostrud sunt nostrud veniam pariatur irure consequat irure adipisicing. Ad tempor aliquip commodo dolore amet adipisicing incididunt magna occaecat ullamco ea commodo ad minim.',
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardTwo extends StatelessWidget {
  const CardTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      title: 'Card Number 2',
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Nisi pariatur laborum ea nisi consectetur velit sint Lorem irure consectetur minim sunt. Irure consequat aute id duis ad esse sunt. Eu pariatur elit ad dolore do nisi cupidatat aute incididunt reprehenderit velit quis velit officia.',
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Container(color: Colors.greenAccent, height: 70, width: 175),
            ),
          ),
        ],
      ),
    );
  }
}

class CardThree extends StatelessWidget {
  const CardThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      title: 'Card Number 3',
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            child: Container(color: Colors.purpleAccent, height: 50, width: 1300),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flex(
              direction: Axis.horizontal,
              children: const [
                Flexible(
                  child: Text(
                    'Nisi pariatur laborum ea nisi consectetur velit sint Lorem irure consectetur minim sunt. Irure consequat aute id duis ad esse sunt. Eu pariatur elit ad dolore do nisi cupidatat aute incididunt reprehenderit velit quis velit officia.',
                    overflow: TextOverflow.fade,
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Nisi pariatur laborum ea nisi consectetur velit sint Lorem irure consectetur minim sunt. Irure consequat aute id duis ad esse sunt. Eu pariatur elit ad dolore do nisi cupidatat aute incididunt reprehenderit velit quis velit officia.',
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String title;
  final Widget child;
  const Card({
    required this.title,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          child,
        ]),
      ),
    );
  }
}
