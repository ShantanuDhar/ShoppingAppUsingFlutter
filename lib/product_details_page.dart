import 'package:flutter/material.dart';
import 'package:shop_app_personal/global_variables.dart';
import 'package:shop_app_personal/product_card.dart';
import 'package:shop_app_personal/product_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}
 

class _ProductListState extends State<ProductList> {
  final List<String> filters=  const ['All','Adidas','Nike','Puma','Reebok' , 'Under Armour'];
    late String selectedFilter;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter=filters[0];
  }
  @override
  Widget build(BuildContext context) {
     const border=  OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          
                        ),
                        
                      );
    return  SafeArea(
        child: Column(
          children: [
             Row(
              children: [
                 Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Shoes \nCollection', style: Theme.of(context).textTheme.titleLarge),
                ),
                const Expanded(
                 
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: border,
                      focusedBorder: border,
                      
                    
                                
                      prefixIcon:  Icon(Icons.search),
                    ),
                  ),
                )
              ],
            ),
           SizedBox(
            height: 105,
             child: ListView.builder(
                itemCount: filters.length ,
                scrollDirection: Axis.horizontal,
                itemBuilder:(context,index) {
final filter= filters[index];
                  return  Padding(
                  padding: const EdgeInsets.symmetric(  horizontal: 10.0, ),
                  child: GestureDetector(
                    onTap: () => { 
                      setState(() {
                        selectedFilter=filter;
                      }),
                     
                      
                    },
                    child: Chip(
                      backgroundColor: selectedFilter==filter? Theme.of(context).colorScheme.primary : const Color.fromRGBO(245, 247, 249, 1),
                      side: const BorderSide(
                        color:  Color.fromRGBO(245, 247, 249, 1),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29),
                      ),
                      label: Text(filter),
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                    
                                    ),
                  ),
                );
                },
                ),
           ),
           SizedBox(
              height: 550,
             child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product= products[index];
                return  GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute( builder: (context){
                      return ProductDetailsPage(product: product);
                    } ));
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                    backgroundColor: index.isEven? const Color.fromRGBO(245, 247, 249, 1) : Theme.of(context).colorScheme.primary,
                    
                  
                  ),
                );
                
             
             
             
             
              }
             ),
           )
              ],
            
        ),
      );
  }
}