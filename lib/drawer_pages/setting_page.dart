

import 'package:expense_app/data/provider/change_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget{
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  SharedPreferences? preferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: false,
        title: Text('Settings',style: TextStyle(fontSize: 28,color:  Theme.of(context).brightness==Brightness.light ? Colors.black : Colors.white ,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text('Theme',style: TextStyle( fontSize: 24,color:Theme.of(context).brightness==Brightness.light ? Colors.black : Colors.white ,fontWeight: FontWeight.bold ),),
                Expanded(
                  child: SizedBox(
                    width: 2,
                  ),
                ),
               Icon(Icons.light_mode,size: 20,),
                SizedBox(
                  width: 5,
                ),
                Switch.adaptive(
                  inactiveTrackColor: Colors.white,
                    activeColor: Colors.green.shade500,
                    value: context.watch<ChangeThemeProvider>().getTheme(), onChanged: (value){

                  context.read<ChangeThemeProvider>().updateTheme(value);
                }),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.nightlight_round_outlined,size: 20,),
              ],

            )
          ],
        ),
      ),
    );
  }
}