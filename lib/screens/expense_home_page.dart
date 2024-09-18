
import 'dart:math';



import 'package:expense_app/data/bloc/expense_bloc.dart';
import 'package:expense_app/data/bloc/expense_events.dart';
import 'package:expense_app/data/bloc/expense_states.dart';
import 'package:expense_app/data/local_database/db_helper.dart';
import 'package:expense_app/domain/app_constant.dart';
import 'package:expense_app/drawer_pages/drawer_ui.dart';
import 'package:expense_app/drawer_pages/setting_page.dart';
import 'package:expense_app/screens/add_expense.dart';
import 'package:expense_app/screens/expense_statistic.dart';
import 'package:expense_app/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbols.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/expense_filter_model.dart';
import '../data/models/expense_model.dart';

class ExpenseHomePage extends StatefulWidget{
  @override
  State<ExpenseHomePage> createState() => _ExpenseHomePageState();
}

class _ExpenseHomePageState extends State<ExpenseHomePage> {

  int selectedDrawer =0;

  SharedPreferences? prefers;



  bool isCategory = false;
  String? userEmail;
  String? userName;

  int selectedIndex = 0;
  List<ExpenseFilterModel> allData = [];
  DateFormat dateFormat = DateFormat.MMMEd();
  DateFormat monthsFormat = DateFormat.yMMM();
  DateFormat yearFormat = DateFormat.y();
  bool isLight = false;
  bool isLandScape = false;
  List<Object> allFilteredTime = ['Month', 'Year', 'Date', 'Category'];

  String selectedtype = 'Date';
  num balance = 0.0;
  @override
  void initState() {
    profileInfo();
    super.initState();
    context.read<ExpenseBloc>().add(GetInitialExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    isLight = Theme.of(context).brightness==Brightness.light;
    isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: isLight? Colors.white : Colors.black ,
      appBar: AppBar(
        backgroundColor:  isLight ? Colors.white : Colors.black ,
        elevation: 2,
          iconTheme: IconThemeData( color: isLight? Colors.black : Colors.white ),
        title:  Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Image.asset('assets/icons/brand_logo.png',width: 30,height: 35,),
              SizedBox(
                width: 5,
              ),
              Text('Monety',style: TextStyle(fontSize: 22,color: isLight? Colors.black : Colors.white,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 35,color:  isLight ? Colors.black : Colors.white )),
          )
        ],
      ),


      drawer: Drawer(

        width: 250,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        child:  Padding(
          padding: const EdgeInsets.only(top: 45),
          child: Column(
            children: [
              headerLay(),
             InkWell(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
               },
               child: ListTile(
              /*   textColor: Colors.black,
                 iconColor: Colors.black,*/
                 leading: Icon(Icons.settings),
                 title: Text('Settings',style: TextStyle(fontSize: 18),),
               ),
             ),
              InkWell(
                onTap: () async{
                 SharedPreferences prefs =  await SharedPreferences.getInstance();
                 prefs.getInt(DbHelper.PREFERS_UID,);
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                 setState(() {

                 });
                },
                child: ListTile(
                  textColor:  isLight ? Colors.black : Colors.white,
                  iconColor:  isLight ? Colors.black : Colors.white ,
                  leading: Icon(Icons.login_outlined),
                  title: Text('Log Out',style: TextStyle(fontSize: 18),),
                ),
              ),

            ],
          ),
        ),

      ),

      body: isLandScape ? landScapeUI(): homeExpenseUI(),

      bottomNavigationBar: BottomNavigationBar(

       elevation: 10,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.drafts_outlined,size: 30,),
              label: 'Home'),
          BottomNavigationBarItem(icon: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseStatistic()));
              },
              child: Icon(Icons.bar_chart,size: 30,)),
              label: 'Statistic'),
          BottomNavigationBarItem(icon: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddExpense(balanceNow: balance)));
            },
            child: Container(
                width: 70,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffE78BBC)
                ),
                child: Icon(Icons.add,size: 30,color: Colors.white,)),
          ),
              label: 'Add'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.notifications,size: 30,),
              label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb,size: 30,),
              label: 'Settings'
          ),

        ],


        selectedFontSize: 10,
        unselectedItemColor: Color(0xffC2C1CE),
        selectedItemColor: Color(0xffE78BBC),
        currentIndex: selectedIndex,
        onTap: (value){
          selectedIndex = value;
          setState(() {

          });
        },

      ),
    );

  }



  Widget homeExpenseUI(){
    return  Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            /* color: Colors.white,*/
              border: Border(bottom: BorderSide(width: 2,
                  color: Color(0xffE0E6F8)))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/icons/mle_logo.png'),
                        backgroundColor: Color(0xffE8C38E),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Morning',style: TextStyle(fontSize: 18,color:  isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold),),
                        Text('${userName}',style: TextStyle(fontSize: 15,color:  isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 54,
                      ),
                    ),

                    DropdownButton(

                      dropdownColor:  isLight ?  Color(0xff6574D3) : Colors.black,
                      iconEnabledColor:  isLight ?  Color(0xff6574D3) : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      value: selectedtype,
                      items: allFilteredTime
                          .map((eachValue) => DropdownMenuItem(
                        value: eachValue,
                        child: Text(eachValue.toString()),
                      ))
                          .toList(),
                      onChanged: (value) {
                        selectedtype = value.toString();
                        if(selectedtype== "Category"){
                          isCategory = true;
                        }else{
                          isCategory = false;
                        }
                        setState(() {});
                      },
                    ),
                  ],
                )

                /*  SizedBox(
                    height: 175,
                  ),
                    Expanded(child: listUI()),*/
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:  20,right: 20,top: 80),
          child: Container(

            height: 140,
            decoration: BoxDecoration(
                color:  isLight ? Colors.purple.shade300 : Color(0xff6574D3),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text('Expense Toatal',style: TextStyle(fontSize: 16,color: Colors.white,)),
                  SizedBox(
                    height: 3,
                  ),
                  Text("\$${balance}",style: TextStyle(fontSize: 34,color: Colors.white,fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xffDC5F5E),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(child: Text("+\$240",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Than last month",style: TextStyle(fontSize: 12,color: Colors.white,)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ) ,
        Padding(
          padding: const EdgeInsets.only(top: 80,left: 210),
          child: Container(
            width: 250,
            height: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/icons/button_logo.png'))
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 240),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Expense List",style: TextStyle(fontSize: 18,color:  isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: BlocConsumer<ExpenseBloc, ExpenseStates>(
                        listener: (_,state){
                          if(state is ExpenseLoadedState){
                            balance = state.mExpense.isNotEmpty ? state.mExpense.last.bal : 0.0;
                            setState(() {

                            });
                          }
                        },
                        builder: (_,state){
                          if(state is ExpenseLoadingState){
                            return Center(
                              child: CircularProgressIndicator(),);
                          }else if (state is ExpenseErrorState){
                            return Center(
                              child: Text('Error: ${state.errorMsg}'),
                            );
                          }
                          else if(state is ExpenseLoadedState){
                            var allExpenses = state.mExpense;
                            filterExpenseDate(allExpenses, isCategory);
                            return allData.isNotEmpty ? ListView.builder(
                                itemCount: allData.length,
                                shrinkWrap: true,

                                itemBuilder: (_,index){
                                  return  Container(

                                    margin: EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 2,
                                            color: Color(0xffE0E6F8)
                                        )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          title:  Text(allData[index].title,style: TextStyle(fontSize: 16,color:  isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold)),
                                          trailing:  Text("\$${allData[index].amount}",style: TextStyle(fontSize: 16,color:  isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 16),
                                          child: Container(

                                            width: 328,
                                            height: 2,
                                            color: Color(0xffE0E6F8),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemCount: allData[index].myExpense.length,
                                            itemBuilder: (_,childIndex){
                                              List<Map<String, dynamic>> filteredList = AppConstant.category.where((element) => element['Id']==allData[index].myExpense[childIndex].cat).toList();
                                              String image = filteredList[0]['Image'];

                                              return ListTile(
                                                leading: Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)].shade100,
                                                    ),
                                                    child: Center(child: Image.asset(image,width: 35,height: 35,))),
                                                title:  Text(allData[index].myExpense[childIndex].title,style: TextStyle(fontSize: 18,color:  isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold)),
                                                subtitle: Text(allData[index].myExpense[childIndex].desc,style: TextStyle(fontSize: 14,color: Color(0xff9A99AA),fontWeight: FontWeight.bold)),
                                                trailing: Text("\$${allData[index].myExpense[childIndex].amount}",style: TextStyle(
                                                    fontSize: 16,
                                                    color: allData[index].myExpense[0].tType == 0 ? Color(0xffE78BBC) : Colors.green.shade200,
                                                    fontWeight: FontWeight.bold)),
                                              );
                                            })

                                      ],
                                    ),
                                  )
                                  ;
                                }):Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/icons/center_logo.png",
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "No Expenses Yet!!!",
                                    style: TextStyle(
                                        color: isLight? Colors.black : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                )
                              ],
                            ) ;

                          }

                          return Container();
                        }),
                  ),
                ],
              ),
            ),
          ),
        )


      ],
    );
  }



  Widget landScapeUI(){
    return Padding(
      padding: const EdgeInsets.only(left: 5,right: 15,top: 15),
      child: Row(

        children: [

          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/icons/mle_logo.png'),
                          backgroundColor: Color(0xffE8C38E),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Morning',style: TextStyle(fontSize: 18,color:  isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold),),
                          Text('${userName}',style: TextStyle(fontSize: 15,color:  isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 54,
                        ),
                      ),

                      DropdownButton(

                        dropdownColor:  isLight ?  Color(0xff6574D3) : Colors.black,
                        iconEnabledColor:  isLight ?  Color(0xff6574D3) : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        value: selectedtype,
                        items: allFilteredTime
                            .map((eachValue) => DropdownMenuItem(
                          value: eachValue,
                          child: Text(eachValue.toString()),
                        ))
                            .toList(),
                        onChanged: (value) {
                          selectedtype = value.toString();
                          if(selectedtype== "Category"){
                            isCategory = true;
                          }else{
                            isCategory = false;
                          }
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:  15,right: 15,top: 65),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                        color:  isLight ? Colors.purple.shade300 : Color(0xff6574D3),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Text('Expense Toatal',style: TextStyle(fontSize: 16,color: Colors.white,)),
                          SizedBox(
                            height: 3,
                          ),
                          Text("\$${balance}",style: TextStyle(fontSize: 34,color: Colors.white,fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xffDC5F5E),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(child: Text("+\$240",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold))),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Than last month",style: TextStyle(fontSize: 12,color: Colors.white,)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 68,left: 220),
                  child: Container(
                    width: 250,
                    height: 130,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/icons/button_logo.png'))
                    ),
                  ),
                )
              ],
            ),
          ),
            Expanded(
            flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Expense List",style: TextStyle(fontSize: 18,color:  isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: BlocConsumer<ExpenseBloc, ExpenseStates>(
                          listener: (_,state){
                            if(state is ExpenseLoadedState){
                              balance = state.mExpense.isNotEmpty ? state.mExpense.last.bal : 0.0;
                              setState(() {

                              });
                            }
                          },
                          builder: (_,state){
                            if(state is ExpenseLoadingState){
                              return Center(
                                child: CircularProgressIndicator(),);
                            }else if (state is ExpenseErrorState){
                              return Center(
                                child: Text('Error: ${state.errorMsg}'),
                              );
                            }
                            else if(state is ExpenseLoadedState){
                              var allExpenses = state.mExpense;
                              filterExpenseDate(allExpenses, isCategory);
                              return allData.isNotEmpty ? ListView.builder(
                                  itemCount: allData.length,
                                  shrinkWrap: true,

                                  itemBuilder: (_,index){
                                    return  Container(

                                      margin: EdgeInsets.only(bottom: 15),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 2,
                                              color: Color(0xffE0E6F8)
                                          )
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            title:  Text(allData[index].title,style: TextStyle(fontSize: 16,color:  isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold)),
                                            trailing:  Text("\$${allData[index].amount}",style: TextStyle(fontSize: 16,color:  isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16),
                                            child: Container(

                                              width: 328,
                                              height: 2,
                                              color: Color(0xffE0E6F8),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              physics: NeverScrollableScrollPhysics(),
                                              itemCount: allData[index].myExpense.length,
                                              itemBuilder: (_,childIndex){
                                                List<Map<String, dynamic>> filteredList = AppConstant.category.where((element) => element['Id']==allData[index].myExpense[childIndex].cat).toList();
                                                String image = filteredList[0]['Image'];

                                                return ListTile(
                                                  leading: Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)].shade100,
                                                      ),
                                                      child: Center(child: Image.asset(image,width: 35,height: 35,))),
                                                  title:  Text(allData[index].myExpense[childIndex].title,style: TextStyle(fontSize: 18,color:  isLight ? Colors.black : Colors.white ,fontWeight: FontWeight.bold)),
                                                  subtitle: Text(allData[index].myExpense[childIndex].desc,style: TextStyle(fontSize: 14,color: Color(0xff9A99AA),fontWeight: FontWeight.bold)),
                                                  trailing: Text("\$${allData[index].myExpense[childIndex].amount}",style: TextStyle(
                                                      fontSize: 16,
                                                      color: allData[index].myExpense[0].tType == 0 ? Color(0xffE78BBC) : Colors.green.shade200,
                                                      fontWeight: FontWeight.bold)),
                                                );
                                              })

                                        ],
                                      ),
                                    )
                                    ;
                                  }):Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      "assets/icons/center_logo.png",
                                      width: 200,
                                      height: 200,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "No Expenses Yet!!!",
                                      style: TextStyle(
                                          color: isLight? Colors.black : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  )
                                ],
                              ) ;

                            }

                            return Container();
                          }),
                    ),
                  ],
                ),
              ),
            ),


        ],
      ),
    );
  }


  void profileInfo() async{
    var db = await DbHelper.getInstance;
    List<String> usersName = await db.getDetails();
    userName = usersName[0];
    userEmail = usersName[1];
    setState(() {

    });
  }




  /// Filter Date

  void filterExpenseDate(List<ExpenseModel> allExpense, bool isCat){
    allData.clear();
    if(isCat){
      var uniqueCat = AppConstant.category;
      for(int i=0; i<AppConstant.category.length; i++){
        int catId = uniqueCat[i][AppConstant.image_id];
        num amt = 0;

        List<ExpenseModel> uniqueExpense = [];
        for(ExpenseModel eachExpense in allExpense){
          int expenseCat = eachExpense.cat;
          if(expenseCat == catId){
            uniqueExpense.add(eachExpense);
            if(eachExpense.cat == 0){
              amt -= eachExpense.amount;
            }else{
              amt += eachExpense.amount;
            }
          }
        }
        if(uniqueExpense.isNotEmpty)
          allData.add(ExpenseFilterModel(
              amount: amt,
              title: uniqueCat[i][AppConstant.image_name],
              myExpense: uniqueExpense));

      }

    }
    else{
      var uniqueDates = [];
      for(ExpenseModel eachExpense in allExpense){
        var date = "";
        if(selectedtype == "Date"){
          date = dateFormat.format(
            DateTime.fromMillisecondsSinceEpoch(int.parse(eachExpense.time))
          );
        }else if (selectedtype == "Month") {
          date = monthsFormat.format(
              DateTime.fromMillisecondsSinceEpoch(int.parse(eachExpense.time)));
        }else {
          date = yearFormat.format(
              DateTime.fromMillisecondsSinceEpoch(int.parse(eachExpense.time)));
        }
        if(!uniqueDates.contains(date)){
          uniqueDates.add(date);
        }
      }
      for(String eachDate in uniqueDates){
        List<ExpenseModel> expUniqueDate = [];
        num amt = 0;
         
        for(ExpenseModel eachExpense in allExpense){
          var date = "";
          if(selectedtype == 'Date'){
            date = dateFormat.format(
              DateTime.fromMillisecondsSinceEpoch(int.parse(eachExpense.time))
            );
          } else if (selectedtype == "Month") {
            date = monthsFormat.format(
                DateTime.fromMillisecondsSinceEpoch(int.parse(eachExpense.time)));
          }else {
            date = yearFormat.format(
                DateTime.fromMillisecondsSinceEpoch(int.parse(eachExpense.time)));
          }
          if(date == eachDate){
            expUniqueDate.add(eachExpense);
            if(eachExpense.tType == 0){
              amt -= eachExpense.amount;
            }else /*if(eachExpense.tType == 1)*/{
              amt += eachExpense.amount;
            }
          }
        }
        allData.add(ExpenseFilterModel(
            amount: amt, 
            title: eachDate, 
            myExpense: expUniqueDate));
      }
    }
    }


    /// Header Lay

Widget headerLay(){
    return ListTile(
      textColor: Colors.black,
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/icons/mle_logo.png'),
        backgroundColor: Color(0xffE8C38E),
      ),
      title: Text("${userName}",style: TextStyle(color: Theme.of(context).brightness==Brightness.light? Colors.black : Colors.white ),),
      subtitle: Text("${userEmail}",style: TextStyle(color:  Theme.of(context).brightness==Brightness.light ? Colors.black : Colors.white ),),
    );
}


}