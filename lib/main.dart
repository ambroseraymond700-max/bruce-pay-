import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,home:HomeScreen()));
class HomeScreen extends StatelessWidget{
@override Widget build(BuildContext c){
return Scaffold(backgroundColor:Color(0xFFF5F5F5),body:SingleChildScrollView(child:Column(children:[
Container(padding:EdgeInsets.fromLTRB(20,50,20,20),decoration:BoxDecoration(color:Color(0xFF00C853),borderRadius:BorderRadius.only(bottomLeft:Radius.circular(25),bottomRight:Radius.circular(25))),child:Column(children:[
Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
Row(children:[CircleAvatar(backgroundColor:Colors.white,child:Icon(Icons.person,color:Color(0xFF00C853))),SizedBox(width:10),Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Hello, Bruce!',style:TextStyle(color:Colors.white70,fontSize:12)),Text('Welcome back',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold))])]),
Icon(Icons.notifications,color:Colors.white)]),
SizedBox(height:20),
Container(padding:EdgeInsets.all(16),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(15)),child:Column(children:[
Text('Available Balance',style:TextStyle(fontSize:12)),
Text('₦125,480.00',style:TextStyle(fontSize:28,fontWeight:FontWeight.bold)),
SizedBox(height:15),
Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[
Column(children:[CircleAvatar(backgroundColor:Color(0xFFE8F5E9),child:Icon(Icons.add,color:Color(0xFF00C853))),SizedBox(height:5),Text('Add Money',style:TextStyle(fontSize:11))]),
Column(children:[CircleAvatar(backgroundColor:Color(0xFFE8F5E9),child:Icon(Icons.arrow_upward,color:Color(0xFF00C853))),SizedBox(height:5),Text('Transfer',style:TextStyle(fontSize:11))]),
Column(children:[CircleAvatar(backgroundColor:Color(0xFFE8F5E9),child:Icon(Icons.call_to_action,color:Color(0xFF00C853))),SizedBox(height:5),Text('Withdraw',style:TextStyle(fontSize:11))]),
])]))]))])),
bottomNavigationBar:BottomNavigationBar(type:BottomNavigationBarType.fixed,selectedItemColor:Color(0xFF00C853),items:[
BottomNavigationBarItem(icon:Icon(Icons.home),label:'Home'),
BottomNavigationBarItem(icon:Icon(Icons.star),label:'Rewards'),
BottomNavigationBarItem(icon:Icon(Icons.account_balance_wallet),label:'Finance'),
BottomNavigationBarItem(icon:Icon(Icons.credit_card),label:'Cards'),
BottomNavigationBarItem(icon:Icon(Icons.person),label:'Me'),
]),);
}}
