import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../core/store.dart';
import '../../../models/cart.dart';
import '../../../models/catalogue.dart';
import '../themes.dart';

class AddtoCart extends StatelessWidget {
  final Item catalogue;
  const AddtoCart({Key? key, required this.catalogue}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
      final CartModel cart = (VxState.store as MyStore).cart;


    bool isInCart = cart.items.contains(catalogue)??false;

    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalogue);
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(MyTheme.lightBluishColor),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        child: isInCart
            ? const Icon(Icons.done)
            : const Icon(CupertinoIcons.cart_badge_plus));
  }
}
