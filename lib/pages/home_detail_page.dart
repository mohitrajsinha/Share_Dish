import 'package:flutter/material.dart';
import 'package:share_dish/utils/widgets/home_widgets/addToCart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:share_dish/models/catalogue.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalogue;
  const HomeDetailPage({
    Key? key,
    required this.catalogue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: catalogue.name.text.make(),
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalogue.price}".text.bold.xl4.orange400.make(),
            AddtoCart(catalogue: catalogue).wh(115, 55)
          ],
        ).p32(),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalogue.id.toString()),
                      child: Image.network(catalogue.image))
                  .h32(context),
              // Text(
              //   catalogue.desc,
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              Expanded(
                  child: VxArc(
                height: 45,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(children: [
                    catalogue.name.text.xl2
                        .color(context.accentColor)
                        .bold
                        .make(),
                    catalogue.desc.text
                        .textStyle(context.captionStyle)
                        .xl
                        .make(),
                    10.heightBox,
                    "- Quantity-25 persons, Freshly preaped today, Collect it by 11 pm"
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .px12()
                  ]).py64(),
                ),
              ))
            ],
          ).p16()),
    );
  }
}
