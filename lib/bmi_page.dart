import 'package:flutter/material.dart';

class BmiCal extends StatefulWidget {
  const BmiCal({super.key});

  @override
  State<BmiCal> createState() => _BmiCalState();
}

class _BmiCalState extends State<BmiCal> {
  String selectedGender = '';
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmiResult = 0.0;
  String bmiCategory = '';

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  double calculateBMI(double weight, double height) {
    if (weight <= 0 || height <= 0) {
      return 0.0;
    }
    return weight / (height * height);
  }

  String determineBMICategory(double bmi, String gender) {
    if (gender == 'Boy') {
      if (bmi < 18.5) {
        return 'Underweight (Male)';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        return 'Normal (Male)';
      } else if (bmi >= 25 && bmi < 29.9) {
        return 'Overweight (Male)';
      } else {
        return 'Obese (Male)';
      }
    } else if (gender == 'Girl') {
      if (bmi < 18.5) {
        return 'Underweight (Female)';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        return 'Normal (Female)';
      } else if (bmi >= 25 && bmi < 29.9) {
        return 'Overweight (Female)';
      } else {
        return 'Obese (Female)';
      }
    }
    return 'Invalid Gender';
  }

  Widget buildGenderOption(IconData icon, String label, Color color) {
    return GestureDetector(
      onTap: () {
        selectGender(label);
      },
      child: Container(
        width: 120,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: selectedGender == label ? Colors.white : Colors.black,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color: selectedGender == label ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomTextField(TextEditingController controller, String label) {
    return Container(
      width: 120,
      height: 60,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white), // Change label color
        ),
      ),
    );
  }

  void calculateAndUpdateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;
    String gender = selectedGender;
    double bmi = calculateBMI(weight, height);
    String category = determineBMICategory(bmi, gender);

    setState(() {
      bmiResult = bmi;
      bmiCategory = category;
    });
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
        backgroundColor: Colors.cyan, // Dark theme app bar color
      ),
      body: Container(
        color: Colors.grey[800], // Dark theme background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildGenderOption(Icons.man, 'Boy', Colors.blue),
                  SizedBox(width: 40),
                  buildGenderOption(Icons.woman, 'Girl', Colors.pink),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCustomTextField(weightController, 'Weight (kg)'),
                  SizedBox(width: 20),
                  buildCustomTextField(heightController, 'Height (m)'),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateAndUpdateBMI,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan, // Change button background color
                ),
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(
                    color: Colors.white, // Change text color to white
                  ),
                ),
              ),


              SizedBox(height: 20),
              Text(
                'BMI: ${bmiResult.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 20, color: Colors.white), // Change text color
              ),
              Text(
                'Category: $bmiCategory',
                style: TextStyle(
                    fontSize: 20, color: Colors.white), // Change text color
              ),
            ],
          ),
        ),
      ),
    );
  }
}
