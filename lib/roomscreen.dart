import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_next_academy/homescreen.dart';

class Roomscreen extends StatefulWidget {

  Roomscreen({Key? key,required this.Checkin,required this.Checkout,this.adults,this.children,this.radio,this.checkbox}) : super(key: key);
  DateTime Checkin=DateTime.now();
  DateTime Checkout=DateTime.now();
  String? adults="";
  String? children="";
  String ?radio="";
  List<String>? checkbox=[];





  @override
  State<Roomscreen> createState() => _RoomscreenState();
}

class _RoomscreenState extends State<Roomscreen> {
  bool _expanded = false;
  bool isswitch = false;

  bool _SExpanded=false;
  bool _dExpanded=false;
  bool _SuExpanded=false;
  bool single=false;
  bool double=false;
  bool suite=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Costaway Resort",
          style: GoogleFonts.pinyonScript(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
       body: ListView(children: [
         ExpansionPanelList(children: [ExpansionPanel(headerBuilder: (context, isExpanded) {
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               children: [
                 Image.asset("assests/1a-Superior-Single-Room-min1.jpg",width: 100,height: 100,),
                 SizedBox(width: 20,),
                 Text("Single Room",
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.cyan[700]
                   ),),
                 Switch(activeColor: Colors.blue,value: single, onChanged: (bool val){
                   setState(() {
                     single=val;
                     double=false;
                     suite=false;

                   });
                 }),
               ],
             ),
           );
         }, body:Padding(
           padding: const EdgeInsets.all(8.0),
           child: (Row(
             children: [Expanded(
               flex: 1,
               child: RatingBar.builder(
                 itemSize: 15,
                 initialRating: 4,
                 direction: Axis.horizontal,
                 itemCount: 5,
                 itemPadding: EdgeInsets.symmetric(horizontal: 0.0005),
                 itemBuilder: (context, _) => Icon(
                   Icons.star,
                   color: Colors.amber,
                 ),
                 onRatingUpdate: (rating) {
                   print(rating);
                 },
               ),
             ),
               SizedBox(width: 10,),
               Expanded(flex:2,child:  Text("single room for one person",
                 style: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.cyan[700]
                 ),),)],
           )),
         ),
           isExpanded: _SExpanded,
           canTapOnHeader: true,),],dividerColor: Colors.grey,
           expansionCallback: (panelIndex, isExpanded) {
             _SExpanded = !_SExpanded;
             setState(() {

             });},),
         ExpansionPanelList(children: [ExpansionPanel(headerBuilder: (context, isExpanded) {
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               children: [
                 Image.asset("assests/Luxury-Double-Double-2-1170x780.jpg",width: 100,height: 100,),
                 SizedBox(width: 20,),
               Text("Double Room",
                 style: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.cyan[700]
                 ),),
                 Switch(activeColor: Colors.blue,value: double, onChanged: (bool val){
                   setState(() {
                     single=false;
                     double=val;
                     suite=false;

                   });
                 }),
               ],
             ),
           );
         }, body:Padding(
           padding: const EdgeInsets.all(8.0),
           child: (Row(
             children: [Expanded(
               flex: 1,
               child: RatingBar.builder(
                 itemSize: 15,
                 initialRating: 4,
                 direction: Axis.horizontal,
                 itemCount: 5,
                 itemPadding: EdgeInsets.symmetric(horizontal: 0.0005),
                 itemBuilder: (context, _) => Icon(
                   Icons.star,
                   color: Colors.amber,
                 ),
                 onRatingUpdate: (rating) {

                 },
               ),
             ),
               SizedBox(width: 10,),
               Expanded(flex:2,child:  Text("Double room for one or two  persons",
                 style: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.cyan[700]
                 ),), )],
           )),
         ),
           isExpanded: _dExpanded,
           canTapOnHeader: true,),],dividerColor: Colors.grey,
           expansionCallback: (panelIndex, isExpanded) {
             _dExpanded = !_dExpanded;
             setState(() {

             });},),
         ExpansionPanelList(children: [ExpansionPanel(headerBuilder: (context, isExpanded) {
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               children: [
                 Image.asset("assests/daldtn-omni-dallas-hotel-executive-suite.jpg",width: 100,height: 100,),
                 SizedBox(width: 20,),
                 Text("Suite room",
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.cyan[700]
                   ),),
                 Switch(activeColor: Colors.blue,value: suite, onChanged: (bool val){
                   setState(() {
                     single=false;
                     double=false;
                     suite=val;
                   });
                 }),
               ],
             ),
           );
         }, body:Padding(
           padding: const EdgeInsets.all(8.0),
           child: (Row(
             children: [Expanded(
               flex: 1,
               child: RatingBar.builder(
                 itemSize: 15,
                 initialRating: 4,
                 direction: Axis.horizontal,
                 itemCount: 5,
                 itemPadding: EdgeInsets.symmetric(horizontal: 0.0005),
                 itemBuilder: (context, _) => Icon(
                   Icons.star,
                   color: Colors.amber,
                 ),
                 onRatingUpdate: (rating) {
                 },
               ),
             ),
               SizedBox(width: 10,),
               Expanded(flex:2,child: Text("Suite room for one or two  persons",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.cyan[700]
    ),) )],
           )),
         ),
           isExpanded: _SuExpanded,
           canTapOnHeader: true,),],dividerColor: Colors.grey,
           expansionCallback: (panelIndex, isExpanded) {
             _SuExpanded = !_SuExpanded;
             setState(() {

             });},),
         Center(
           child: Container(
             child: ElevatedButton(
               onPressed: (){
                 showDialog<String>(
                   context: context,
                   builder: (BuildContext context) => AlertDialog(
                     title: Text("Are you sure you want to proceed in checking out?"),
                     content: Text(
                         """This is a confirmation message that you agree on all data you entered:
        
         Check-in Date:${widget.Checkin.year}-${widget.Checkin.month}-${widget.Checkin.day} 
         Check-out Date:${widget.Checkout.year}-${widget.Checkout.month}-${widget.Checkout.day}
         Number of Adults:${widget.adults}
         Number of Children:${widget.children}
         Radio:${widget.radio}
         Extras:${widget.checkbox}
         Chosen Room:${ChosenRoom().toString()}
          """
                     ),

                     actions: [ElevatedButton(onPressed: (){
                       Navigator.pop(context);
                       print('Thanks');
                     }, child: Text('Confirm',style: TextStyle(color: Colors.white),)),

                       ElevatedButton(onPressed: (){
                         Navigator.pop(context);
                         print('Thanks');
                       }, child: Text('Discard',style: TextStyle(color: Colors.white),)),

                     ],
                   ),
                 );
               },
               child: Text("Book now",style: TextStyle(color: Colors.white),),
               style: ElevatedButton.styleFrom(
                 minimumSize: Size(50, 25),
               ),
             ),
           ),
         )
      ]),
    );
  }
  String ChosenRoom()
  {
    if(single)
      return"Single";
    else if (double)
      return "Double";
    else
      return"Suite";
  }
}
