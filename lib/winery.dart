import 'package:flutter/material.dart';

class Wine extends StatelessWidget {
  const Wine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.redAccent,

        title: Text('Wine',
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

              Image.asset('assets/chardonnay.jpg'),
              TextButton(
                child: Text('Chardonnay'),
                onPressed:(){
                  Navigator.pop(context);},
              ),
              Image.asset('assets/barrancoa.jpg'),
              TextButton(
                onPressed:(){
                  Navigator.pop(context);
                } ,
                child: Text('Barrancoa White Wine'),
              ),

            ],
          ),

        ],
      ),

    );
  }
}


