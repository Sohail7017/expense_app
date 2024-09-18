
import 'package:expense_app/data/bloc/expense_bloc.dart';
import 'package:expense_app/data/bloc/expense_events.dart';
import 'package:expense_app/data/local_database/db_helper.dart';
import 'package:expense_app/data/models/expense_model.dart';
import 'package:expense_app/domain/app_constant.dart';
import 'package:expense_app/screens/expense_home_page.dart';
import 'package:expense_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget{
  num balanceNow;
  AddExpense({required this.balanceNow});
  
  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  int selectedIndex = -1;
  DateTime? selectedDate = DateTime.now();
  List<String> transactionType = ['Default','Debit','Credit','Loan','Borrow'];

  String selectedTransType = 'Debit';
  DateFormat dateFormat = DateFormat.yMMMEd();
  bool isButtonEnabled = false;
  String errorMsg = '';
  bool menuItemCheck = false;
    bool isLight = false;
    bool isLandScape = false;


  @override
  Widget build(BuildContext context) {
     isLight = Theme.of(context).brightness==Brightness.light ;
      isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: isLight ? Color(0xff6574D3) : Color(0xff6574D3).withOpacity(0.1),
        centerTitle: true,
        title: Text('Add Expense',style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),),
      ),


      body: isLandScape ? Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/button_logo.png',width: 180,height: 180,),
                  Text('Add Expense',style: TextStyle(fontSize: 28,color: isLight? Colors.black : Colors.white,fontWeight: FontWeight.bold),)
              ],),
            ),
          ),
          Expanded(
              flex: 2,
              child: SingleChildScrollView(child: addUI(),)),
        ],
      ) : addUI()
    );

  }
  Widget addUI(){
    return Container(
        decoration: BoxDecoration(
        ),
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),

              Text('Tittle',style: TextStyle(fontSize: 20,color: isLight ? Colors.black : Colors.white,fontWeight: FontWeight.bold),),

              SizedBox(
                height: 10,
              ),
              CustomTextField(

                mController: titleController,
                hintText: 'enter your title....',
                labelText: 'Title',

              ),
              SizedBox(
                height: 15    ,
              ),

              Text('Descreption',style: TextStyle(fontSize: 20,color: isLight ? Colors.black : Colors.white,fontWeight: FontWeight.bold),),

              SizedBox(
                height: 10,
              ),
              CustomTextField(

                mController: descController,
                hintText: 'enter your desc....',
                labelText: 'Desc',
                minLines: 2,
              ),
              SizedBox(
                height: 15,
              ),

              Text('Amount',style: TextStyle(fontSize: 20,color: isLight ? Colors.black : Colors.white,fontWeight: FontWeight.bold),),

              SizedBox(
                height: 10,
              ),
              CustomTextField(

                mController: amountController,
                hintText: 'enter your amount....',
                labelText: 'Amount',
                prefixIcon: Icons.currency_rupee,

              ),

              SizedBox(
                height: 20,
              ),

              Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(

                      context: context, builder: (_,){
                    return Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),

                        Center(child: Text('Categories',style: TextStyle(fontSize: 25,color: isLight ? Colors.black : Colors.white,fontWeight: FontWeight.bold),)),
                        SizedBox(
                          height: 20,
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                            child: GridView.builder(

                                itemCount: AppConstant.category.length,
                                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 120,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 1/1,
                                ),

                                itemBuilder: (_,index){
                                  return InkWell(
                                    onTap: (){
                                      selectedIndex = AppConstant.category[index]['Id'];
                                      errorMsg ='';
                                      setState(() {

                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(AppConstant.category[index]['Image'],width: 80,height: 60,),
                                        Text(AppConstant.category[index]['Name'],style: TextStyle(fontSize: 15,color: isLight ? Colors.black : Colors.white),)
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        )
                      ],
                    );
                  });
                },
                  child: selectedIndex == -1 ? Text('Choose Category',
                    style: TextStyle(fontSize: 20,color: isLight ? Colors.white : Colors.white),) : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppConstant.category[selectedIndex -1]['Image'],width: 40,height: 40,),
                      SizedBox(
                        width: 8,
                      ),
                      Text(AppConstant.category[selectedIndex -1]['Name'],style: TextStyle(fontSize: 20,color: isLight ? Colors.white : Colors.white,fontWeight: FontWeight.bold),),

                    ],
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: isLight ? Color(0xff6574D3) : Color(0xff6574D3).withOpacity(0.15),
                      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5))),),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text('Transaction Type',style: TextStyle(fontSize: 20,color: isLight ? Colors.black : Colors.white,fontWeight: FontWeight.bold),),
                  ),

                  SizedBox(
                    width: 20,
                  ),

                  Expanded(
                    child: DropdownMenu(
                    
                        inputDecorationTheme: InputDecorationTheme(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1,color: isLight ? Colors.black : Colors.white),
                                borderRadius: BorderRadius.circular(13)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff6574D3))
                            )
                        ),
                        selectedTrailingIcon: Icon(Icons.keyboard_arrow_up,size: 30,),
                        trailingIcon: Icon(Icons.keyboard_arrow_down,size: 30,),
                        width: MediaQuery.of(context).size.width-220,
                        textStyle: TextStyle(fontSize: 16,color: isLight ? Colors.black : Colors.white,fontWeight: FontWeight.w400),
                        initialSelection: selectedTransType ,
                        onSelected: (value){
                          selectedTransType = value!;
                          setState(() {
                    
                          });
                        },
                        dropdownMenuEntries: transactionType.map((eachType) => DropdownMenuEntry(
                            value: eachType,
                            label: eachType
                        )).toList()
                    ),
                  )
                ],
              ),

              SizedBox(
                  height: 20
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Choose Date *',style: TextStyle(fontSize: 20,color: isLight ? Colors.black : Colors.white,fontWeight: FontWeight.bold),),

                  InkWell(
                    onTap: () async{
                      selectedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2021),
                          lastDate: DateTime.now());
                      setState(() {

                      });
                    },
                    child:  Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1,color: isLight ? Colors.black : Colors.white),
                      ),
                      child: selectedIndex == -1 ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(dateFormat.format(selectedDate ?? DateTime.now())),

                          Icon(Icons.keyboard_arrow_down,size: 25,color: isLight ? Colors.black : Colors.white,)
                        ],
                      ) : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(dateFormat.format(selectedDate!),style: TextStyle(fontSize: 15,color: isLight ? Colors.black : Colors.white),),
                          Icon(Icons.keyboard_arrow_down,size: 25,color: isLight ? Colors.black : Colors.white,)
                        ],
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 30,
              ),

              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async{
                      var db = DbHelper.getInstance;
                      String title = titleController.text.toString();
                      String desc = descController.text.toString();
                      String amount = amountController.text.toString();


                      if(title.isNotEmpty && desc.isNotEmpty && amount.isNotEmpty){
                        int Id = await db.getID();

                        if(selectedIndex != -1){
                          num amt = double.parse(amountController.text.toString());
                          num balance =  widget.balanceNow;
                          if(transactionType == 'Debit'){
                            balance -= amt;
                          }else{
                            balance += amt;
                          }

                          context.read<ExpenseBloc>().add(
                              AddExpenseEvent(newExpense: ExpenseModel(
                                  uId: Id,
                                  title: titleController.text.toString(),
                                  desc: descController.text.toString(),
                                  cat: selectedIndex,
                                  tType: selectedTransType=="Debit" ? 0 : 1,
                                  time: selectedDate!.millisecondsSinceEpoch.toString(),
                                  amount: amt,
                                  bal: balance
                              )));
                          Navigator.pop(context);
                        }else{
                          errorMsg = "Please choose a category of the Expense!!";
                          setState(() {

                          });
                        }
                      }else{
                        errorMsg = "Please filled all the required fields!!";
                        setState(() {

                        });
                      }
                    } ,
                    child: Center(child: Text('Add',style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),)),
                    style: ElevatedButton.styleFrom(backgroundColor: isLight ? Color(0xff6574D3) : Color(0xff6574D3).withOpacity(0.1)),)),
              SizedBox(
                height: 20,
              ),
              Center(child: Text(errorMsg,style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),






            ],
          ),
        )
    );
  }
}



