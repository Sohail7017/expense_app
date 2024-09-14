

import 'package:expense_app/data/bloc/expense_bloc.dart';
import 'package:expense_app/data/local_database/db_helper.dart';
import 'package:expense_app/data/provider/change_theme_provider.dart';
import 'package:expense_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

void main(){
  runApp(BlocProvider(create: (Context) => ExpenseBloc(dbHelper: DbHelper.getInstance),
    child: ChangeNotifierProvider(create: (context) => ChangeThemeProvider(),
    child: ExpenseApp(),
    ),));
}

class ExpenseApp extends StatefulWidget{
  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  @override
  @override
  void initState() {
    super.initState();

  }
  Widget build(BuildContext context) {
    return MaterialApp(

      /// Dark theme
      darkTheme: ThemeData(
        canvasColor: Colors.black,
        brightness: Brightness.dark

      ),

      themeMode: context.watch<ChangeThemeProvider>().getTheme() ? ThemeMode.dark : ThemeMode.light,
      /// Light Theme

      theme: ThemeData(
        canvasColor: Colors.white,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}