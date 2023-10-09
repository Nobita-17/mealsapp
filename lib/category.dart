import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,   //no of column is grid
          childAspectRatio: 3 / 2,   //sizing of each grid in terms of width & height
          crossAxisSpacing: 20,   //horizonatl spacing between grids
          mainAxisSpacing: 20,   //vertical spacing between grids
        ),
        children: [
          Text("1",style: TextStyle(color: Colors.white),),
          Text("2",style: TextStyle(color: Colors.white),),
          Text("3",style: TextStyle(color: Colors.white),),
          Text("4",style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}
