
import 'package:expense_app/screens/expense_statistic.dart';
import 'package:flutter/material.dart';

class ExpenseHomePage extends StatefulWidget{
  @override
  State<ExpenseHomePage> createState() => _ExpenseHomePageState();
}

class _ExpenseHomePageState extends State<ExpenseHomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title:  Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Image.asset('assets/icons/brand_logo.png',width: 30,height: 35,),
              Text('Monety',style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 35,color: Colors.black54,)),
          )
        ],
      ),

      body: Stack(
        children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(width: 2,
                    color: Color(0xffE0E6F8)))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
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
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Morning',style: TextStyle(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.bold),),
                          Text('Blaszczykowski',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(
                        width: 54,
                      ),
                      IconButton(onPressed: (){}, icon: Container(
                        width: 130,
                        height: 40,

                        decoration:BoxDecoration(
                            color: Color(0xffF0F3FE),
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('This Month',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                            Icon(Icons.keyboard_arrow_down,size: 25,color: Colors.black,weight: 15,),
                          ],
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 175,
                  ),
                  Text("Expense List",style: TextStyle(fontSize: 18,color: Color(0xff484866),fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 220,

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
                          title:  Text("Tuesday, 14",style: TextStyle(fontSize: 16,color: Color(0xff484866),fontWeight: FontWeight.bold)),
                          trailing:  Text("-\$1380",style: TextStyle(fontSize: 16,color: Color(0xff484866),fontWeight: FontWeight.bold)),

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
                        ListTile(
                          leading: IconButton(onPressed: (){}, icon: Container(
                              height: 55,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffD4D6E9)
                              ),
                              child: Icon(Icons.shopping_cart,size: 30,color: Color(0xff7683C8),))),
                            title:  Text("Shop",style: TextStyle(fontSize: 18,color: Color(0xff484866),fontWeight: FontWeight.bold)),
                          subtitle: Text("Buy new clothes",style: TextStyle(fontSize: 14,color: Color(0xff9A99AA),fontWeight: FontWeight.bold)),
                          trailing: Text("-\$90",style: TextStyle(fontSize: 16,color: Color(0xffE78BBC),fontWeight: FontWeight.bold)),
                        ),

                        ListTile(
                          leading:  IconButton(onPressed: (){}, icon: Container(
                              height: 55,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffE8E3DF)
                              ),
                              child: Icon(Icons.mobile_screen_share,size: 28,color: Color(0xffD6B688),))),
                          title:   Text("Electronic",style: TextStyle(fontSize: 18,color: Color(0xff484866),fontWeight: FontWeight.bold)),
                          subtitle:  Text("Buy new iphone 14",style: TextStyle(fontSize: 14,color: Color(0xff9A99AA),fontWeight: FontWeight.bold)),
                          trailing:  Text("-\$1290",style: TextStyle(fontSize: 16,color: Color(0xffE78BBC),fontWeight: FontWeight.bold)),  ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 155,

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
                          title: Text("Monday, 14",style: TextStyle(fontSize: 16,color: Color(0xff484866),fontWeight: FontWeight.bold)),
                          trailing:  Text("-\$60",style: TextStyle(fontSize: 16,color: Color(0xff484866),fontWeight: FontWeight.bold)),

                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 328,
                            height: 2,
                            color: Color(0xffE0E6F8),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        ListTile(
                          leading:  IconButton(onPressed: (){}, icon: Container(
                              height: 55,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffFBE5E7)
                              ),
                              child: Icon(Icons.emoji_transportation_sharp,size: 28,color: Color(0xffDB7075),))),

                          title:  Text("Transportation",style: TextStyle(fontSize: 18,color: Color(0xff484866),fontWeight: FontWeight.bold)),

                          subtitle:  Text("Trip to Malang",style: TextStyle(fontSize: 16,color: Color(0xff9A99AA),fontWeight: FontWeight.bold)),

                          trailing: Text("-\$90",style: TextStyle(fontSize: 16,color: Color(0xffE78BBC),fontWeight: FontWeight.bold)),

                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left:  20,right: 20,top: 80),
            child: Container(

              height: 140,
              decoration: BoxDecoration(
                  color: Color(0xff6574D3),
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
                    Text("\$3,734",style: TextStyle(fontSize: 34,color: Colors.white,fontWeight: FontWeight.bold)),
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
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.drafts_outlined,size: 30,),
        label: 'Home'),
        BottomNavigationBarItem(icon: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseStatistic()));
            },
            child: Icon(Icons.bar_chart,size: 30,)),
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