import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:hotel_next_academy/roomscreen.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  DateTime enddate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  int yy=0;
  int cc=0;
  bool ischecked=false;
  bool isyes=false;
  bool isno=false;
  var _radioSelected = 0;
   String ?_radioVal;
  List<String> extra=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Costaway Resort",
          style: GoogleFonts.pinyonScript(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Image.asset("assests/hanging-gardens-of-bali-1.jpg"),
            Row(
              children: [
                Text("Check-in-date:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan[700]
                  ),),
                IconButton(onPressed: () {
                  setState(() {
                    _selectDate(context);
                  });
                }, icon: Icon(Icons.calendar_today_rounded),),
                Text("${selectedDate.day}-${selectedDate.month}-${selectedDate
                    .year}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan[700]
                  ),)
              ],
            ),
            Row(
              children: [
                Text("Check-out-date:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan[700]
                  ),),
                IconButton(onPressed: () {
                  setState(() {
                    _selectDate(context);
                  });
                }, icon: Icon(Icons.calendar_today_rounded),),
                Text("${enddate.day}-${enddate.month}-${enddate
                    .year}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan[700]
                  ),)
              ],
            ),
            Row(children: [
              Text("Number of adults:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan[700]
                ),),  Slider(min: 0,
          max:10,
          value: yy.toDouble(),
          onChanged: (value){
            setState(() {
             yy =value.round();
            });
          }),
              Text("$yy",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan[700]
                ),),
            ],),
            Row(children: [
              Text("Number of children:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan[700]
                ),),  Slider(min: 0,
                  max:10,
                  value: cc.toDouble(),
                  onChanged: (value){
                    setState(() {
                      cc =value.round();
                    });
                  }),
              Text("$cc",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan[700]
                ),),
            ],),
            Text("Extras:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[700]
              ),),
            // Row(children: [
            //   Checkbox(
            //              checkColor: Colors.white,
            //                value: ischecked,
            //                onChanged: (bool? value) {
            //              setState(() {
            //             ischecked = value!;
            //               });}),
            //   Text("Breakfast(50EGP/day)",
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.cyan[700]
            //   ),),
            // ],),
            // Row(children: [
            //   Checkbox(
            //     checkColor: Colors.white,
            //     value: isyes,
            //     onChanged: (bool? value) {
            //       setState(() {
            //         isyes = value!;
            //       });}),
            //   Text("Internet wifi(50EGP/day) )",
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.cyan[700]
            //   ),),
            //  ],),
            // Row(children: [
            //    Checkbox(
            //     checkColor: Colors.white,
            //     value: isno,
            //     onChanged: (bool? value) {
            //       setState(() {
            //         isno = value!;
            //       });}),
            //   Text("parking(100EGP/day)",
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.cyan[700]
            //   ),)],),
            Text("Extras:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[700]
              ),),
            CheckboxGroup(labels: <String>["Breakfast(50EGP/day)","InternWifi(50EGP/day)","Parking(100EGP/day)"],
              onSelected: (List<String>checked)=>extra=checked,
            ),
            Text("View:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[700]
              ),),

        Row(
          children: [
            Radio(
              value: 1,
              groupValue: _radioSelected,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  _radioSelected = value as int;
                  _radioVal = 'Garden View';
                  print(_radioVal);
                });
              },
            ),
            Text("Garden View",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[700]
              ),),

          ],
        ),
        Row(
          children: [
            Radio(
              value: 2,
              groupValue: _radioSelected,
              activeColor: Colors.red,
              onChanged: (value) {
                setState(() {
                  _radioSelected = value as int;
                  _radioVal = 'Sea View';
                  print(_radioVal);
                });
              },
            ),
            Text("Sea View",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[700]
              ),),
          ],
        ),
            Center(
              child: Container(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push( MaterialPageRoute(builder: (context)=>Roomscreen(Checkin: selectedDate, Checkout: enddate,adults: "$yy",children: "$cc",radio: _radioVal,checkbox: extra,)));
                  },
                  child: Text("Check Rooms and Rates",style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(50, 25),
                  ),
                ),
              ),
            )
        ],
      ),
    ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2023));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _enddate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(2023));
    if (picked != null && picked != selectedDate) {
      setState(() {
        enddate = picked;
      });
    }
  }
}
