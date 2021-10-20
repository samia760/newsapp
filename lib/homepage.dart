// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'screens/favorite.dart';
import 'screens/headlines.dart';
import 'screens/popularnews.dart';
import 'screens/profile.dart';
import 'screens/search.dart';
import 'screens/sportsnews.dart';
import 'screens/topstories.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
 int currentTab=0;
  @override
  Widget build(BuildContext context) {
   
    return    DefaultTabController(  
    
        length: 4,  
        child: Scaffold(  
          appBar: AppBar(  
           backgroundColor: Colors.pink,
            bottom: TabBar(  
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [  
                Tab( text: "Top Stories"),  
               
                Tab( text: "Headlines"),
                
                Tab( text: "Popular News"),
                 
                Tab( //icon: Icon(Icons.camera_alt),
                 text: "Sports News"), 
              ],  
            ),  
             title: Text('Fox News'),  
          ),  
          body:TabBarView(  
            // ignore: prefer_const_literals_to_create_immutables
            children: [  
              Topstories(),  
              Headlines(), 
              Popularnews(),
              Sportsnews(), 
          
            ],  
          ), 
          bottomNavigationBar:Container(
         decoration: BoxDecoration(
            color: Colors.pink,
           // ignore: prefer_const_literals_to_create_immutables
           boxShadow: [
              //background color of box
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  2.0, // Move to right 10  horizontally
                  2.0, // Move to bottom 10 Vertically
                ),
              )
            ],
         ),
         
            height: 60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MaterialButton(
                      minWidth: 50,
                      onPressed: () {
                        setState(() {
                          Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) =>   HomePage())  
                ); 
                currentTab=0;
           
                         
                        });
                      },
                    
                      
                      
                      child:Icon(Icons.home,
                        color: currentTab == 0 ? Colors.white : Colors.black)),
                          // : Colors.black
                           
                          
                  MaterialButton(
                      minWidth: 60,
                      onPressed: () {
                        setState(() {
                       
                   Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) =>   Search())  
                ); 
              
                          currentTab=1;
                        }
                        );
                      },
                      child: Icon(Icons.search,
                        color: currentTab == 1 ? Colors.white : Colors.black)),
                         // color: currentTab == 1 ? Colors.white : Colors.black:  Colors.white
                         
                          
                  MaterialButton(
                      minWidth: 60,
                      onPressed: () {
                        setState(() {
                           Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) => Favorite())  
                ); 
                          currentTab = 2;
                        });
                      },
                      child: Icon(Icons.favorite,
                        color: currentTab == 2 ? Colors.white : Colors.black)),
                         MaterialButton(
                      minWidth: 50,
                      onPressed: () {
                        setState(() {
                          Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) =>   Profile())  
                ); 
                currentTab=3;
           
                         
                        });
                      },
                    
                      
                      
                      child:Icon(Icons.person,
                        color: currentTab == 3 ? Colors.white : Colors.black)),
                          
                ]
            )
             ), 
        )
      );

    
  }
}