import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  Widget calcbutton(String btntxt,Color btncolor, Color txtcolor){
    return ElevatedButton(onPressed: (){
      calculation(btntxt);
    }, 
    style: ElevatedButton.styleFrom(        
      padding:const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0)
      ),
      backgroundColor: btncolor,
      
),
 
    child:Text(btntxt,
    style: TextStyle(
      fontSize: 35,
      color: txtcolor,
    ),
    ),
    
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Calculator'),backgroundColor:const Color.fromARGB(255, 0, 0, 0),),
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Padding(
              padding: const EdgeInsets.only(right: 5),
               child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 20),
                 
                 child: SingleChildScrollView(
                  reverse: true,
                  
                  scrollDirection: Axis.horizontal,
                  
                  
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(padding:const EdgeInsets.all(10.0),
                      child: Text(text,
                      textAlign: TextAlign.left,
                      style:const TextStyle(color: Colors.white,
                      fontSize: 100),
                      ),),
                    ],
                             ),
                 ),
               ),
             ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //buttton function
                calcbutton('AC',Colors.grey, Colors.black),
                calcbutton('+/-',Colors.grey, Colors.black),
                calcbutton('%',Colors.grey, Colors.black),
                calcbutton('/',const Color.fromARGB(255, 106, 161, 255), Colors.white),
              ],
            ),
            const SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //buttton function
                calcbutton('7',const Color.fromARGB(255, 43, 43, 43), Colors.white),
                calcbutton('8',const Color.fromARGB(255, 43, 43, 43), Colors.white),
                calcbutton('9',const Color.fromARGB(255, 43, 43, 43), Colors.white),
                calcbutton('x',const Color.fromARGB(255, 106, 161, 255), Colors.white),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //buttton function
                calcbutton('4',const Color.fromARGB(255, 43, 43, 43), Colors.white),
                calcbutton('5',const Color.fromARGB(255, 43, 43, 43), Colors.white),
                calcbutton('6',const Color.fromARGB(255, 43, 43, 43), Colors.white),
                calcbutton('-',const Color.fromARGB(255, 106, 161, 255), Colors.white),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //buttton function
                calcbutton('1',const Color.fromARGB(255, 43, 43, 43), Colors.white),
                calcbutton('2',const Color.fromARGB(255, 43, 43, 43), Colors.white),
                calcbutton('3',const Color.fromARGB(255, 43, 43, 43), Colors.white),
                calcbutton('+',const Color.fromARGB(255, 106, 161, 255), Colors.white),
              ],
            ),
            const SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){ calculation('0');}, 
                style: ElevatedButton.styleFrom(        
                padding:const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)
        ),
                 backgroundColor: const Color.fromARGB(255, 43, 43, 43),
),
                child: const Text ('0',
                style: TextStyle(
                  fontSize: 35,color: Colors.white
                ),)),
                 calcbutton('.',const Color.fromARGB(255, 43, 43, 43), Colors.white),
                calcbutton('=',const Color.fromARGB(255, 106, 161, 255), Colors.white),
              ],

            ),
          const SizedBox(height: 25,)
          ],
        ),
      ),
    );

  }
    //Calculator logic
  String text ='0';
  double numOne = 0;
  double numTwo = 0;

  String result = '';
  String finalResult = '';
  String opr = '';
  String preOpr = '';
   void calculation(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    
    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
         finalResult = add();
      } else if( preOpr == '-') {
          finalResult = sub();
      } else if( preOpr == 'x') {
          finalResult = mul();
      } else if( preOpr == '/') {
          finalResult = div();
      } 

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
          numOne = double.parse(result);
      } else {
          numTwo = double.parse(result);
      }

      if(opr == '+') {
          finalResult = add();
      } else if( opr == '-') {
          finalResult = sub();
      } else if( opr == 'x') {
          finalResult = mul();
      } else if( opr == '/') {
          finalResult = div();
      } 
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
     result = (numOne / 100) as String;
     finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        
        result = result.toString()+'.';
      }
      finalResult = result;
    }
    
    else if(btnText == '+/-') {
        // ignore: prefer_interpolation_to_compose_strings
        result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();        
        finalResult = result;        
    
    } 
    
    else {
        result = result + btnText;
        finalResult = result;        
    }


    setState(() {
          text = finalResult;
        });

  }


  String add() {
         result = (numOne + numTwo).toString();
         numOne = double.parse(result);           
         return doesContainDecimal(result);
  }

  String sub() {
         result = (numOne - numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String mul() {
         result = (numOne * numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String div() {
          result = (numOne / numTwo).toString();
          numOne = double.parse(result);
          return doesContainDecimal(result);
  }


  String doesContainDecimal(String result) {
    
    if(result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if(!(int.parse(splitDecimal[1]) > 0)) {
          return result = splitDecimal[0].toString();
        }
    }
    return result; 
  }

}