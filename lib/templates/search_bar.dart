import 'package:flutter/material.dart';


class SearchingBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchingBar> {
  bool isIconSmall = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isIconSmall = true),
      onTapUp: (_) => setState(() => isIconSmall = false),
      onTapCancel: () => setState(() => isIconSmall = false),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          width: 280,
          child: TextField(
            style: TextStyle(
              fontSize: 16.0, // Устанавливаем размер шрифта
              fontWeight: FontWeight.bold, // Делаем текст жирным
              color: Colors.black, // Задаем цвет текста
            ),
            decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                size: isIconSmall ? 20.0 : 24.0,
                // Иконка уменьшается при нажатии
                color: Colors.grey,
              ),
              hintText: 'Search Item...',
              border: InputBorder.none, // Убираем подчёркивание
            ),
          ),
        ),
      ),
    );
  }
}