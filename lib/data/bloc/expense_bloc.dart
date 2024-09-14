import 'package:expense_app/data/bloc/expense_events.dart';
import 'package:expense_app/data/bloc/expense_states.dart';
import 'package:expense_app/data/local_database/db_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseBloc extends Bloc<ExpenseEvents , ExpenseStates>{
  DbHelper dbHelper;
  ExpenseBloc({required this.dbHelper}) : super(ExpenseInitialState()){

    on<AddExpenseEvent>((event, emit)async{
      emit(ExpenseLoadingState());
      bool check = await dbHelper.addExpense(newExpense: event.newExpense);

      if(check){
        var data = await dbHelper.getExpense();
        emit(ExpenseLoadedState(mExpense: data));
      }else{
        emit(ExpenseErrorState(errorMsg: 'Expense not added!!'));
      }
    });

    /// Get Initial Expense

    on<GetInitialExpenseEvent>((event, emit) async{
      emit(ExpenseLoadingState());
      var data = await dbHelper.getExpense();
      emit(ExpenseLoadedState(mExpense: data));
    });

  }


}