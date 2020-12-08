import 'package:consultant_app/app/pages/home/add_content_page.dart';
import 'package:consultant_app/app/pages/home/consultant_page.dart';
import 'package:consultant_app/app/pages/home/explorer_page.dart';
import 'package:consultant_app/app/pages/home/rating_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageViewController = PageController();

  final entrepreneurMenuPages = [
    ExplorerPage(),
    ConsultantPage(),
    RatingPage(),
  ];

  final consultantMenuPages = [
    ExplorerPage(),
    AddContentPage(),
    RatingPage(),
  ];

  bool isConsultant = true;

  final consultantMenuIcons = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.video_library),
      title: Text('Explorar'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      title: Text('Adicionar vídeo'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.star),
      title: Text('Avalie'),
    ),
  ];

  final entrepreneurMenuIcons = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.video_library),
      title: Text('Explorar'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people_outline),
      title: Text('Consultores'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.star),
      title: Text('Avalie'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((sharedPreferencesInstance) {
      setState(() {
        isConsultant = !!sharedPreferencesInstance.getBool('isConsultant');
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: pageViewController,
          children: isConsultant ? consultantMenuPages : entrepreneurMenuPages),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: pageViewController?.page?.round() ?? 0,
              onTap: (index) {
                pageViewController.jumpToPage(index);
              },
              backgroundColor: Colors.white,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.black,
              items: isConsultant ? consultantMenuIcons : entrepreneurMenuIcons,
            );
          }),
    );
  }
}
