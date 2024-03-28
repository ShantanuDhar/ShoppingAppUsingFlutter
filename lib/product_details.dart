import 'package:flutter/material.dart';
// import 'package:shop_app_personal/global_variables.dart';
import 'cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
   final Map<String, Object> product;
  const ProductDetailsPage({super.key,
  required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
   int selectedSize=0;
   void onTap() {
    if (selectedSize != 0) {
     Provider.of<CartProvider>(context,listen: false).addItem({
      'id': widget.product['id'] ,
      'title': widget.product['title'] ,
      'price': widget.product['price'] ,
      'imageUrl': widget.product['imageUrl'] ,
       'size': selectedSize,
     }
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added successfully!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a size!'),
        ),
      );
    }
  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: const Text(' Details', style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.w500,
    
        ),),
      ),
      body:  Column(
        children: [
Center(
  child: Text(
    widget.product['title'] as String,
    style: Theme.of(context).textTheme.titleLarge,
  ),
 

),
 const Spacer(),
  Padding(
    padding: const EdgeInsets.all(16.0),
    child: Image.asset(
      widget.product['imageUrl'] as String,
     
    ),
  ),
  const Spacer(flex: 2,),
  Container(
    height: 250,
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 125, 150, 175),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    child: Column(
      children: [
        const SizedBox(height: 20,),
        Text(
          'Price: \$${widget.product['price']}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        
        const SizedBox(height: 10,),
        SizedBox(
          height: 50,
          
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            
            itemCount: (widget.product['sizes'] as List<int>).length,
            itemBuilder:(context, index) {
              final size= (widget.product['sizes'] as List<int>)[index];
              return Padding(padding: const EdgeInsets.all(8.0),

              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSize=size;
                  });
                },
                child: Chip(label: Text(size.toString(),
                ),
                backgroundColor: selectedSize==size? Theme.of(context).colorScheme.primary : const Color.fromRGBO(245, 247, 249, 1),
                
                ),
              ));
             

            }
        )
        ),
        Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    onPressed: onTap
                    ,
                    icon: const Icon(Icons.shopping_cart_outlined , color: Colors.black,),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: const Size(350, 50),
                     
                      
                      
                    ),
                    
                    
                    label: const Text(
                      'Add To Cart',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        
                      ),
                    ),
                    
                    
                  ),
                ),
      ],
    ),


  )
 


      ]),

    
    );
  }
}