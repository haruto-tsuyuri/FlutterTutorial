import 'package:flutter/material.dart';

import 'bottom_bar_fab_flutter.dart';
import 'fab_with_icons.dart';
import 'layout.dart';

// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'BottomAppBar with FAB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  String _lastSelected = '画面 :0';

  void _selectedTab(int index) {
    int screenNum = index + 1;
    setState(() {
      _lastSelected = '画面 : $screenNum';
    });
  }

  void _selectedFab(int index) {
    int screenNum = index + 1;
    setState(() {
      _lastSelected = 'FAB: $screenNum';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          _lastSelected,
          style: TextStyle(fontSize: 32.0),
        ),
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'A',
        color: Colors.grey,
        selectedColor: Colors.blueAccent,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'ホーム'),
          FABBottomAppBarItem(iconData: Icons.class_, text: 'ダイアログ'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Bottom'),
          FABBottomAppBarItem(
              iconData: Icons.settings_applications, text: '設定'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(
          context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.sms, Icons.mail, Icons.phone];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;
//   PageController _pageController;
//
//   static List<Widget> _pageList = [
//     CustomPage(pannelColor: Colors.cyan, title: 'Home'),
//     CustomPage(pannelColor: Colors.green, title: 'Settings'),
//     CustomPage(pannelColor: Colors.pink, title: 'Search')
//   ];
//
//   void _onPageChanged(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(
//       initialPage: _selectedIndex,
//     );
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             icon: Icon(Icons.menu),
//             alignment: Alignment.centerLeft,
//             onPressed: () {}),
//         centerTitle: true,
//         title: const Text(
//           'Y/B',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.black54,
//         shape: ContinuousRectangleBorder(
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(30),
//               bottomRight: Radius.circular(30)),
//         ),
//       ),
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: _onPageChanged,
//         children: _pageList,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         tooltip: 'Increment',
//         child: Icon(Icons.settings_overscan),
//         elevation: 2.0,
//       ),
//       bottomNavigationBar:
//       BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Home'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             title: Text('Setting'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             title: Text('Search'),
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           _selectedIndex = index;
//
//           _pageController.animateToPage(index,
//               duration: Duration(milliseconds: 300), curve: Curves.easeIn);
//         },
//       ),
//     );
//   }
// }
//
// class CustomPage extends StatelessWidget {
//   final Color pannelColor;
//   final String title;
//
//   CustomPage({@required this.pannelColor, @required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     final titleTextStyle = Theme.of(context).textTheme.title;
//     return Container(
//       child: Center(
//         child: Container(
//           width: 200,
//           height: 200,
//           decoration: BoxDecoration(
//               color: pannelColor,
//               borderRadius: BorderRadius.all(Radius.circular(20.0))),
//           child: Center(
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: titleTextStyle.fontSize,
//                 color: titleTextStyle.color,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
