import 'dart:io';

import 'package:expense_app/data/models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbHelper{

  DbHelper._();

  static final DbHelper getInstance = DbHelper._();
  static final String EXPENSE_TABLE = 'expense';
  static final String USER_TABLE = 'user';
  static final String COLUMN_USER_ID = 'u_id';
  static final String CLUMN_USER_FNAME = 'first_name';
  static final String COLUMN_USER_LNAME = 'last_name';
  static final String COLUMN_USER_EMAIL = 'u_email';
  static final String COLUMN_USER_PASS = 'u_pass';
  Database ? mainDB;

  Future<Database> getDb() async{
    mainDB ??= await openDb();
    return mainDB!;
  }
   Future<Database> openDb() async{
    Directory appDirectory   = await getApplicationDocumentsDirectory();
    String dbPath = join(appDirectory.path , 'expenseDb.db');
    return await openDatabase(dbPath , version: 1, onCreate: (db,version){
    db.execute('create table $USER_TABLE ( $COLUMN_USER_ID integer primary key autoincrement, $CLUMN_USER_FNAME text, $COLUMN_USER_LNAME text ,$COLUMN_USER_EMAIL text unique, $COLUMN_USER_PASS)');
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
      setID(UserModel.fromMap(mData[0]).id);
    }

    return mData.isNotEmpty;
  }

 Future<int> getID() async{
var prefer = await SharedPreferences.getInstance();
 return prefer.getInt('UID')!;
  }

  void setID(int uID) async{
    var prefers = await SharedPreferences.getInstance();
    prefers.setInt('U_ID', uID);
  }

}