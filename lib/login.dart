

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'welcome.dart';


class LoginPage extends StatelessWidget {
  
final _emailController =TextEditingController();
  final _passController =TextEditingController();
  
    GlobalKey<ScaffoldState> globalKey =GlobalKey<ScaffoldState>();
  Future<FirebaseUser?> login(String phonenumber,String pass) async{
FirebaseAuth _auth= FirebaseAuth.instance;
try{
 AuthResult result =await _auth .signInWithEmailAndPassword(email: _emailController.text ,password: _passController.text);
  FirebaseUser user=result.user; 
  
  return user;
}catch(e){
  print(e);
  return null;
}
  }
  //validation

void validation(){


if(_passController.text.trim().isEmpty || _passController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "password is empty"
    ))
  );
  return;
}

else if(_emailController.text.trim().isEmpty || _emailController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: 
    Text(
      "email is empty"
    ))
  );
  return;
}
}
 Widget textfield({required String hintText,required bool obscureText,required TextEditingController controller}){

    return Container(
      width: 300,
      height: 50,
      child: TextFormField(
        controller: controller,
        /*validator: (value){
        if(_firstnameController.text.trim().isEmpty){
       globalKey.currentState!.showSnackBar(
      SnackBar(content: Text(
        "Fields are empty"
      ),),);
        }*/
        

        
        obscureText: obscureText,
         decoration: InputDecoration(
           
           hintText: hintText,
           hintStyle: TextStyle(color: Colors.grey),
           enabledBorder: UnderlineInputBorder(
             borderSide: BorderSide(color: Colors.grey),
             //borderRadius: BorderRadius.circular(20)
           ),
           focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            // borderRadius: BorderRadius.circular(20)
           )
         ),
       ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      key: globalKey,
       body: SafeArea(
         child: Container(
           
             //width: double.infinity,
            // margin: EdgeInsets.symmetric(horizontal:1,vertical: 0),
        /* decoration: BoxDecoration(
            image: DecorationImage(image:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGPiGoqwJvzn5GDVtIYVY1LDjy3EXYBU_N2A&usqp=CAU'),
            //AssetImage("assets/images/bg.jpg"),
             
            fit: BoxFit.cover,
            ),
         ),*/
         child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
             
            children:[
         Padding(
           padding: const EdgeInsets.only(right: 330,top: 0),
           child: IconButton(onPressed: (){

               Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => Welcome()),  
            ); 
           }, icon:Icon(Icons.arrow_back),color:Colors.pink),
         ),
            Padding(
         padding: const EdgeInsets.only(top: 0),
         child:
          Image.asset('assets/fox_news.png',width: 150,),
            ),
         
         
         Padding(
           padding: const EdgeInsets.only(top: 15,),
           child: Center(
             child: Container(
               width: 320,
               height: 340,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                color: Colors.pink[50],
                 // ignore: prefer_const_literals_to_create_immutables
                 boxShadow: [
                //color: Colors.white, //background color of box
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 25.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    6.0, // Move to right 10  horizontally
                    6.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
               ),
              child: Column(
                  // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                   
                    
                   children: [
                    
                    SizedBox(height:52),
                     textfield(hintText: "Email",
                     
                     obscureText: false, controller: _emailController,
                   
                     ),
                    SizedBox(height:20),
                     textfield(hintText: "Password",
                    
                     obscureText: true, controller: _passController,
                   
                     ),SizedBox(height:20),
                     Container(
                       width: 250,
               height: 50,
                       child: RaisedButton(
                          
               elevation: 7,
                 color: Colors.pink,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(30),
                   //side: BorderSide(color: Colors.red,width: 2),
                   
                   ),
                   child: Text("Login",style: TextStyle(fontSize: 17,color: Colors.white,fontWeight:FontWeight.bold,shadows: [
                  Shadow(
                      blurRadius: 13.0,
                      color: Colors.grey,
                      offset: Offset(5.0, 5.0),
                      ),
               ]),),
                         onPressed: ()async{
                           final email=_emailController.text.toString().trim();
             final pass=_passController.text.toString().trim();
             FirebaseUser? user = await login(email, pass);
             
             if(user !=null){
               Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=>HomePage()
                 ));

             }else{
              validation();
             }
                         })),
                      SizedBox(height: 20,),
                           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             
             children: [
               Text("New User?",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight:FontWeight.bold),),
               GestureDetector(child: Text("Register Now",style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight:FontWeight.bold),
               ),
               onTap:(){
                  Navigator.of(context).pushReplacement(
               MaterialPageRoute(
                 builder:(context)=>HomePage(),
               ),
             );
               }
               ),
             ],
            )
                   ],
                  
                  
                 ),
                
                 
       
             ),
           ),
         ),
            ]
         ),
         ),
       )
    );
  }
}