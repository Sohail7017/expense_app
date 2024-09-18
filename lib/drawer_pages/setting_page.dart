

import 'package:expense_app/data/provider/change_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget{

  @override
  State<SettingPage> createState() => _SettingPageState();
}
class _SettingPageState extends State<SettingPage> {
  bool isLight = false;
  bool isLandScape = false;

  @override
  Widget build(BuildContext context) {
    isLight =  Theme.of(context).brightness==Brightness.light;
    isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: false,
        title: Text('Settings',style: TextStyle(fontSize: 25,color:  isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold),),
      ),
      body: isLandScape? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.settings,size: 90,color: isLight? Colors.black:Colors.white,),
                Text('Settings',style: TextStyle(fontSize: 25,color: isLight?Colors.black: Colors.white,fontWeight: FontWeight.bold),),

              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: SingleChildScrollView(child: settingUi()))
        ],),
      ) : settingUi()
    );
  }
  Widget settingUi(){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Theme',style: TextStyle( fontSize: 24,color:isLight? Colors.black : Colors.white ,fontWeight: FontWeight.bold ),),
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
                  value: context.watch<ChangeThemeProvider>().getTheme(),
                  onChanged: (value){
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
    );
  }
}