import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const HorizonsApp());
}

class HorizonsApp extends StatelessWidget {
  const HorizonsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // This is the theme of your application.
      theme: ThemeData.dark(),
      // Scrolling in Flutter behaves differently depending on the
      // ScrollBehavior. By default, ScrollBehavior changes depending
      // on the current platform. For the purposes of this scrolling
      // workshop, we're using a custom ScrollBehavior so that the
      // experience is the same for everyone - regardless of the
      // platform they are using.
      scrollBehavior: const ConstantScrollBehavior(),
      title: 'Horizons Weather',
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Horizons'),
        //   backgroundColor: Colors.teal[800],
        // ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              // title: const Text('Horizons'),
              // centerTitle: true,
              backgroundColor: Colors.teal[800],
              stretch: true,
              onStretchTrigger: () async {
                log('Load more data');
                // await Server.getData...
              },
              pinned: true,
              floating:
                  true, // pulling down shows it. can also snap to present itself in whole size w/o need to scroll back
              snap: true, // floating can also snap to present itself in whole size w/o need to scroll back
              expandedHeight: 200.0,
              // bottom: 
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.zoomBackground, // default
                ],
                // collapseMode: CollapseMode.none, // no scroll
                // collapseMode: CollapseMode.pin, // scrolls with items
                // collapseMode: CollapseMode.parallax, // default, kind of in between
                title: const Text('Horizons'),
                centerTitle: true,
                background: DecoratedBox(
                  position: DecorationPosition.foreground,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.teal[800]!,
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: const Image(image: AssetImage('assets/header.jpeg'), fit: BoxFit.cover),
                ),
              ),
            ),
            const WeeklyForecastList(),
          ],
        ),
      ),
    );
  }
}

class WeeklyForecastList extends StatelessWidget {
  const WeeklyForecastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now();
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final dailyForecast = Server.getDailyForecastByID(index);
          return Card(
            child: Row(
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      DecoratedBox(
                        position: DecorationPosition.foreground,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(colors: [
                            Colors.grey[800]!,
                            Colors.transparent,
                          ], stops: const [
                            0.0,
                            0.55,
                          ]),
                        ),
                        // child: Image.network(dailyForecast.imageId, fit: BoxFit.cover),
                        child: Image(image: AssetImage(dailyForecast.imageId), fit: BoxFit.cover),
                      ),
                      Center(
                        child: Text(
                          dailyForecast.getDate(currentDate.day).toString(),
                          style: textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        dailyForecast.getWeekday(currentDate.weekday),
                        style: textTheme.headlineSmall,
                      ),
                      Text(dailyForecast.description),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${dailyForecast.highTemp} | ${dailyForecast.lowTemp} F',
                    style: textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          );
        },
        childCount: 7,
      ),
    );
  }
}

// --------------------------------------------
// Below this line are helper classes and data.

// const String baseAssetURL = 'https://dartpad-workshops-io2021.web.app/getting_started_with_slivers/';
const String baseAssetURL = '';
const String headerImage = '${baseAssetURL}assets/header.jpeg';

const Map<int, DailyForecast> _kDummyData = {
  0: DailyForecast(
    id: 0,
    imageId: '${baseAssetURL}assets/day_0.jpeg',
    highTemp: 73,
    lowTemp: 52,
    description: 'Partly cloudy in the morning, with sun appearing in the afternoon.',
  ),
  1: DailyForecast(
    id: 1,
    imageId: '${baseAssetURL}assets/day_1.jpeg',
    highTemp: 70,
    lowTemp: 50,
    description: 'Partly sunny.',
  ),
  2: DailyForecast(
    id: 2,
    imageId: '${baseAssetURL}assets/day_2.jpeg',
    highTemp: 71,
    lowTemp: 55,
    description: 'Party cloudy.',
  ),
  3: DailyForecast(
    id: 3,
    imageId: '${baseAssetURL}assets/day_3.jpeg',
    highTemp: 74,
    lowTemp: 60,
    description: 'Thunderstorms in the evening.',
  ),
  4: DailyForecast(
    id: 4,
    imageId: '${baseAssetURL}assets/day_4.jpeg',
    highTemp: 67,
    lowTemp: 60,
    description: 'Severe thunderstorm warning.',
  ),
  5: DailyForecast(
    id: 5,
    imageId: '${baseAssetURL}assets/day_5.jpeg',
    highTemp: 73,
    lowTemp: 57,
    description: 'Cloudy with showers in the morning.',
  ),
  6: DailyForecast(
    id: 6,
    imageId: '${baseAssetURL}assets/day_6.jpeg',
    highTemp: 75,
    lowTemp: 58,
    description: 'Sun throughout the day.',
  ),
};

class Server {
  static List<DailyForecast> getDailyForecastList() => _kDummyData.values.toList();

  static DailyForecast getDailyForecastByID(int id) {
    assert(id >= 0 && id <= 6);
    print('Fetching day $id');
    return _kDummyData[id]!;
  }
}

class DailyForecast {
  const DailyForecast({
    required this.id,
    required this.imageId,
    required this.highTemp,
    required this.lowTemp,
    required this.description,
  });
  final int id;
  final String imageId;
  final int highTemp;
  final int lowTemp;
  final String description;

  static const List<String> _weekdays = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  String getWeekday(int today) {
    final int offset = today + id;
    final int day = offset >= 7 ? offset - 7 : offset;
    return _weekdays[day];
  }

  int getDate(int today) => today + id;
}

class ConstantScrollBehavior extends ScrollBehavior {
  const ConstantScrollBehavior();

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) => child;

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) => child;

  @override
  TargetPlatform getPlatform(BuildContext context) => TargetPlatform.macOS;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}
