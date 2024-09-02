import 'package:bmi_calculator_plus/pages/control.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        // male and female layout
        child: Row(
          children: [

            // male card
            GenderCard(
              gender: 'Male',
              gender_color: Colors.blueAccent,
              gender_icon: Icons.male,
              isMale: true,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Control(isMale: true),
                  ),
                );
              },
            ),

            // female card
            GenderCard(
              gender: 'Female',
              gender_color: Colors.redAccent,
              gender_icon: Icons.female,
              isMale: false,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Control(isMale: false),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


// ignore: must_be_immutable
class GenderCard extends StatelessWidget {
  String gender;
  Color gender_color;
  IconData gender_icon;
  bool isMale;
  void Function()? onTap;

  GenderCard({
    super.key,
    required this.gender,
    required this.gender_color,
    required this.gender_icon,
    required this.isMale,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(

            // GestureDetector style
            decoration: BoxDecoration(
              color: gender_color,
            ),
          
            // GestureDetector content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(
                  gender_icon, 
                  color: Colors.white,
                  size: 84,
                ),

                const SizedBox(
                  height: 16,
                ),

                Text(
                  gender,
                  style: const TextStyle(color: Colors.white, fontSize: 38),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
