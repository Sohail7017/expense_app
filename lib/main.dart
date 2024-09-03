

import 'package:expense_app/screens/add_expense.dart';
import 'package:expense_app/screens/expense_home_page.dart';
import 'package:expense_app/screens/expense_statistic.dart';
import 'package:expense_app/screens/login_page.dart';
import 'package:expense_app/screens/sign_up_page.dart';
import 'package:expense_app/screens/tutorial_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(ExpenseApp());
}

class ExpenseApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddExpense(),
      debugShowCheckedModeBanner: false,
    );
  }
}