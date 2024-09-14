

import 'package:expense_app/data/local_database/db_helper.dart';

class ExpenseModel{
  int uId;
  int? eId;
  String title;
  String desc;
  int cat;
  int tType;
  String time;
  num amount;
  num bal;
  ExpenseModel({
    this.eId,
    required this.uId ,
    required this.title,
    required this.desc,
    required this.cat ,
    required this.tType,
    required this.time,
    required this.amount,
    required this.bal});

  /// From map

factory ExpenseModel.fromMap(Map<String, dynamic > map) {
  return ExpenseModel(
      eId:  map[DbHelper.EXPENSE_EID],
      uId:  map[DbHelper.COLUMN_USER_ID],
      title: map[DbHelper.EXPENSE_TITLE],
      desc: map[DbHelper.EXPENSE_DESC],
      cat: map[DbHelper.EXPENSE_CAT],
      tType: map[DbHelper.EXPENSE_TYPE],
      time: map[DbHelper.EXPENSE_TIME],
      amount: map[DbHelper.EXPENSE_AMOUNT],
      bal:  map[DbHelper.EXPENSE_BAL]
  );

}

/// To Map
Map<String, dynamic > toMap() {
  return {
    DbHelper.COLUMN_USER_ID : uId,
    DbHelper.EXPENSE_TITLE : title,
    DbHelper.EXPENSE_DESC : desc,
    DbHelper.EXPENSE_CAT  : cat,
    DbHelper.EXPENSE_TYPE : tType,
    DbHelper.EXPENSE_TIME : time,
    DbHelper.EXPENSE_AMOUNT : amount,
    DbHelper.EXPENSE_BAL : bal,
  };

}




}