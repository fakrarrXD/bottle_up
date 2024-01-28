import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpages/coffee.dart';
import 'package:newpages/liquor.dart';
import 'package:newpages/softdrinks.dart';
import 'package:newpages/winery.dart';
class mainmenu extends StatelessWidget {
  const mainmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: Drawer(
        
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: null,


            ),
            ListTile(
              leading: Icon(Icons.wine_bar),
              title: Text('Wine'),
              onTap: (){

                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Wine()),
                );
              },
              iconColor: Colors.red,


            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.wineBottle),
              title: Text('SoftDrinks'),
              onTap: (){
               Navigator.push(context,
                   MaterialPageRoute(builder: (context)=>softdrinks()),
               );


              },
              iconColor: Colors.black,


            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.mugSaucer),
              title: Text('Coffee'),
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>coffee()),
                );
              },
              iconColor: Colors.brown,


            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.beerMugEmpty),
              title: Text('Liquor'),
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Liquor()),
                );
              },
              iconColor: Colors.orange,


            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.tags),
              title: Text('Limted Offer!'),
              onTap: null,
              iconColor: Colors.amber,


            ),
          ],
        ),
      ),
      appBar: AppBar(
       backgroundColor: Colors.redAccent,

       title: Text('Bottles Up!',
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
          Image.asset('assets/ordernow.jpg'),
            Row(
              children: [
                Image.asset('assets/coke.jpg',
                height: 274,),
                Image.asset('assets/drpepper.jpg',
                  height: 274,)
              ],
              
            )
          ],
        ),
      ],
    ),
    
    );
  }
}
