import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  bool isMale;

  int height;
  int weight;

  ResultPage({super.key, required this.isMale ,required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    
    double bmi_res=weight/pow(height/100, 2);
    String bmi_state="";
    switch(bmi_res){
      case<16:
        bmi_state="Severe Thinness";
        break;

      case>18.5 && <25:
        bmi_state="Normal";
        break;

      case>25 && <30:
        bmi_state="Overweight";
        break;

      case>30:
        bmi_state="Obese";
        break;

      default:      
    }

    return Scaffold(
      backgroundColor: isMale ? Colors.blueAccent : Colors.redAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                  "BMI Result: ",
                  style: TextStyle(color: Colors.white, fontSize: 29),
                ),
                
                Text(
                  "${bmi_res.toStringAsFixed(2)}",
                  style: TextStyle(color: Colors.white, fontSize: 36),
                ),
                  ],
                ),
              ),
              

              SizedBox(
                height: 16,
              ),

              Text(
                "$bmi_state",
                style: TextStyle(color: Colors.white, fontSize: 29),
              ),

               SizedBox(
                height: 50,
              ),

              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_circle_left,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}