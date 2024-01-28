import 'package:flutter/material.dart';

class Liquor extends StatelessWidget {
  const Liquor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.redAccent,

        title: Text('Liquor',
          style: TextStyle(
              color: Colors.yellow ),),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.account_circle),
            tooltip: "Your Account",
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.shopping_cart),
            tooltip: "Your Cart",)
        ],

      ),
      body: ListView(
        children: [
          Column(
            children: [

              Image.asset('assets/bacardi.jpg'),
              TextButton(
                child: Text('Bacardi Rum'),
                onPressed:(){
                  Navigator.pop(context);},
              ),

              Image.asset('assets/prosecco.jpg'),
              TextButton(
                onPressed:(){
                  Navigator.pop(context);
                } ,
                child: Text('Prosecco'),
              ),
              Image.asset('assets/soju.jpg'),
              TextButton(
                onPressed:(){
                  Navigator.pop(context);
                } ,
                child: Text('Jinro Soju'),
              )
            ],
          ),

        ],
      ),

    );
  }
}


