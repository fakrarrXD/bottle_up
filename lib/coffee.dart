import 'package:flutter/material.dart';

class coffee extends StatelessWidget {
  const coffee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.redAccent,

        title: Text('Coffee',
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

              Image.asset('assets/chicago.jpg'),
              TextButton(
                child: Text('Chicago French Press'),
                onPressed:(){
                  Navigator.pop(context);},
              ),
              Image.asset('assets/nescafe gold.jpg'),
              TextButton(
                onPressed:(){
                  Navigator.pop(context);
                } ,
                child: Text('Nescafe Gold'),
              ),

            ],
          ),

        ],
      ),

    );
  }
}


