import 'dart:ui';

import 'package:flutter/material.dart';

import 'login.dart';
import 'register.dart';



class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  //const Login({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
extendBodyBehindAppBar: true,
   
     
     /*Padding(
       padding: const EdgeInsets.only(bottom: 20,left: 25),
       child: Text('By continuing you agree to Terms and Conditions'),
     ),*/
      resizeToAvoidBottomInset: false,
       body: SafeArea(
         
         child: Container(
           
             //width: double.infinity,
            // margin: EdgeInsets.symmetric(horizontal:2),
       /*  decoration: const BoxDecoration(
            image: DecorationImage(image:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGPiGoqwJvzn5GDVtIYVY1LDjy3EXYBU_N2A&usqp=CAU'),
            //AssetImage("assets/images/bg.jpg"),
             
            fit: BoxFit.cover,
            ),
         ),*/
         
             child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
             
            children:[
         
            Padding(
         padding: const EdgeInsets.only(top: 55,bottom: 45),
         child: Image.asset('assets/fox_news.png',width: 150,),
            ),
            
                     
           Padding(
             padding: const EdgeInsets.only(top: 40),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Container(
                  width: 330,
             height: 50,
             
                 child: RaisedButton(
                   //splashColor: Colors.red,
             elevation: 7,
             color: Colors.pink,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30),
               //side: BorderSide(color: Colors.red,width: 2),
               
               ),
               child: const Text("Login",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight:FontWeight.bold,shadows: [
              Shadow(
                  blurRadius: 13.0,
                  color: Colors.grey,
                  offset: Offset(5.0, 5.0),
                  ),
             ]),),
                   
                   onPressed: (){
                      
                 Navigator.push(  
                context,  
                MaterialPageRoute(builder: (context) => LoginPage()),  
              ); 
       
                   })),
                   const SizedBox(height: 30,),
                    Container(
                  width: 330,
             height: 50,
                 child: RaisedButton(
                 //  splashColor: Colors.red,
             elevation: 7,
             color: Colors.pink,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30),
               //side: BorderSide(color: Colors.red,width: 2),
               
               ),
               child: const Text("Register",style: TextStyle(fontSize: 17,color: Colors.white,fontWeight:FontWeight.bold,shadows: [
              Shadow(
                  blurRadius: 13.0,
                  color: Colors.grey,
                  offset: Offset(6.0, 6.0),
                  ),
             ]),),
                   
                   onPressed: (){
        
                 Navigator.push(  
                context,  
                MaterialPageRoute(builder: (context) => Register()) , 
              ); 
       
                   })),
       
             ]
             ),
           ),
           const SizedBox(height: 20),
            Row(
         mainAxisAlignment: MainAxisAlignment.center,
         
         children: const [
           Padding(
             padding: EdgeInsets.only(bottom: 0),
             child: Text("Trouble signing in?",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight:FontWeight.bold),),
           ),
           
           //Text("Register Now",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight:FontWeight.bold),)
         ],
            ),
           const Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child:  Text('By continuing you agree to Terms and Conditions'),
          
            
          ),
        ),const SizedBox(height: 8,)
           // SizedBox(height: 115,),
           //BottomNavigationBar(items: ),

           /* Padding(
         padding: const EdgeInsets.only(top: 30),
         child: Column(
          
           mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
           children: [
             Text("By continuing you agree to Terms and Conditions"),
             //Text("Register Now",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight:FontWeight.bold),)
           ],
         ),
             )*/
            
            
            ]
             )
              ),
       )
    );
     
  }
}