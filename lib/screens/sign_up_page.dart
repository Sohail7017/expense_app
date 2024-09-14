import 'package:expense_app/data/local_database/db_helper.dart';
import 'package:expense_app/data/models/user_model.dart';
import 'package:expense_app/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget{
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool obscureText = true;
  SharedPreferences? prefers;

  TextEditingController firstController = TextEditingController();

  TextEditingController lastController = TextEditingController();

  TextEditingController mailController = TextEditingController();

  TextEditingController passController = TextEditingController();

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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/brand_logo.png',),
                  Text('Monety',style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),

                ],
              ),
              Center(child: Text("Now let's make you a Monety member",style: TextStyle(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.bold),)),



              SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 180,
                    height: 55,
                    child: TextField(
                      controller: firstController,
                      decoration: InputDecoration(
                        label: Text('First Name'),
                        labelStyle: TextStyle(fontSize: 15,color: Colors.black38,fontWeight: FontWeight.w600),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,color: Colors.black54),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,color: Color(0xffE78BBC)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 180,
                    height: 55,
                    child: TextField(
                      controller: lastController,
                      decoration: InputDecoration(

                        label: Text('Last Name') ,
                        labelStyle: TextStyle(fontSize: 15,color: Colors.black38,fontWeight: FontWeight.w600),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,color: Colors.black54 ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,color: Color(0xffE78BBC)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                child: TextField(
                  controller: mailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail,size: 25,color: Colors.black45,),
                    label: Text('Enter your mail'),
                    labelStyle: TextStyle(fontSize: 15,color: Colors.black38,fontWeight: FontWeight.w600),
                    suffixText: '@gmail.com',
                    suffixStyle: TextStyle(fontSize: 15,color: Colors.black38,fontWeight: FontWeight.w600),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: Colors.black54),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: Color(0xffE78BBC)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                child: TextField(
                  onTap: (){
                    obscureText = false;
                    setState(() {

                    });
                  },
                  controller: passController,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password,size: 25,color: Colors.black38,),
                    label: Text('Password'),
                    labelStyle: TextStyle(fontSize: 15,color: Colors.black38,fontWeight: FontWeight.w600),
                    suffixIcon: obscureText == true ? Icon(Icons.visibility,size: 20,color: Colors.black45,) : Icon(Icons.visibility_off,size: 20,color: Colors.black45,),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: Colors.black54),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: Color(0xffE78BBC)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 25,
              ),
              RichText(text: TextSpan(
                  children: [
                    TextSpan(text: 'X  ',style: TextStyle(fontSize: 15,color: Colors.black45,fontWeight: FontWeight.w600)),
                    TextSpan(text: 'Minimum of 8 Characters',style: TextStyle(fontSize: 15,color: Colors.black45,fontWeight: FontWeight.w600)),
                  ]
              )),
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: 'X  ',style: TextStyle(fontSize: 15,color: Colors.black45,fontWeight: FontWeight.w600)),
                  TextSpan(text: 'Uppercase, Lowercase letters, and one number',style: TextStyle(fontSize: 15,color: Colors.black45,fontWeight: FontWeight.w600)),
                ]
              )),
              SizedBox(
                height: 20,
              ),
               Container(

                height: 2,
                color: Colors.black38,
              ),

                SizedBox(
                  height: 25,
                ),
              Container(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () async{
                    var db = DbHelper.getInstance;
                    var check = await db.addUser(UserModel(
                        fName: firstController.text.toString(),
                        lName: lastController.text.toString(),
                        email: mailController.text.toString(),
                        pass: passController.text.toString()));
                  if(check){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User registered successfully!!', style: TextStyle(color: Colors.white,fontSize: 16)), backgroundColor: Color(0xffE78BBC).withOpacity(0.7),));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email already registered!!',style: TextStyle(color: Colors.white,fontSize: 16)),backgroundColor: Color(0xffE78BBC).withOpacity(0.7),
                        action: SnackBarAction( onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        label: 'Sign in',
                        ),

                        ));
                  }


                  }, child: Text('Sign Up',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(backgroundColor: Color(0xffE78BBC)),)),

              Center(child: TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              }, child: Text('Already have an account',style: TextStyle(fontSize: 18,color: Colors.black87,fontWeight: FontWeight.bold),)))



            ],
          ),
        ),
      ),
    );
  }
}