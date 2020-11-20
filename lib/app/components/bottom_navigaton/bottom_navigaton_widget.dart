import 'package:flutter/material.dart';

class BottomNavigatonWidget extends StatelessWidget {
  final int currentIndex;

  const BottomNavigatonWidget({Key key, this.currentIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      items: const <BottomNavigationBarItem>[
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
      ],
      currentIndex: currentIndex,
      onTap: (_) {},
    );
  }
}
