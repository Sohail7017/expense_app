import 'package:expense_app/data/models/expense_model.dart';

abstract class ExpenseEvents{}

class AddExpenseEvent extends ExpenseEvents{
  ExpenseModel newExpense;

  AddExpenseEvent({required this.newExpense});

}

class GetInitialExpenseEvent extends ExpenseEvents{}