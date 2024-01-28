import 'package:flutter/material.dart';

class softdrinks extends StatelessWidget {
  const softdrinks({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.redAccent,

        title: Text('SoftDrinks',
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
              
            Image.asset('assets/coke.jpg'),
              TextButton(
                  child: Text('Coca cola'),
                onPressed:(){
                Navigator.pop(context);},
                ),
        Image.asset('assets/pepsi.jpg'),
              TextButton(
                onPressed:(){
                  Navigator.pop(context);
                } ,
                  child: Text('Pepsi Can'),
              ),
              Image.asset('assets/drpepper.jpg'),
              TextButton(
                onPressed:(){
                  Navigator.pop(context);
                } ,
                child: Text('Dr. Pepper Can'),
              )
            ],
          ),

        ],
      ),

    );
  }
}


