import 'package:corelab_project/pages/Categorias.dart';
import 'package:corelab_project/pages/Product_detail.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> body=[
    ProductDetail(),
    Categorias(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:body[_currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30,
        onTap: (int newIndex){

          setState(() {
            _currentIndex = newIndex;
          });
        },
        selectedItemColor: Color.fromRGBO(0, 180, 204, 1),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ), BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            label: 'Categories',
          ),],
      ),
    );
  }
}
