
import 'package:expense_app/screens/expense_home_page.dart';
import 'package:expense_app/screens/login_page.dart';
import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
          children: [
            Container(
              height: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/brand_logo.png',width: 50,height: 50,),
                      Text('Monety',style: TextStyle(fontSize: 28,color: Colors.black,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 480,bottom: 30),
              child: Container(
                height: 300,
                width: 390,
                decoration: BoxDecoration(
                    color: Color(0xffF8F9FD),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text('Easy way to monitor \nyour expense',style: TextStyle(fontSize: 28,color: Color(0xff0B1037),fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    Text('Safe your future by managing your \nexpense right now',style: TextStyle(fontSize: 16,color: Colors.black26,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 48),
                      child: Row(children: [
                        Icon(Icons.circle,size: 12,color: Color(0xffE8E8F0),),
                        Icon(Icons.circle,size: 12,color: Color(0xffE8E8F0),),
                        Icon(Icons.circle,size: 12,color: Color(0xffECC68F),),
                      ],),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180,left: 5),
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/icons/center_logo.png'))
                ),
              ),
            ),
            Positioned(
              top: 730,
              left: 320,
              child: Container(
                width: 80,
                height: 80,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ExpenseHomePage();
                  },));
                }, child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.arrow_forward_outlined,size: 30,color: Colors.white,),decoration: BoxDecoration(
                      color: Color(0xffE78BBC),
                      borderRadius: BorderRadius.circular(5)
                  ),),
                )),
              ),
            )
          ],
        )

         );
  }
}