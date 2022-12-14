import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_app/home_page/api_info.dart';
import '../lamp.dart';
import 'LEDBulb.dart';
import 'Lamp_hanger_rope.dart';
import 'package:http/http.dart' as http;
import 'lamp_switch.dart';
import 'lamp_switch_rope.dart';

const dartGray = Color(0xFF232323);
const bulbOnColor = Color(0xFFFFE12C);
const bulbOFFColor = Color(0xFFC1C1C1);
const animationDuration = Duration(milliseconds: 500);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isSwitchON = false;
  var apiData;
  String? cases;
  bool? productCase;
  String? productstatef;
  String? productstatet;
  String? product;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeght = MediaQuery.of(context).size.height;

    Future<void> getDataFromApi() async {
      apiData =
          await http.get(Uri.parse('http://91.198.66.24:3758/api/Products'));
      final apiDataParsed = jsonDecode(apiData.body);

      setState(() {
        product = apiDataParsed[0]['name'];
        productCase = apiDataParsed[0]['case'];
      });
      print('product:$product');
      print('productCase:$productCase');
      print(apiDataParsed);
    }

    Future<void> putDataFromApi() async {
      apiData = await http
          .put(Uri.parse('http://91.198.66.24:3758/api/Products/Change/1'));
      final apiDataParsed = jsonDecode(apiData.body);

      setState(() {
        product = apiDataParsed[0]['name'];
        productCase = apiDataParsed[0]['case'];
      });
      print('product:$product');
      print('productCase:$productCase');
      print(apiDataParsed);
    }

    String getStateData() {
      return productCase.toString();
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          LampHangerRope(
              screenWidth: screenWidth,
              screenHeight: screenHeght,
              color: dartGray),
          LEDBulb(
            screenWidth: screenWidth,
            screenHeight: screenHeght,
            onColor: bulbOnColor,
            offColor: bulbOFFColor,
            isSwicthOn: _isSwitchON,
          ),
          Lamp(
            animatedDuration: animationDuration,
            screenWidth: screenWidth,
            screenHeight: screenHeght,
            color: dartGray,
            isSwicthOn: _isSwitchON,
            gradientColor: bulbOnColor,
          ),
          LampSwitch(
            animationDuration: animationDuration,
            isSwitchOn: _isSwitchON,
            toggleOffColor: bulbOFFColor,
            toggleOnColor: bulbOnColor,
            screenWidth: screenWidth,
            screenHeight: screenHeght,
            color: dartGray,
            onTap: () {
              setState(() {
                _isSwitchON = !_isSwitchON;

                putDataFromApi();
                getDataFromApi();
                if (getStateData() == "false") {
                  productstatef = productCase.toString();
                } else {
                  productstatet = productCase.toString();
                }
              });
            },
          ),
          LampSwitchRope(
            animatedDuration: animationDuration,
            screenWidth: screenWidth,
            screenHeight: screenHeght,
            color: dartGray,
            isSwicthOn: _isSwitchON,
          ),
          AppInfo(
            screenWidth: screenWidth,
            screenHeight: screenHeght,
            color: dartGray,
            state: _isSwitchON ? '$productstatet' : '$productstatef',
          ),
        ],
      ),
    );
  }
}
