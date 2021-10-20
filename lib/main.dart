import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/welcome.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     // ignore: prefer_const_constructors
     return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () =>
      // ignore: prefer_const_constructors
      MaterialApp(
        debugShowCheckedModeBanner: false,
       
      title: 'Login Page',
      
    // ignore: prefer_const_constructors
    home:Welcome(),
      )
      
    );
      
  }
}
 



