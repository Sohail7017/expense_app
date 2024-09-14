import '../models/expense_model.dart';

abstract class ExpenseStates{}

class ExpenseInitialState extends ExpenseStates{}

class ExpenseLoadingState extends ExpenseStates{}

class ExpenseLoadedState extends ExpenseStates{
  List<ExpenseModel> mExpense;
  ExpenseLoadedState({required this.mExpense});

}

class ExpenseErrorState extends ExpenseStates{
  String errorMsg;
  ExpenseErrorState({required this.errorMsg});
}