import 'package:flutter/material.dart';

class AddNewCar extends StatefulWidget {
  const AddNewCar({Key? key}) : super(key: key);

  @override
  _AddNewCarState createState() => _AddNewCarState();
}

class _AddNewCarState extends State<AddNewCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 40, 60, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        backwardsCompatibility: true,
        title: Text(
          "Add New Car",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                TextField(
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Color.fromRGBO(220, 74, 91, 1),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(
                          color: Color.fromRGBO(220, 74, 91, 1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(
                          color: Color.fromRGBO(220, 74, 91, 1),
                        ),
                      ),
                      hintText: 'Car Name',
                      hintStyle: TextStyle(color: Colors.white24)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Color.fromRGBO(220, 74, 91, 1),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(
                          color: Color.fromRGBO(220, 74, 91, 1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(
                          color: Color.fromRGBO(220, 74, 91, 1),
                        ),
                      ),
                      hintText: "Car Driver",
                      hintStyle: TextStyle(color: Colors.white24)),
                ),
                SizedBox(
                  height: 10,
                ),
                DatePickerDialog(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime(DateTime.now().year + 1),
                  initialCalendarMode: DatePickerMode.year,
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Color.fromRGBO(220, 74, 91, 1),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(
                          color: Color.fromRGBO(220, 74, 91, 1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(
                          color: Color.fromRGBO(220, 74, 91, 1),
                        ),
                      ),
                      hintText: "Car ٌYear ",
                      hintStyle: TextStyle(color: Colors.white24)),
                  onChanged: (newValue) {},
                ),
                SizedBox(
                  height: 50,
                ),
                MaterialButton(
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Color.fromRGBO(
                    220,
                    74,
                    91,
                    1,
                  ),
                  onPressed: () => {},
                  minWidth: double.infinity,
                  elevation: 0,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Text(
                    "Add Car",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
