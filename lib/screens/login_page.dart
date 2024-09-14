import 'package:expense_app/data/local_database/db_helper.dart';
import 'package:expense_app/screens/expense_home_page.dart';
import 'package:expense_app/screens/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends  StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool? isCheck = false;
  SharedPreferences? prefers;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white,Colors.purple.shade100,Colors.purple.shade100],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 130,
              ),
              Center(child: Image.asset('assets/icons/brand_logo.png',width: 80,height: 80,fit: BoxFit.fill,),),
              Center(child: Text('Monety',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)),
              Text('Please enter your details to Sign in.',style: TextStyle(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.w500),),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 50,

                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: Colors.black12,
                        )

                    ),
                    child: IconButton(onPressed: (){}, icon: Image.asset("assets/icons/apple.png",color: Colors.black,width: 40,height: 40,)),
                  ),
                  Container(
                    width: 100,
                    height: 50,

                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: Colors.black12,
                        )

                    ),
                    child: IconButton(onPressed: (){}, icon: Image.asset("assets/icons/google.png",width: 40,height: 40,)),
                  ),
                  Container(
                    width: 100,
                    height: 50,

                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: Colors.black12,
                        )

                    ),
                    child: IconButton(onPressed: (){}, icon: Image.asset("assets/icons/twiter.png",width: 40,height: 40,)),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text('OR',style: TextStyle(fontSize: 25,color: Colors.black54),),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: mailController,
                decoration: InputDecoration(
                  label: Text('Enter your mailId...'),
                     labelStyle: TextStyle(fontSize: 14),

                     focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.purpleAccent,
                          width: 2,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black45,width: 2)
                    )
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                onTap: (){
                  obscureText = false;
                  setState(() {

                  });
                },
                controller: passController,
                keyboardType: TextInputType.number,
                obscureText: true,
                obscuringCharacter: '*',
                decoration:  InputDecoration(
                  label: Text('Enter your password..'),
                    helperStyle: TextStyle(fontSize: 15,color: Colors.black87),
                    suffixIcon: obscureText == true ? Icon(Icons.visibility,size: 20,) : Icon(Icons.visibility_off,size: 20,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2,color: Colors.black45),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color: Colors.purpleAccent.shade100),
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(value: isCheck,
                     activeColor: Color(0xffE78BBC),
                     tristate: false,
                      onChanged: (newBool){
                        setState(() {
                          isCheck = newBool;
                        });
                      },),
                  Text('Remember Me ',style: TextStyle(fontSize: 17,color: Colors.black,),),
                  SizedBox(
                    width: 60,
                  ),
                  Text('Forget Password?',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w500,decoration: TextDecoration.underline,
                      decorationColor: Colors.black,decorationThickness: 1.5,decorationStyle: TextDecorationStyle.solid),),

                ],
              ),
                  SizedBox(
                    height: 20,
                  ),

              ElevatedButton(onPressed: () async{
                var db = DbHelper.getInstance;

                var check = await db.loginUser(mailController.text.toString(), passController.text.toString());
                 if(check){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExpenseHomePage()));
                 }else{
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Username / password',style: TextStyle(color: Colors.white,fontSize: 16),),backgroundColor: Color(0xffE78BBC).withOpacity(0.7),
                   ));
                 }
               /*  mailController.clear();
                 passController.clear();*/

              }, child: SizedBox(

                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign in',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xffE78BBC)),
              ),
                SizedBox(
                  height: 20,
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account yet? ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400)),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                        },
                        child: Text("Sign up",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold,decoration: TextDecoration.underline)))
                  ],
                )


            ],
          ),
        ),
      )
    );
  }

}