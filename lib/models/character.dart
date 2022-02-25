import 'package:flutter/material.dart';

class Character
{
  final String name;
  final String imageUrl;
  final String description;
  final List<Color> colors;
  Character({this.name, this.imageUrl, this.description, this.colors});
}

List character = [
  Character(
  name: 'Panther',
  imageUrl: 'images/1.png',
  colors: [Colors.orange.shade200,Colors.deepOrange.shade400],
  description: 'paaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaanther',
),
  Character(
    name: 'Dog',
    imageUrl: 'images/2.png',
    colors: [Colors.pink.shade200,Colors.redAccent.shade400],
    description: 'Dooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooog',
  )
];