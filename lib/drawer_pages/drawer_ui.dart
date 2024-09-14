import 'package:expense_app/drawer_pages/setting_page.dart';
import 'package:flutter/material.dart';

class DrawerUi {

  static final List<Map<String,dynamic>> drawerList = [
    {
      'Icons' : Icon(Icons.settings),
      'Icon_Name' : 'Setting',
      'Page' : SettingPage(),
    },
    {
      'Icons' : Icon(Icons.login_outlined),
      'Icon_Name' : 'Log Out',
      'Page' : Container(),
    },
  ];
}