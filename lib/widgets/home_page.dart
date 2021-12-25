import 'package:calculation/widgets/return_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String showingValue = '0';
  String showingValue2 = '0';
  String showingValue3 = '0';
  num firstNumber = 0;
  num secondNumber = 0;
  String processHolding = '';
  bool controlEqual = false;
  bool controlComma = false;
  bool controlPercent = false;
  bool controlNumber = false;
  int numberLength = 0;
  double myfontsize = 94;
  int number = 0;
  int number2 = 0;
//** HANGİ BUTONA BASILDIĞINI ALGILAMAMIZI SAĞLAYAN FONKSİYON TANIMLANMIŞTIR *//

  void buttonHolding(String holding) {
//***** HOLDİNDG EĞER SİLME İSE GEREKLİ DURUMLAR BURADA İFAGE EDİLMİŞTİR *****//
    if (holding == 'AC') {
      setState(() {
        showingValue = '0';
        punctuationControl(showingValue);
        controlComma = false;
      });
    }
//** HOLDİNDG EĞER EKSİ ÇARPIM İSE GEREKLİ DURUMLAR BURADA İFAGE EDİLMİŞTİR **//
    else if (holding == '+/-') {
      setState(() {
        num minusValue = -1 * num.parse(showingValue);
        showingValue = minusValue.toString();
        punctuationControl(showingValue);
      });
    }
//***** HOLDİNDG EĞER YÜZDE İSE GEREKLİ DURUMLAR BURADA İFAGE EDİLMİŞTİR *****//
    else if (holding == '%') {
      setState(() {
        num percent = num.parse(showingValue) / 100;
        showingValue = percent.toString();
        punctuationControl(showingValue);
        controlPercent = true;
      });
    }
//***** HOLDİNDG EĞER BÖLME İSE GEREKLİ DURUMLAR BURADA İFAGE EDİLMİŞTİR *****//
    else if (holding == '÷') {
      firstNumber = num.parse(showingValue);
      showingValue = '';
      processHolding = holding;
      controlComma = false;
      controlEqual = false;
    }
//***** HOLDİNDG EĞER ÇARPI İSE GEREKLİ DURUMLAR BURADA İFAGE EDİLMİŞTİR *****//
    else if (holding == 'x') {
      firstNumber = num.parse(showingValue);
      showingValue = '';
      processHolding = holding;
      controlComma = false;
      controlEqual = false;
    }
//****** HOLDİNDG EĞER EKSİ İSE GEREKLİ DURUMLAR BURADA İFAGE EDİLMİŞTİR *****//
    else if (holding == '-') {
      firstNumber = num.parse(showingValue);
      showingValue = '';
      processHolding = holding;
      controlComma = false;
      controlEqual = false;
    }
//****** HOLDİNDG EĞER ARTI İSE GEREKLİ DURUMLAR BURADA İFAGE EDİLMİŞTİR *****//
    else if (holding == '+') {
      firstNumber = num.parse(showingValue);
      showingValue = '';
      processHolding = holding;
      controlComma = false;
      controlEqual = false;
//**** HOLDİNDG EĞER EŞİTTİR İSE GEREKLİ DURUMLAR BURADA İFAGE EDİLMİŞTİR ****//
    } else if (holding == '=') {
      secondNumber = num.parse(showingValue);
      controlEqual = true;
      if (processHolding == '÷') {
        setState(() {
          if ((firstNumber / secondNumber).round() !=
              (firstNumber / secondNumber)) {
            showingValue = (firstNumber / secondNumber).toString();
            punctuationControl(showingValue);
          }
          if ((firstNumber / secondNumber).round() ==
              (firstNumber / secondNumber)) {
            showingValue = (firstNumber ~/ secondNumber).toString();
            punctuationControl(showingValue);
          }
        });
      } else if (processHolding == 'x') {
        setState(() {
          showingValue =
              num.parse((firstNumber * secondNumber).toString()).toString();
          punctuationControl(showingValue);
        });
      } else if (processHolding == '-') {
        setState(() {
          showingValue =
              num.parse((firstNumber - secondNumber).toString()).toString();
          punctuationControl(showingValue);
        });
      } else if (processHolding == '+') {
        setState(() {
          showingValue =
              num.parse((firstNumber + secondNumber).toString()).toString();
          punctuationControl(showingValue);
        });
      }
//************* EĞER VİRGÜLE BASILDI İSE DURUM BURADA İŞLENİYOR **************//
    } else if (holding == ',') {
      if (controlComma == false) {
        setState(() {
          showingValue = showingValue + '.';
          punctuationControl(showingValue);
        });
        controlComma = true;
      }
    }
//************* EĞER RAKAMLARA BASILDI İSE DURUM BURADA İŞLENİYOR ************//
    else {
      if (controlPercent == true || controlEqual == true) {
        showingValue = '';
        controlPercent = false;
        controlEqual = false;
      }
      setState(() {
        showingValue = num.parse(showingValue + holding).toString();
        punctuationControl(showingValue);
      });
    }
  }

  void punctuationControl(String value) {
    numberLength = value.split('').length;
    bool comma = value.split('').contains('.');
    if (comma == false) {
      if (numberLength < 4) {
        showingValue2 = value;
      } else if (numberLength < 7) {
        showingValue2 = value.split('').sublist(0, numberLength - 3).join('') +
            '.' +
            value.split('').sublist(numberLength - 3, numberLength).join('');
      } else if (numberLength < 10) {
        showingValue2 = value.split('').sublist(0, numberLength - 6).join('') +
            '.' +
            value
                .split('')
                .sublist(numberLength - 6, numberLength - 3)
                .join('') +
            '.' +
            value.split('').sublist(numberLength - 3, numberLength).join('');
        if (numberLength == 7) {
          myfontsize = 78;
        }
        if (numberLength == 8) {
          myfontsize = 70;
        }
        if (numberLength == 9) {
          myfontsize = 62;
        }
      }
    } else {
      number = 0;
      for (String counter in value.split('')) {
        if (counter != '.') {
          number++;
          debugPrint(number.toString());
        } else {
          break;
        }
      }

      if (number < 4) {
        showingValue2 = value.split('').sublist(0, number).join('') +
            ',' +
            value.split('').sublist(number + 1, numberLength).join('');
      } else if (number < 7) {
        showingValue2 = value.split('').sublist(0, number - 3).join('') +
            '.' +
            value.split('').sublist(number - 3, number).join('') +
            ',' +
            value.split('').sublist(number + 1, numberLength).join('');
      } else if (number < 10) {
        showingValue2 = value.split('').sublist(0, number - 6).join('') +
            '.' +
            value.split('').sublist(number - 6, number - 3).join('') +
            '.' +
            value.split('').sublist(number - 6, number - 3).join('') +
            ',' +
            value.split('').sublist(number + 1, numberLength).join('');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(31, 0, 31, 0),
              alignment: Alignment.bottomRight,
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Text(
                showingValue2,
                style: TextStyle(
                    fontSize: myfontsize,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ReturnButton(
                    buttonColor: Colors.blueGrey.shade300,
                    buttonTextSize: 26,
                    buttonText: 'AC',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.black),
                ReturnButton(
                    buttonColor: Colors.blueGrey.shade300,
                    buttonTextSize: 26,
                    buttonText: '+/-',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.black),
                ReturnButton(
                    buttonColor: Colors.blueGrey.shade300,
                    buttonTextSize: 26,
                    buttonText: '%',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.black),
                ReturnButton(
                    buttonColor: Colors.amber.shade600,
                    buttonTextSize: 26,
                    buttonText: '÷',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ReturnButton(
                    buttonColor: Colors.grey.shade900,
                    buttonTextSize: 26,
                    buttonText: '7',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70),
                ReturnButton(
                    buttonColor: Colors.grey.shade900,
                    buttonTextSize: 26,
                    buttonText: '8',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70),
                ReturnButton(
                    buttonColor: Colors.grey.shade900,
                    buttonTextSize: 26,
                    buttonText: '9',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70),
                ReturnButton(
                    buttonColor: Colors.amber.shade600,
                    buttonTextSize: 26,
                    buttonText: 'x',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ReturnButton(
                    buttonColor: Colors.grey.shade900,
                    buttonTextSize: 26,
                    buttonText: '4',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70),
                ReturnButton(
                    buttonColor: Colors.grey.shade900,
                    buttonTextSize: 26,
                    buttonText: '5',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70),
                ReturnButton(
                    buttonColor: Colors.grey.shade900,
                    buttonTextSize: 26,
                    buttonText: '6',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70),
                ReturnButton(
                    buttonColor: Colors.amber.shade600,
                    buttonTextSize: 26,
                    buttonText: '-',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ReturnButton(
                    buttonColor: Colors.grey.shade900,
                    buttonTextSize: 26,
                    buttonText: '1',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70),
                ReturnButton(
                    buttonColor: Colors.grey.shade900,
                    buttonTextSize: 26,
                    buttonText: '2',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70),
                ReturnButton(
                    buttonColor: Colors.grey.shade900,
                    buttonTextSize: 26,
                    buttonText: '3',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70),
                ReturnButton(
                    buttonColor: Colors.amber.shade600,
                    buttonTextSize: 26,
                    buttonText: '+',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    margin: const EdgeInsets.all(8),
                    height: 80,
                    width: 176,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(60))),
                    child: TextButton(
                        onPressed: () {
                          buttonHolding('0');
                        },
                        child: const Text(
                          '0',
                          style: TextStyle(fontSize: 26, color: Colors.white70),
                        ))),
                ReturnButton(
                    buttonColor: Colors.grey.shade900,
                    buttonTextSize: 26,
                    buttonText: ',',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70),
                ReturnButton(
                    buttonColor: Colors.amber.shade600,
                    buttonTextSize: 26,
                    buttonText: '=',
                    buttonClick: buttonHolding,
                    buttonTextColor: Colors.white70)
              ],
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
