import 'package:bottom_navbar/screens/fav.dart';
import 'package:bottom_navbar/screens/home.dart';
import 'package:flutter/material.dart';


import 'wallpapers/all_images.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Wallpaper App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pages = [AllImages(), Home(), Favorite()];
  final pageController = PageController(initialPage: 1);
  int currentSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return pages[index];
        },
        onPageChanged: (int index) {
          setState(() {
            currentSelected = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentSelected,
        items: [
          BottomNavigationBarItem(label: "All Images", icon: Icon(Icons.image)),
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Favorites", icon: Icon(Icons.favorite)),
        ],
        onTap: (int index){
          setState(() {
            currentSelected = index;
            pageController.animateToPage(currentSelected,curve: Curves.fastOutSlowIn,duration: Duration(milliseconds: 400));
          });
        },
      ),
    );
  }
}

