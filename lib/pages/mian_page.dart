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
  int cartItemCount = 0;

  // Функция добавления продукта
  void addProduct(String name, String type, String price, String imageUrl) {
    setState(() {
      popularItems.add(ProductItem(
        name: name,
        type: type,
        price: price,
        imageUrl: imageUrl,
      ));
      cartItemCount++; // Обновляем количество товаров
    });
  }

  // Выезжающее меню для добавления продукта
  void _showAddProductMenu(BuildContext context) {
    String productName = '';
    String productType = '';
    String productPrice = '';
    String imageUrl = 'assets/images/durian.png'; // Значение по умолчанию

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Product Name'),
                onChanged: (value) {
                  productName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Product Type'),
                onChanged: (value) {
                  productType = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Product Price'),
                onChanged: (value) {
                  productPrice = value;
                },
              ),
              DropdownButton<String>(
                value: imageUrl,
                onChanged: (String? newValue) {
                  setState(() {
                    imageUrl = newValue!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'assets/images/durian.png',
                    child: Text('Durian'),
                  ),
                  DropdownMenuItem(
                    value: 'assets/images/rambutan.png',
                    child: Text('Rambutan'),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  addProduct(productName, productType, productPrice, imageUrl);
                  Navigator.pop(context); // Закрыть меню
                },
                child: Text('Add Product'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top),
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
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi $name!'),
                        Text(
                          "Let's get some item!",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
                        '$cartItemCount',
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
                      shadowColor: const WidgetStatePropertyAll(
                          Colors.transparent),
                      backgroundColor: const WidgetStatePropertyAll(
                          Colors.transparent),
                      surfaceTintColor: const WidgetStatePropertyAll(
                          Colors.transparent),
                      overlayColor: const WidgetStatePropertyAll(
                          Colors.transparent),
                      leading: searchIcon,
                      hintText: 'Search item...',
                      textStyle: const WidgetStatePropertyAll(TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400)),
                      padding: const WidgetStatePropertyAll(
                          EdgeInsets.only(right: 20, left: 20)),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
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
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Listing(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddProductMenu(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}