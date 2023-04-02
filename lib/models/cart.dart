import 'package:share_dish/models/catalogue.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartModel {
 static final  cartModel = CartModel._internal();

  CartModel._internal();

 factory CartModel() => cartModel;
  //catalogue field
  late CatalogueModel _catalogue;

  //collection of ID's-store ID's of each item

   final List<int> _itemIds = [];

  //Get Catalogue
  CatalogueModel get catalogue => _catalogue;


  set catalogue(CatalogueModel newCatalogue) {
    // assert(newCatalogue != null);
    _catalogue = newCatalogue;
  }

  //Get Items in the cart
  List<Item> get items => _itemIds.map((id) => _catalogue.getById(id)).toList();

  //Get total price
  int get totalprice =>
      items.fold(0, (total, current) => total + current.price);
  

  //Remove item
  
}


class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}