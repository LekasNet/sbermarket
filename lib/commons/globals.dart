const name = 'Mike Wazovsky';

// Пример файла globals.dart

class ProductItem {
  final String name;
  final String type;
  final String price;
  final String imageUrl;
  final bool isFavorite;

  ProductItem({
    required this.name,
    required this.type,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
}

// Инициализация глобальных списков с примерами товаров
List<ProductItem> popularItems = [
  ProductItem(
    name: 'Rambutan',
    type: 'Fruit',
    price: '\$22.99',
    imageUrl: 'assets/images/rambutan.png', // Путь к вашему локальному изображению или URL
    isFavorite: true,
  ),
  ProductItem(
    name: 'Durian Monty',
    type: 'Fruit',
    price: '\$32.99',
    imageUrl: 'assets/images/durian.png', // Путь к вашему локальному изображению или URL
    isFavorite: false,
  ),
  ProductItem(
    name: 'Rambutan',
    type: 'Fruit',
    price: '\$22.99',
    imageUrl: 'assets/images/rambutan.png', // Путь к вашему локальному изображению или URL
    isFavorite: true,
  ),
  ProductItem(
    name: 'Durian Monty',
    type: 'Fruit',
    price: '\$32.99',
    imageUrl: 'assets/images/durian.png', // Путь к вашему локальному изображению или URL
    isFavorite: false,
  ),
  ProductItem(
    name: 'Rambutan',
    type: 'Fruit',
    price: '\$22.99',
    imageUrl: 'assets/images/rambutan.png', // Путь к вашему локальному изображению или URL
    isFavorite: true,
  ),
  ProductItem(
    name: 'Durian Monty',
    type: 'Fruit',
    price: '\$32.99',
    imageUrl: 'assets/images/durian.png', // Путь к вашему локальному изображению или URL
    isFavorite: false,
  ),
  ProductItem(
    name: 'Rambutan',
    type: 'Fruit',
    price: '\$22.99',
    imageUrl: 'assets/images/rambutan.png', // Путь к вашему локальному изображению или URL
    isFavorite: true,
  ),
  ProductItem(
    name: 'Durian Monty',
    type: 'Fruit',
    price: '\$32.99',
    imageUrl: 'assets/images/durian.png', // Путь к вашему локальному изображению или URL
    isFavorite: false,
  ),

];

List<ProductItem> recentItems = [
  ProductItem(
    name: 'Strawberry',
    type: 'Fruit',
    price: '\$18.99',
    imageUrl: 'assets/images/strawberry.png', // Путь к вашему локальному изображению или URL
    isFavorite: false,
  ),  ProductItem(
    name: 'Strawberry',
    type: 'Fruit',
    price: '\$18.99',
    imageUrl: 'assets/images/strawberry.png', // Путь к вашему локальному изображению или URL
    isFavorite: false,
  ),  ProductItem(
    name: 'Strawberry',
    type: 'Fruit',
    price: '\$18.99',
    imageUrl: 'assets/images/strawberry.png', // Путь к вашему локальному изображению или URL
    isFavorite: false,
  ),  ProductItem(
    name: 'Strawberry',
    type: 'Fruit',
    price: '\$18.99',
    imageUrl: 'assets/images/strawberry.png', // Путь к вашему локальному изображению или URL
    isFavorite: false,
  ),  ProductItem(
    name: 'Strawberry',
    type: 'Fruit',
    price: '\$18.99',
    imageUrl: 'assets/images/strawberry.png', // Путь к вашему локальному изображению или URL
    isFavorite: false,
  ),  ProductItem(
    name: 'Strawberry',
    type: 'Fruit',
    price: '\$18.99',
    imageUrl: 'assets/images/strawberry.png', // Путь к вашему локальному изображению или URL
    isFavorite: false,
  ),  ProductItem(
    name: 'Strawberry',
    type: 'Fruit',
    price: '\$18.99',
    imageUrl: 'assets/images/strawberry.png', // Путь к вашему локальному изображению или URL
    isFavorite: false,
  ),  ProductItem(
    name: 'Strawberry',
    type: 'Fruit',
    price: '\$18.99',
    imageUrl: 'assets/images/strawberry.png', // Путь к вашему локальному изображению или URL
    isFavorite: false,
  ),
  // Добавьте столько элементов, сколько вам нужно
];
