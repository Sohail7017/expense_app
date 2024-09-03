import 'package:expense_app/domain/app_constant.dart';
import 'package:expense_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatelessWidget{
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6574D3),
        centerTitle: true,
        title: Text('Add Expense',style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient:  LinearGradient(colors: [Color(0xff6574D3).withOpacity(0.2),Color(0xff6574D3).withOpacity(0.5),Color(0xff6574D3).withOpacity(0.7)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),

              Text('Tittle',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),

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

              Text('Descreption',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),

              SizedBox(
                height: 10,
              ),
              CustomTextField(

                mController: descController,
                hintText: 'enter your desc....',
                labelText: 'Desc',
                minLines: 3,
              ),
              SizedBox(
                height: 15,
              ),

              Text('Amount',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),

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
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context, builder: (_,){
                    return SingleChildScrollView(
                      child: Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                        
                            Center(child: Text('Categories',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)),
                              SizedBox(
                                height: 20,
                              ),
                        
                            GridView.builder(
                                shrinkWrap: true,
                                itemCount: AppConstant.category.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 1/1,
                                ),
                        
                                itemBuilder: (_,index){
                              return Column(
                                children: [
                                Image.asset(AppConstant.category[index]['Image'],width: 80,height: 60,),
                                Text(AppConstant.category[index]['Name'],style: TextStyle(fontSize: 15,color: Colors.black),)
                                ],
                              );
                            })
                          ],
                        ),
                      ),
                    );
                  });
                },
                  child: Text('Choose Category',
                    style: TextStyle(fontSize: 20,color: Colors.white),),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xff6574D3).withOpacity(0.6),
                      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5))),),
              )
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select category',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),

                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1,color: Colors.black)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Categories',style: TextStyle(fontSize: 18,color: Colors.black),),
                        Icon(Icons.keyboard_arrow_down,size: 35,color: Colors.black,)
                      ],
                    ),
                  )

                 ],
              ),*/
              
            ],
          ),
        ),
      ),
    );

  }
}