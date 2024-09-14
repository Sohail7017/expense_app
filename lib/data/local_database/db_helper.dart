import 'dart:io';

import 'package:expense_app/data/models/expense_model.dart';
import 'package:expense_app/data/models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbHelper{

  DbHelper._();

  static final DbHelper getInstance = DbHelper._();

  Database ? mainDB;
  SharedPreferences? prefers;

 /// Expense Table
  static final String EXPENSE_TABLE = 'expense';
  static final String EXPENSE_EID = 'eId';
  static final String EXPENSE_TITLE = 'title';
  static final String EXPENSE_DESC = 'desc';
  static final String EXPENSE_CAT = 'category';
  static final String EXPENSE_TYPE = 'tType';
  static final String EXPENSE_TIME  = 'time';
  static final String EXPENSE_AMOUNT = 'amount';
  static final String EXPENSE_BAL = 'bal';





  ///  User Table
  static final String USER_TABLE = 'user';
  static final String COLUMN_USER_ID = 'u_id';
  static final String CLUMN_USER_FNAME = 'first_name';
  static final String COLUMN_USER_LNAME = 'last_name';
  static final String COLUMN_USER_EMAIL = 'u_email';
  static final String COLUMN_USER_PASS = 'u_pass';

  static final String PREFERS_UID = 'u_id';


  Future<Database> getDb() async{
    mainDB ??= await openDb();
    return mainDB!;
  }
   Future<Database> openDb() async{
    Directory appDirectory   = await getApplicationDocumentsDirectory();
    String dbPath = join(appDirectory.path , 'expenseDb.db');
    return  openDatabase(dbPath , version: 1, onCreate: (db,version){
    db.execute('''create table $USER_TABLE ( 
    $COLUMN_USER_ID integer primary key autoincrement,
     $CLUMN_USER_FNAME text,
      $COLUMN_USER_LNAME text,
      $COLUMN_USER_EMAIL text unique,
     $COLUMN_USER_PASS text)''');
    
    db.execute('''create table  $EXPENSE_TABLE (
         $EXPENSE_EID integer primary key autoincrement ,
         $COLUMN_USER_ID integer,
        $EXPENSE_TITLE text,
        $EXPENSE_DESC text,
        $EXPENSE_CAT integer,
        $EXPENSE_TYPE integer,
        $EXPENSE_TIME text,
        $EXPENSE_AMOUNT real,
        $EXPENSE_BAL real
        )''');
    });
   }

   /// Add user

  Future<bool> addUser(UserModel newUser) async{
    var db = await getDb();
      bool haveAccount = await isEmailExists(newUser.email);
      bool createdAccount = false;
    if(!haveAccount){
     var rowsEffected =  await db.insert(USER_TABLE, newUser.toMap());
     createdAccount =  rowsEffected>0;
    }
    return createdAccount;

   }

   ///  Check mail exits or not
   Future<bool> isEmailExists(String email) async{
    var db = await getDb();
    var mData = await db.query(USER_TABLE, where: '$COLUMN_USER_EMAIL = ?' , whereArgs: [email]);
    
    return mData.isNotEmpty;
   }

   /// Login user

 Future<bool> loginUser(String email, String pass) async{
    var db = await getDb();
    var mData = await db.query(USER_TABLE, where:  "$COLUMN_USER_EMAIL = ? AND $COLUMN_USER_PASS = ? ", whereArgs: [email , pass]);

    if(mData.isNotEmpty){
      setID(UserModel.fromMap(mData[0]).uId!);
    }

    return mData.isNotEmpty;
  }

 Future<int> getID() async{
   prefers = await SharedPreferences.getInstance();
  int uId =  prefers!.getInt(PREFERS_UID)!;
  return uId;
  }

  void setID(int uID) async{
    prefers = await SharedPreferences.getInstance();
    prefers!.setInt(PREFERS_UID, uID);
  }

  /// Session maintain
   Future<List<String>> getDetails() async{
    var db = await getDb();
    int userId = await getID();

    var userData = await db.query(USER_TABLE, where: "$COLUMN_USER_ID = ?" ,whereArgs:  ['$userId']);
   String  fName  = UserModel.fromMap(userData[0]).fName;
   String lName =UserModel.fromMap(userData[0]).lName;
   String eMail = UserModel.fromMap(userData[0]).email;

   List<String> userList = [];

   userList.add("${fName} ${lName}");

   userList.add(eMail);

   return userList;
   }





  /// queries of Expense
 Future<bool> addExpense({required ExpenseModel newExpense}) async{
    var db = await getDb();

    int rowsEffected = await db.insert(EXPENSE_TABLE, newExpense.toMap());
    return rowsEffected>0;
 }

 Future<List<ExpenseModel>> getExpense() async{
    var db =await getDb();

    List<Map<String,dynamic>> mData = await db.query(EXPENSE_TABLE);

    List<ExpenseModel> expense = [];

    for(Map<String,dynamic> eachExpense in mData){
      expense.add(ExpenseModel.fromMap(eachExpense));
    }
    return expense;
 }

}