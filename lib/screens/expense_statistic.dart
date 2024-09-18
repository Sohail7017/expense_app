
import 'package:expense_app/screens/expense_home_page.dart';
import 'package:flutter/material.dart';

class ExpenseStatistic extends StatefulWidget{
  @override
  State<ExpenseStatistic> createState() => _ExpenseStatisticState();
}

class _ExpenseStatisticState extends State<ExpenseStatistic> {
  int selectedIndex = 0;
  bool isLight = false;
  @override
  Widget build(BuildContext context) {
    isLight = Theme.of(context).brightness==Brightness.light ;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('Statistic',style: TextStyle(fontSize: 22,color: isLight?Color(0xff12183D) : Colors.white,fontWeight: FontWeight.bold),),
                    IconButton(onPressed: (){}, icon: Container(
                      width: 140,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xffEFF1FD),
                          borderRadius: BorderRadius.circular(7)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('This month',style: TextStyle(fontSize: 15,color: Color(0xff363B5D),fontWeight: FontWeight.bold),),
                          Icon(Icons.keyboard_arrow_down,size: 30,color: Color(0xff363B5D),),
                        ],
                      ),
                    )),

                  ],
                ),
                Container(

                  height: 140,
                  decoration: BoxDecoration(
                      color: Color(0xff6574D3),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Toatal Expense',style: TextStyle(fontSize: 20,color: Color(0xffD8DDF4),)),

                            SizedBox(
                              height: 40,
                              width: 40,
                              child: CircleAvatar(
                                  backgroundColor: Colors.white.withOpacity(0.2),
                                  child: IconButton(onPressed: (){}, icon: Center(child: Icon(Icons.more_horiz,size: 20,color: Color(0xffF9FAFD),weight: 20,)))),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        RichText(text: TextSpan(
                            style: TextStyle(fontSize: 34,color: Colors.white,fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(text: '\$3,734 '),
                              TextSpan(text: '/ \$4000 per month',style: TextStyle(fontSize: 15,color: Color(0xffA1A9E3))),
                            ]
                        )),
                        SizedBox(
                          height: 15,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 320,
                              height: 6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            Container(
                              width: 250,
                              height: 6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Color(0xffEBC68F),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Expense Breakdown',style: TextStyle(fontSize: 18,color: isLight?Color(0xff12183D) : Colors.white,fontWeight: FontWeight.bold),),
                        Text('Limit\$900 / week',style: TextStyle(fontSize: 13,color: isLight?Color(0xff5A5E7B) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),)
                      ],
                    ),
                          SizedBox(
                            width: 10,
                          ),
                    IconButton(onPressed: (){}, icon: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xffEFF1FD),
                          borderRadius: BorderRadius.circular(7)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Week',style: TextStyle(fontSize: 15,color: Color(0xff363B5D),fontWeight: FontWeight.bold),),
                          Icon(Icons.keyboard_arrow_down,size: 30,color: Color(0xff363B5D),),
                        ],
                      ),
                    )),

                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [

                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10,right: 5),
                          child: Container(
                            width: 50,
                            height: 30,
                            child:  Center(child: Text('\$900',style: TextStyle(fontSize: 15,color: Color(0xffFBF1F1),fontWeight: FontWeight.bold,),)),
                            decoration: BoxDecoration(
                                color: Color(0xffDB6565),
                                borderRadius: BorderRadius.circular(12)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 55,top: 14),
                          child: Container(
                            width: 300,
                            height: 4,
                            decoration: BoxDecoration(
                                color: Color(0xffDB6565),
                                borderRadius: BorderRadius.circular(3)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 28,
                                    ),
                                    Text('\$600',style: TextStyle(fontSize: 13,color:  isLight?Color(0xff5A5E7B) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('\$300',style: TextStyle(fontSize: 13,color:  isLight?Color(0xff5A5E7B) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('\$300',style: TextStyle(fontSize: 13,color:  isLight?Color(0xff5A5E7B) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('\$0',style: TextStyle(fontSize: 13,color:  isLight?Color(0xff5A5E7B) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  width: 40,
                                  height: 115,
                                  child: Center(child: Padding(
                                    padding: const EdgeInsets.only(top: 99),
                                    child: Text('\$640',style: TextStyle(fontSize: 10,color: Color(0xffC9EAF3),fontWeight: FontWeight.bold),),
                                  )),
                                  decoration: BoxDecoration(
                                    color: Color(0xff66C2DB),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Container(
                                  width: 40,
                                  height: 130,
                                  child: Center(child: Padding(
                                    padding: const EdgeInsets.only(top: 113),
                                    child: Text('\$880',style: TextStyle(fontSize: 10,color: Color(0xffC9EAF3),fontWeight: FontWeight.bold),),
                                  )),
                                  decoration: BoxDecoration(
                                    color: Color(0xff66C2DB),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Container(
                                  width: 40,
                                  height: 100,
                                  child: Center(child: Padding(
                                    padding: const EdgeInsets.only(top: 85),
                                    child: Text('\$580',style: TextStyle(fontSize: 10,color: Color(0xffC9EAF3),fontWeight: FontWeight.bold),),
                                  )),
                                  decoration: BoxDecoration(
                                    color: Color(0xff66C2DB),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: 93,
                              ),
                              Container(
                                width: 40,
                                height: 126,
                                child: Center(child: Padding(
                                  padding: const EdgeInsets.only(top: 109),
                                  child: Text('\$715',style: TextStyle(fontSize: 10,color: Color(0xffC9EAF3),fontWeight: FontWeight.bold),),
                                )),
                                decoration: BoxDecoration(
                                  color: Color(0xff66C2DB),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 250,bottom: 30),
                          child: Container(
                            width: 45,
                            height: 160,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 145),
                              child: Center(child: Text('\$960',style: TextStyle(fontSize: 10,color: Color(0xffC9EAF3),fontWeight: FontWeight.bold))),
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xffDB6565),
                                borderRadius: BorderRadius.circular(7)
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 65,top: 170),
                          child: Row(
                            children: [
                              Text('W1',style: TextStyle(fontSize: 13,color:  isLight?Color(0xff5A5E7B) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                              SizedBox(
                                width: 46,
                              ),
                              Text('W2',style: TextStyle(fontSize: 13,color:  isLight?Color(0xff5A5E7B) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                              SizedBox(
                                width: 46,
                              ),
                              Text('W3',style: TextStyle(fontSize: 13,color:  isLight?Color(0xff5A5E7B) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),

                              SizedBox(
                                width: 46,
                              ),
                              Text('W4',style: TextStyle(fontSize: 13,color:  isLight?Color(0xff5A5E7B) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                              SizedBox(
                                width: 50,
                              ),
                              Text('W5',style: TextStyle(fontSize: 13,color:  isLight?Color(0xff5A5E7B) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                            ],
                          ),
                        )

                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Spending Details',style: TextStyle(fontSize: 18,color: isLight?Color(0xff12183D): Colors.white,fontWeight: FontWeight.bold),),
                Text('Your expenses are divided into 6 categories',style: TextStyle(fontSize: 13,color: isLight?Color(0xff5A5E7B) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        height: 7,

                        decoration: BoxDecoration(
                          color: Color(0xff64DA94),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        height: 7,
                        width: 310,
                        decoration: BoxDecoration(
                          color: Color(0xffD96566),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        height: 7,
                        width: 275,
                        decoration: BoxDecoration(
                          color: Color(0xff63C2DA),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        height: 7,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color(0xffEBC78E),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        height: 7,
                        width: 215,
                        decoration: BoxDecoration(
                          color: Color(0xffEAC78A),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        height: 7,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xffE689BB),

                        ),
                      ),
                    ),
                    Container(
                      height: 7,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color(0xff6672D4),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        children: [
                          Text('40%',style: TextStyle(fontSize: 15,color: isLight?Color(0xffA0A2B2) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                          SizedBox(
                            width: 58,
                          ),
                          Text('25%',style: TextStyle(fontSize: 15,color: isLight?Color(0xffA0A2B2) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                          SizedBox(
                            width: 48,
                          ),
                          Text('15%',style: TextStyle(fontSize: 15,color: isLight?Color(0xffA0A2B2) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                          SizedBox(
                            width: 37,
                          ),
                          Text('10%',style: TextStyle(fontSize: 15,color: isLight?Color(0xffA0A2B2) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                          SizedBox(
                            width: 30,
                          ),
                          Text('5%',style: TextStyle(fontSize: 15,color: isLight?Color(0xffA0A2B2) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                          SizedBox(
                            width: 18,
                          ),
                          Text('5%',style: TextStyle(fontSize: 15,color: isLight?Color(0xffA0A2B2) : Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),
                        ],
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 180,
                      height: 90,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Color(0xffE6EEF9)
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child:Center(
                        child: ListTile(
                          leading:  IconButton(onPressed: (){}, icon: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffD4D6E9)
                              ),
                              child: Icon(Icons.shopping_cart,size: 30,color: Color(0xff7683C8),))),

                          title:  Text('Shop',style: TextStyle(fontSize: 13,color: isLight?Color(0xff12183D):Colors.white,fontWeight: FontWeight.bold),),

                          subtitle:Text('-\$1190',style: TextStyle(fontSize: 13,color: Color(0xffE78BBC),fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),

                        ),
                      ),


                    ),
                    Container(
                      width: 180,
                      height: 90,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Color(0xffE6EEF9)
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: ListTile(
                          leading: IconButton(onPressed: (){}, icon: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffFBE5E7)
                              ),
                              child: Icon(Icons.emoji_transportation_sharp,size: 30,color: Color(0xffDB7075),))),

                          title:Text('Transport',style: TextStyle(fontSize: 13,color: isLight?Color(0xff12183D):Colors.white,fontWeight: FontWeight.bold),),

                          subtitle:Text('-\$867',style: TextStyle(fontSize: 13,color: Color(0xffE78BBC),fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),


                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 180,
                      height: 90,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Color(0xffE6EEF9)
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: ListTile(
                          leading:  IconButton(onPressed: (){}, icon: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffD4D6E9)
                              ),
                              child: Icon(Icons.shopping_cart,size: 30,color: Color(0xff7683C8),))),

                          title:  Text('Shop',style: TextStyle(fontSize: 13,color: isLight?Color(0xff12183D):Colors.white,fontWeight: FontWeight.bold),),

                          subtitle:Text('-\$1190',style: TextStyle(fontSize: 13,color: Color(0xffE78BBC),fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),

                        ),
                      ),),


                    Container(
                      width: 180,
                      height: 90,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Color(0xffE6EEF9)
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: ListTile(
                          leading: IconButton(onPressed: (){}, icon: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffFBE5E7)
                              ),
                              child: Icon(Icons.emoji_transportation_sharp,size: 30,color: Color(0xffDB7075),))),

                          title: Text('Transport',style: TextStyle(fontSize: 13,color: isLight?Color(0xff12183D):Colors.white,fontWeight: FontWeight.bold),),

                          subtitle: Text('-\$867',style: TextStyle(fontSize: 13,color: Color(0xffE78BBC),fontWeight: FontWeight.bold,fontFamily: 'MyFonts'),),

                        ),
                      ),
                    ),
                  ],
                )



              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseHomePage()));
              },
              child: Icon(Icons.drafts_outlined,size: 30,)),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart,size: 30,),
              label: 'Statistic'),
          BottomNavigationBarItem(icon: Container(
              width: 70,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffE78BBC)
              ),
              child: Icon(Icons.add,size: 30,color: Colors.white,)),
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
}