import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "C++",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/c++.jpg",
      color: Color(0xFF424242)),
  Product(
      id: 2,
      title: "C programming",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/c.jpg",
      color: Color(0xFF424242)),
  Product(
      id: 3,
      title: "Java",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/java.jpg",
      color: Color(0xFF455A64)),
  Product(
      id: 4,
      title: "Perl",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/perl.jpg",
      color: Color(0xFF455A64)),
  Product(
      id: 5,
      title: "php",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/php.png",
      color: Color(0xFF9E9D24)),
  Product(
    id: 6,
    title: "Python",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/python.jpg",
    color: Color(0xFF01579B),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
