import 'expense_model.dart';

class ExpenseFilterModel {
  num amount;
  String title;
  List<ExpenseModel> myExpense;

  ExpenseFilterModel({required this.amount , required this.title , required this.myExpense});
}