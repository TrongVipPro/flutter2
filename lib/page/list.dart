import 'package:flutter/material.dart';
import 'package:widget_image/data/data.dart';
import 'package:widget_image/data/model.dart';
import 'package:widget_image/data/model.dart';
import 'package:intl/intl.dart';
import 'package:widget_image/config/const.dart';


class MyList extends StatefulWidget {
  const MyList({super.key});
  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  List<ProductModel> lstProduct = [];
  @override
  void initState() {
    super.initState();
    lstProduct = createDataList(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My List Product: Truong Trong'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: lstProduct.length,
          itemBuilder: (context, index) {
            return itemListView(lstProduct[index]);
          }),
        ),
      );
  }
  //create sub widget
  Widget itemListView(ProductModel productModel){
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration( color: Colors.grey.shade200),
      child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [
        Image.asset(
          url_img + productModel.img!,
          height: 80,
          width: 80,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),
        ),
        const SizedBox(
          width: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productModel.name ?? '',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              "Price: ${NumberFormat('###,###,###').format(productModel.price)}",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              productModel.des!,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ]),
    );
  }
}