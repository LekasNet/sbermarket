import 'package:flutter/material.dart';
import 'package:sbermarket/commons/colors.dart';
import 'package:sbermarket/commons/globals.dart';
import 'package:sbermarket/pages/card_page.dart';


class Listing extends StatefulWidget {
  _ListingState createState() => _ListingState();

}

class _ListingState extends State<Listing> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Popular item',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 250.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return CardPage(item: popularItems[index]);
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0); // Начальная точка (справа)
                          const end = Offset.zero; // Конечная точка (на экране)
                          const curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end).chain(
                            CurveTween(curve: curve),
                          );

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: ClipRect(
                    child: Stack(
                      clipBehavior: Clip.hardEdge,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Container(
                            child: Stack(
                              clipBehavior: Clip.hardEdge,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(popularItems[index].imageUrl),
                                      Text(
                                        popularItems[index].name,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.indigoAccent,
                                        ),
                                      ),
                                      Text(
                                        popularItems[index].type,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFF818181),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        popularItems[index].price,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                    child: Material(
                                      color: primaryColor,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, right: 16, left: 16),
            child: Text('Recent shop',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recentItems.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: Image.asset(recentItems[index].imageUrl),
                      title: Text(recentItems[index].name),
                      subtitle: Text(recentItems[index].type),
                      trailing: Text(recentItems[index].price),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
