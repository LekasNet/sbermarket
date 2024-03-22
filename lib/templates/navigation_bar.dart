import 'package:flutter/material.dart';
import 'package:sbermarket/commons/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    Key? key,
    this.selectedIndex = 0,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10), // Отступ от краев экрана
      decoration: BoxDecoration(
        color: primaryColor, // Цвет фона
        borderRadius: BorderRadius.circular(30), // Скругление углов
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30), // Скругление углов для обрезки содержимого
        child: BottomNavigationBar(
          backgroundColor: primaryColor, // Прозрачный фон
          elevation: 0, // Убрать тень
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          onTap: onItemSelected,
        ),
      ),
    );
  }
}
