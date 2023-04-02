import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../models/catalogue.dart';

class MyStore extends VxStore {
  late CatalogueModel catalogue;
  late CartModel cart;

  MyStore() {
    catalogue = CatalogueModel();
    cart = CartModel();
    cart.catalogue = catalogue;
  }
}
