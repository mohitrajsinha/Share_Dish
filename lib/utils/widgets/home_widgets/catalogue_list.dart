import 'package:share_dish/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../models/catalogue.dart';
import 'addToCart.dart';
import 'catalogue_image.dart';

class CatalogueList extends StatelessWidget {
  const CatalogueList({super.key});

  @override
  Widget build(BuildContext context) {
    return !context.isMobile? GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      shrinkWrap: true,
      itemCount: CatalogueModel.items.length,
      itemBuilder: (context, index) {
        final Catalogue = CatalogueModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) =>
                        HomeDetailPage(catalogue: Catalogue)))),
            child: Catalogueitems(catalogue: Catalogue));
      },
    ):ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogueModel.items.length,
      itemBuilder: (context, index) {
        final Catalogue = CatalogueModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) =>
                        HomeDetailPage(catalogue: Catalogue)))),
            child: Catalogueitems(catalogue: Catalogue));
      },
    );
  }
}

class Catalogueitems extends StatelessWidget {
  final Item catalogue;

  const Catalogueitems({
    Key? key,
    required this.catalogue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalogue.id.toString()),
            child: catalogueimages(image: catalogue.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalogue.name.text.lg
                .color(context.theme.colorScheme.secondary)
                .bold
                .make(),
            catalogue.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalogue.price}".text.bold.xl.make(),
                AddtoCart(catalogue: catalogue)
              ],
            ).pOnly(right: 9.0)
          ],
        ))
      ],
    )).color(context.theme.cardColor).roundedLg.square(250).make().py16();
  }
}


