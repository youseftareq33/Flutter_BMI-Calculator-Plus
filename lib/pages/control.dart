import 'package:bmi_calculator_plus/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class Control extends StatefulWidget {
  bool isMale;
  Control({super.key, required this.isMale});

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  int weight = 35;
  int height = 110;
  
  final ScrollController weightController = ScrollController();
  final ScrollController heightController = ScrollController();

  @override
  void initState() {
    super.initState();

    weightController.addListener(() {
      handleScroll_weight(weightController, (index) {
        int newWeight = (index + 5) * 5;
        if (weight != newWeight) {
          setState(() {
            weight = newWeight;
          });
          HapticFeedback.lightImpact();
        }
      }, itemCount: 20);
    });

    heightController.addListener(() {
      handleScroll_height(heightController, (index) {
        int newHeight = (index + 20) * 5;
        if (height != newHeight) {
          setState(() {
            height = newHeight;
          });
          HapticFeedback.lightImpact(); 
        }
      }, itemCount: 21);
    });
  }

  void handleScroll_weight(ScrollController controller, Function(int) onScroll, {required int itemCount}) {
    double offset = controller.offset;
    double maxScrollExtent = controller.position.maxScrollExtent;
    int index = (offset / 60).round(); 

    if (offset >= maxScrollExtent) {
      index = itemCount - 1;
    } else {
      index = index.clamp(0, itemCount - 1);
    }

    onScroll(index);
  }

  void handleScroll_height(ScrollController controller, Function(int) onScroll, {required int itemCount}) {
    double offset = controller.offset;
    double maxScrollExtent = controller.position.maxScrollExtent;
    int index = (offset / 71).round(); 

    if (offset >= maxScrollExtent) {
      index = itemCount - 1;
    } else {
      index = index.clamp(0, itemCount - 1);
    }

    onScroll(index);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          Row(
            children: [

              // left =====================================================================================
              Expanded(
                flex: 2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),

                    child: Column(
                      children: [

                        const SizedBox(
                          height: 10,
                        ),

                        // top left ------------------------------------------------------------------------
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Row(
                            children: [

                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: widget.isMale ? Colors.blueAccent : Colors.redAccent,
                                  size: 26,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),

                              Text(
                                "BMI",
                                style: TextStyle(
                                    color: widget.isMale ? Colors.blueAccent : Colors.redAccent, fontSize: 26),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 26,
                        ),

                        // center left ------------------------------------------------------------------------
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              Text(
                                widget.isMale ? "Male" : "Female",
                                style: TextStyle(fontSize: 24),
                              ),

                              Icon(
                                widget.isMale ? Icons.male: Icons.female,
                                color: widget.isMale ? Colors.blueAccent : Colors.redAccent,
                                size: 120,
                              ),

                              const Text(
                                "Weight (KG)",
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                        ),

                        // center bottom ------------------------------------------------------------------------
                        Expanded(
                          child: ListView.builder(
                            controller: weightController,
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              int i=(index+5)*5;
                              return Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      weight=i;
                                    });
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Text("$i", style: TextStyle(color: weight==i ? widget.isMale ? Colors.blueAccent : Colors.redAccent : Colors.black, fontSize: weight==i ? 36 : 24),),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),



              // right =====================================================================================
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: widget.isMale ? Colors.blueAccent : Colors.redAccent),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [

                        const SizedBox(
                          height: 48,
                        ),

                        // right top ------------------------------------------------------------------------
                        const Text(
                          "Height \n (CM)",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        const SizedBox(
                          height: 42,
                        ),
          
                        // right bottom ------------------------------------------------------------------------
                        Expanded(
                          child: ListView.builder(
                            controller: heightController,
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),

                            itemCount: 21,
                            itemBuilder: (context, index) {
                              int i=(index+20)*5;
                              return Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      height=i;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: height==i ? Colors.white : widget.isMale ? Colors.blueAccent : Colors.redAccent,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text("$i", style: TextStyle(color: height==i ? widget.isMale ? Colors.blueAccent : Colors.redAccent : Colors.white, fontSize: 24),),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),



          // bottom (stack) =====================================================================================
          Positioned(
            bottom: 10,
            left: MediaQuery.sizeOf(context).width* 2/3 - 65,
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(isMale: widget.isMale, height: height, weight: weight),
                      ),
                  );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 245, 210, 34),
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), 
                ),
              ),

              child: Row(
                children: [

                  Text("Calc".toUpperCase(),
                        style: const TextStyle(color: Colors.white, fontSize: 22,),
                  ),

                  Icon(Icons.arrow_forward_ios, color: Colors.white,),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
