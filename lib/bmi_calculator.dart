import 'package:flutter/material.dart';

class Bmi_Calculator extends StatefulWidget {
  const Bmi_Calculator(
      {super.key}); // Constructor for the BMI calculator widget.

  @override
  State<Bmi_Calculator> createState() => _Bmi_CalculatorState();
}

class _Bmi_CalculatorState extends State<Bmi_Calculator> {
  bool isFemaleSelected = false;
  bool isMaleSelected = true; // Set male as the default gender
  double height = 0.0;
  double weight = 0.0;
  double bmi = 0.0; // Initialize BMI to 0.0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"), // App bar title
        backgroundColor:
            Color.fromARGB(255, 28, 29, 79), // App bar background color
        foregroundColor: Colors.white, // App bar text color
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 6.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings), // Settings icon in app bar
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Color.fromARGB(
            255, 10, 12, 37), // Background color of the main container
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // Align contents vertically in the middle

          children: [
            SizedBox(height: 20), // Empty space for layout
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color:
                          isFemaleSelected ? Colors.blue : Colors.transparent,
                      width: 1,
                    ),
                    shape: BoxShape.rectangle,
                    color: Color.fromARGB(255, 10, 12, 37),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setState(() {
                        isFemaleSelected = true;
                        isMaleSelected = false;
                      });
                    },
                    child: Center(
                      child: Icon(
                        Icons.female,
                        size: 90,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: 50), // Empty space between female and male icons
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: isMaleSelected ? Colors.blue : Colors.transparent,
                      width: 1,
                    ),
                    color: Color.fromARGB(255, 10, 12, 37),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setState(() {
                        isMaleSelected = true;
                        isFemaleSelected = false;
                      });
                    },
                    child: Center(
                      child: Icon(
                        Icons.male,
                        size: 90,
                        color: Color.fromARGB(255, 7, 152, 243),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Empty space for layout
            Container(
              color: Color.fromARGB(255, 28, 29, 79),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your height in cm', // Text indicating the height input
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10), // Empty space for layout
                  Center(
                    child: TextField(
                      onChanged: (value) => {height = double.parse(value)},
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        hintText:
                            'Enter your height', // Placeholder text for height input
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Empty space for layout
            Container(
              color: Color.fromARGB(255, 28, 29, 79),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your weight in kg', // Text indicating the weight input
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10), // Empty space for layout
                  Center(
                    child: TextField(
                      onChanged: (value) => {weight = double.parse(value)},
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        hintText:
                            'Enter your weight', // Placeholder text for weight input
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40), // Empty space for layout
            Center(
              child: Text(
                'Your BMI\n$bmi', // Display the calculated BMI
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
            SizedBox(height: 20), // Empty space for layout
            ElevatedButton(
              onPressed: () {
                setState(() {
                  bmi = (weight / ((height / 100) * (height / 100)))
                      .toDouble(); // Calculate BMI
                  bmi = double.parse(
                      bmi.toStringAsFixed(1)); // Round BMI to one decimal place
                });
              },
              child: Text('calculate'), // Button text
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                primary: Color.fromARGB(
                    255, 63, 65, 181), // Set background color to purple
                padding: EdgeInsets.all(16), // Add padding
                minimumSize: Size(double.infinity, 48), // Set width to full
              ),
            ),
          ],
        ),
      ),
    );
  }
}
