import 'package:consultant_app/app/components/category_select/category_select_widget.dart';
import 'package:consultant_app/app/components/content_card/content_card_widget.dart';
import 'package:consultant_app/app/services/explorer_service.dart';
import 'package:consultant_app/app/services/login_service.dart';
import 'package:flutter/material.dart';

class ExplorerPage extends StatefulWidget {
  @override
  _ExplorerPageState createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  List videoContentList = [];

  @override
  void initState() {
    super.initState();

    ExplorerService.getVideoContent().then((result) {
      setState(() {
        videoContentList = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explorar'), actions: [
        GestureDetector(
          onTap: () {
            LoginService.logout().then((result) {
              Navigator.of(context).pushReplacementNamed('/login');
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.exit_to_app, size: 26.0),
          ),
        )
      ]),
      body: Container(
        child: Container(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 24, left: 26, right: 26, bottom: 12),
            child: Column(
              children: [
                CategorySelectWidget(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) =>
                        ContentCardWidget(videoContentList[index]),
                    itemCount: videoContentList.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
