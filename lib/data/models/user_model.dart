import 'package:expense_app/data/local_database/db_helper.dart';

class UserModel {
  int? uId;
  String fName;
  String lName;
  String email;
  String pass;

  UserModel({ this.uId ,required this.fName, required this.lName,required this.email,required this.pass});

  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(
        uId : map[DbHelper.COLUMN_USER_ID],
        fName: map[DbHelper.CLUMN_USER_FNAME],
        lName: map[DbHelper.COLUMN_USER_LNAME],
        email: map[DbHelper.COLUMN_USER_EMAIL],
        pass: map[DbHelper.COLUMN_USER_PASS]);
  }

  Map<String,dynamic> toMap(){
    return{
      DbHelper.COLUMN_USER_ID : uId,
      DbHelper.CLUMN_USER_FNAME : fName,
      DbHelper.COLUMN_USER_LNAME : lName,
      DbHelper.COLUMN_USER_EMAIL : email,
      DbHelper.COLUMN_USER_PASS : pass,
    };
}
}