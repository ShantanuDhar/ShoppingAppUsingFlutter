import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'cart_provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        

      ),
      body: ListView.builder(
        itemCount: cart.length ,
        itemBuilder: ((context, index) {
        final cartItem=cart[index];
        return ListTile(
          title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size:${cartItem['size'].toString()}',),
          leading: CircleAvatar(radius: 30,child: Image.asset(cartItem['imageUrl'] as String,
         


          ),),
         trailing:  IconButton(
          
          color: Colors.red,
           icon: const Icon(Icons.delete),
           onPressed: (){
             showDialog( context: context,
             builder: (context){
              return AlertDialog(
                title: Text('Delete Product',
                style: Theme.of(context).textTheme.titleMedium ),
                content: const Text('Are you sure you want to delete this product?'),
                actions: [
                  TextButton(onPressed: (){
                    
                     Navigator.pop(context);
                  }, child:  const Text('No',
                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold ),)),
                  TextButton(onPressed: (){
                    context.read<CartProvider>().removeItem(cartItem);
                    // Provider.of<CartProvider>(context,listen:false).removeItem(cartItem);
                     Navigator.pop(context);
                  }, child:  const Text('Yes',
                  style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold ),))
                ],
              );
              
              
             });
           },
         )
        );
         
      })),

       
    );
  }
} 