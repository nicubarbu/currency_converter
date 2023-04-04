import 'package:flutter/material.dart';

void main() {
  runApp(const CurrencyConverter());
}

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String titleAppBar = "Currency converter";
const Color appBarBackgroundColor = Colors.deepPurpleAccent;
const Color appBarTextColor = Colors.black;
var resultStyle = const TextStyle();

class _HomePageState extends State<HomePage> {
  final TextEditingController _usdController = TextEditingController();
  String result = "";

  double _convertToRon(double money) {
    return money * 4.5;
  }
  bool validateInputDouble(String value) {
    if (value.isEmpty) {
      return false;
    }
    final n = num.tryParse(value);
    if (n == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(titleAppBar,
          style: const TextStyle(
            color: appBarTextColor,
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: appBarBackgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Flexible(
            child: Image(
              image: AssetImage('assets/images/money_514926.jpg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: TextField(
              controller: _usdController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter the sum in USD",
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
          ),
          Column(
            children: [
              SizedBox(
                child: OutlinedButton(
                    onPressed: () {
                      if (validateInputDouble(_usdController.text)) {
                        double usd = double.parse(_usdController.text);
                        double ron = _convertToRon(usd);
                        setState(() {
                          result = '$usd USD is equal to $ron RON';
                          resultStyle = const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          );
                        });
                      }
                      else {
                        setState(() {
                          result = 'Please enter a valid number!';
                          resultStyle = const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          );
                        });
                      }
                    },
                    child: const Text("Convert from USD to RON")),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
                child: Center(
                  child: Text(
                    result ?? '',
                    style: resultStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    }
  @override
  void dispose() {
    _usdController.dispose();
    super.dispose();
  }
}
