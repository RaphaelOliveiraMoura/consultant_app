import 'package:consultant_app/app/components/category_select/category_select_widget.dart';
import 'package:consultant_app/app/components/consultant_card/consultant_card_widget.dart';
import 'package:consultant_app/app/services/consultant_service.dart';
import 'package:consultant_app/app/services/login_service.dart';
import 'package:flutter/material.dart';

class ConsultantPage extends StatefulWidget {
  @override
  _ConsultantPageState createState() => _ConsultantPageState();
}

class _ConsultantPageState extends State<ConsultantPage> {
  List consultants = [];
  List filteredList = [];

  bool loading = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      loading = true;
    });

    ConsultantService.getAll().then((result) {
      setState(() {
        consultants = result;
        filteredList = result;
      });
    }).whenComplete(() {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consultores cadastrados'), actions: [
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
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 24, left: 26, right: 26, bottom: 12),
                child: Column(
                  children: [
                    CategorySelectWidget(
                        label: 'Pesquise a categoria desejada',
                        allOptions: true,
                        onChanged: (category) {
                          setState(() {
                            if (category == 'Todos') {
                              filteredList = consultants;
                              return;
                            }

                            filteredList = consultants
                                .where((data) =>
                                    data['specialization'] == category)
                                .toList();
                          });
                        }),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) =>
                            ConsultantCardWidget(filteredList[index]),
                        itemCount: filteredList.length,
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
