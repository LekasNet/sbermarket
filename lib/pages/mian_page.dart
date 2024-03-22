import 'package:flutter/material.dart';
import 'package:sbermarket/commons/colors.dart';
import 'package:sbermarket/commons/globals.dart';
import 'package:sbermarket/templates/product_listing.dart';
import 'package:sbermarket/templates/search_bar.dart';
import 'package:squircle/squircle.dart';
import 'package:sbermarket/commons/icons.dart';
import 'package:figma_squircle/figma_squircle.dart';


class Home extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  int cartItemCount = 0; // Переменная для счётчика товаров в корзине

  void addToCart() {
    setState(() {
      cartItemCount++; // Увеличиваем счётчик на единицу
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      color: Colors.transparent,
                      child: Material(
                          color: Color(0x80FF6961),
                          shape: const SquircleBorder(
                            side: BorderSide(color: Colors.transparent, width: 1.9),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            child: Image.asset('assets/images/profile.png'),
                          )
                      ),
                    ),
                    SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi $name!'),
                        Text("Let's het some item!", style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(
                      icon: cartDefaultIcon,
                      onPressed: () {
                        // Обработка нажатия на иконку корзины
                      },
                    ),
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Text(
                        '5', // сюда вставляется количество товаров в корзине
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    width: 245,
                    height: 62,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(
                            cornerRadius: 20, cornerSmoothing: 0.6),
                      ),
                    ),
                    child: SearchBar(
                      shadowColor: const MaterialStatePropertyAll(
                          Colors.transparent),
                      backgroundColor: const MaterialStatePropertyAll(
                          Colors.transparent),
                      surfaceTintColor: const MaterialStatePropertyAll(
                          Colors.transparent),
                      overlayColor: const MaterialStatePropertyAll(
                          Colors.transparent),
                      leading: searchIcon,
                      hintText: 'Search item...',
                      textStyle: const MaterialStatePropertyAll(TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400)),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.only(right: 20, left: 20)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                // Filter
                Material(
                  color: primaryColor,
                  shape: SquircleBorder(
                    side: BorderSide(color: primaryColor, width: 1.9),
                  ),
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      fixedSize: const Size(62, 62),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      print('Nothing 2');
                    },
                    child: filterIcon,
                  ),
                )
              ],
            )
          ),
          Container(
            height: 600,
            child: SingleChildScrollView(
              child: Listing(),
            ),
          ),
        ],
      ),
    );
  }
}