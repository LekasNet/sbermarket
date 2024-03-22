import 'package:flutter/material.dart';

import 'package:sbermarket/commons/globals.dart';


class Listing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Popular item', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 250.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 170.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(popularItems[index].imageUrl), // Изображение товара
                          Text(popularItems[index].name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.indigoAccent),),
                          Text(popularItems[index].type, style: TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF818181))),
                          Text(popularItems[index].price), // Цена
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Recent shop', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(), // Чтобы список не прокручивался внутри SingleChildScrollView
              shrinkWrap: true, // Чтобы список занял только необходимое пространство
              itemCount: recentItems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.asset(recentItems[index].imageUrl), // Изображение товара
                    title: Text(recentItems[index].name), // Название товара
                    subtitle: Text(recentItems[index].type), // Тип товара
                    trailing: Text(recentItems[index].price), // Цена
                  ),
                );
              },
            ),
          ],
        ),
    );
  }
}