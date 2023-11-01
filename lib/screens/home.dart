// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AdvancedDrawerController controller = AdvancedDrawerController();
    List<String> folderNames = [
      'Instagram',
      'Whatsapp',
      'Downloads',
      'Videos',
      'Camera'
    ];

    return AdvancedDrawer(
      controller: controller,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 200),
      disabledGestures: false,
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.blue.withOpacity(0.2)],
          ),
        ),
      ),
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.flutter_dash,size: 42,)
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                controller.showDrawer();
              },
              icon: Icon(Icons.open_in_browser)),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'OVPlayer',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark
              .copyWith(statusBarColor: Colors.blue.shade400),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  tileMode: TileMode.clamp,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.blue.shade400,
                    Colors.blue.shade400,
                    Colors.white
                  ]),
            ),
          ),
          actionsIconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(),
          child: ListView.builder(
              itemCount: folderNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  horizontalTitleGap: 15,
                  minVerticalPadding: 20,
                  title: Text(folderNames[index]),
                  leading: Icon(
                    Icons.folder,
                    size: 40,
                    color: Colors.grey.shade400,
                  ),
                  subtitle: Text('1 video'),
                );
              }),
        ),
      ),
    );
  }
}
