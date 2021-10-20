
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'package:firebase_core/firebase_core.dart';


import 'login.dart';
import 'welcome.dart';

class Register extends StatelessWidget {
  //
  //const Patient({ Key? key }) : super(key: key);
  static String pattern =r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
   final _fullnameController =TextEditingController();
  
  final _emailController =TextEditingController();
  final _phonenumberController =TextEditingController();
  final _passController =TextEditingController();
   RegExp regExp = RegExp(Register.pattern);
  GlobalKey<ScaffoldState> globalKey =GlobalKey<ScaffoldState>();
  Future<bool> registerUser(String fullname,String phonenumber, String email, String pass) async{
FirebaseAuth _auth= FirebaseAuth.instance;
try{
AuthResult result =await _auth.createUserWithEmailAndPassword(email:_emailController.text,password: _passController.text);
  FirebaseUser user=result.user;
  Firestore.instance.collection('userData').document(user.uid).setData(
        { 
          'Fullname':_fullnameController.text,
          
           'phonenumber':_phonenumberController.text,
           'email':_emailController.text,
           'pass':_passController.text,
           'userUid':user.uid,
 
        }
    
  );
  return true;
}
  catch(e){
  
  // ignore: deprecated_member_use
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      e.toString()
    ),),);
  return false;
}
  }
//validation

void validation(){
// ignore: unnecessary_null_comparison
if(_fullnameController.text.trim().isEmpty || _fullnameController.text.trim() == null){
  // ignore: deprecated_member_use
  globalKey.currentState!.showSnackBar(
    const SnackBar(content: Text(
      "doctor Name is empty"
    ))
  );
  return;
}

// ignore: unnecessary_null_comparison
if(_phonenumberController.text.trim().isEmpty || _phonenumberController.text.trim() == null){
  // ignore: deprecated_member_use
  globalKey.currentState!.showSnackBar(
    const SnackBar(content: Text(
      "phonenumber is empty"
    ))
  );
  return;
}
// ignore: unnecessary_null_comparison
if(_emailController.text.trim().isEmpty || _emailController.text.trim() == null){
  // ignore: deprecated_member_use
  globalKey.currentState!.showSnackBar(
    const SnackBar(content: Text(
      "email is empty"
    ))
  );
  return;
}


// ignore: unnecessary_null_comparison
if(_passController.text.trim().isEmpty || _passController.text.trim() == null){
  // ignore: deprecated_member_use
  globalKey.currentState!.showSnackBar(
    const SnackBar(content: Text(
      "password is empty"
    ))
  );
  return;
}
else if(!regExp.hasMatch(_emailController.text)){
  // ignore: deprecated_member_use
  globalKey.currentState!.showSnackBar(
    const SnackBar(content: 
    Text(
      "Please enter valid email"
    ))
  );
  return;
}
}
 Widget textfield({required String hintText,required bool obscureText,required TextEditingController controller}){

    // ignore: sized_box_for_whitespace
    return Container(
      width: 300,
      height: 50,
      child: TextFormField(
        
        /*validator: (value){
        if(_firstnameController.text.trim().isEmpty){
       globalKey.currentState!.showSnackBar(
      SnackBar(content: Text(
        "Fields are empty"
      ),),);
        }*/
        

        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
           
           hintText: hintText,
           hintStyle: const TextStyle(color: Colors.grey),
           enabledBorder: const UnderlineInputBorder(
             borderSide: BorderSide(color: Colors.grey),
             //borderRadius: BorderRadius.circular(20)
           ),
           focusedBorder: const UnderlineInputBorder(
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
      
       body: SafeArea(
         child: SingleChildScrollView(
           child: Container(
               //width: double.infinity,
               margin: const EdgeInsets.symmetric(horizontal:1),
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
               padding: const EdgeInsets.only(right: 330,top:0),
               child: IconButton(onPressed: (){
                
                   Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) => const Welcome()),  
                ); 
               }, icon:const Icon(Icons.arrow_back),color:Colors.blue),
             ),
           
              Padding(
           padding: const EdgeInsets.only(top: 0,bottom: 10),
           child: Image.asset('assets/fox_news.png',width: 250,),
              ),
           
           
           Center(
             child: Padding(
               padding: const EdgeInsets.only(bottom: 70),
               child: Container(
                 width: 320,
                 height: 500,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                  color: Colors.pink[50],
                   boxShadow: const [
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
                     mainAxisAlignment:MainAxisAlignment.spaceBetween,
                     
                      
                     children: [
                      const SizedBox(height:30),
                       textfield(hintText: "Fullname",
                    
                       
                       obscureText: false, controller: _fullnameController,
                     
                       ),
                       
                       textfield(hintText: "PhoneNumber",
                       
                       obscureText: false, controller: _phonenumberController,
                     
                       ),
                       textfield(hintText: "Email",
                       
                       obscureText: false, controller: _emailController,
                     
                       ),
                       
                       textfield(hintText: "Password",
                      
                       obscureText: true, controller: _passController,
                      
                       ),//SizedBox(height:1),
                    
                      // ignore: sized_box_for_whitespace
                      Container(
                         width: 250,
                 height: 50,
                         // ignore: deprecated_member_use
                         child: RaisedButton(
                            //splashColor: Colors.red,
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
                        offset: Offset(5.0, 5.0),
                        ),
                 ]),),
                           onPressed: ()async{
                              final fullname=_fullnameController.text.toString().trim();
             
              final email=_emailController.text.toString().trim();
              final phonenumber=_phonenumberController.text.toString().trim();
             final pass=_passController.text.toString().trim();
             bool result = await registerUser( fullname,phonenumber,email,pass);
             if(result){
               Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=>LoginPage()
                 ));
           
             }
             else{
               validation();
             }

                           }),
                           ),
                           const SizedBox(height:30),
                     ],
                    
                   ),
                   
                
               ),
             ),
           ),
              ]
           ),
           ),
         ),
       )
    );
  }
}