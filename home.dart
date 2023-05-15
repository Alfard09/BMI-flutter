
import 'package:flutter/material.dart';

class H extends StatefulWidget {
  const H({super.key});

  @override
  State<H> createState() => _HState();
}

class _HState extends State<H> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("BMI CALCULATOR",
          style: TextStyle(
            fontSize: 25,
            color: Colors.yellow,
            fontWeight: FontWeight.w400,
            
          ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Column(
          
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                
                  SizedBox(
                    width: 180,
                    child:  TextField(
                      controller: _heightController,
                      textAlign: TextAlign.center,
                      cursorHeight: 0,
                      cursorWidth: 0,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.yellow,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'HEIGHT',
                        hintStyle:  TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        border: InputBorder.none,
                      ),
                      
                    ),
                  ),
                   SizedBox (
                   width: 180,
                   
                    child: TextField(
                      controller: _weightController,
                      cursorHeight: 0,
                      cursorWidth: 0,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.yellow,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'WEIGHT',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      border: InputBorder.none,
                      
                      ),

                    ),
                  ),
                  
  
                    
                  
              ],
              
              
            ),
           SizedBox(height: 30,),
           GestureDetector(
            onTap: (){
              double _h = double.parse(_heightController.text) / 100;
              double _w = double.parse(_weightController.text);
              setState(() {
                _bmiResult = _w /(_h * _h);
                if(_bmiResult >=25){
                  _textResult = "You\'re Over Weight";
                }else if(_bmiResult <=25 && _bmiResult >=18.5){
                  _textResult = "You/'re Normal Weight";
                }else{
                  _textResult = "You/'re UnderWeight";
                }
              });

            },
             child: Container(
             child: Text("Calculate",
             style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
            
             ),
             )
             ),
           ),
           SizedBox(height: 30,),
            Container(
           child: Text(_bmiResult.toStringAsFixed(0),
           style: TextStyle(
            fontSize: 90,
            fontWeight: FontWeight.bold,
            color: Colors.yellow,
 
           ),
           )
           ),
           SizedBox(height: 30,),
           Visibility(
            visible: _textResult.isNotEmpty,
             child: Container(
             child: Text(_textResult,
             style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w200,
              color: Colors.yellow,
            
             ),
             )
             ),
           ),
           
           
           
           
           
           
           
           
           
           
           //design
           SizedBox(height: 20,),
           leftBar(barWidth: 25,),
           SizedBox(height: 25,),
           leftBar(barWidth: 50,),
           SizedBox(height: 25,),
           leftBar(barWidth: 30,),

           
           RightBar(barWidth: 50,),
           SizedBox(height: 25,),
           RightBar(barWidth: 60,),

          ],
          
        ),
        
            
        
      ),
      
    );
  }
}

class leftBar extends StatelessWidget {
  final double barWidth;
  const leftBar({super.key, required this.barWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
    children: [
        Container(
          height: 23,
          width: barWidth,
          decoration:BoxDecoration(
           borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Colors.yellow,
          )
        )
    ],

    );
  }
}



class RightBar extends StatelessWidget {
  final double barWidth;
  const RightBar({super.key, required this.barWidth});
  
  
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
    children: [
        Container(
          height: 23,
          width: barWidth,
          decoration:BoxDecoration(
           borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Colors.yellow,
          )
        )
    ],

    );
  }
}
