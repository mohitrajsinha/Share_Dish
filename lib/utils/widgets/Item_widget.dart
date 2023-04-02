import 'package:share_dish/models/catalogue.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: () {
            print("${item.name} is pressed");
          },
          leading: Image.network(item.image),
          
          title: Text(
            item.name,
          ),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            textScaleFactor: 1.3,
            style: const TextStyle(
              color: Color.fromARGB(255, 134, 68, 255),
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
