import 'package:share_dish/core/store.dart';
import 'package:share_dish/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:confetti/confetti.dart';
import '../utils/widgets/themes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        centerTitle: true,
        title: "Cart".text.bold.color(context.accentColor).make(),
      ),
      body: Column(
        children: [ cart_list().p32().expand(), const Divider(), const CartTotal()],
      ),
    );
  }
}

class CartTotal extends StatefulWidget {
  const CartTotal({super.key});

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  final controller = ConfettiController();

  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      isPlaying = controller.state == ConfettiControllerState.playing;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ConfettiWidget(
            confettiController: controller,
            shouldLoop: true,
            blastDirectionality: BlastDirectionality.explosive,
            numberOfParticles: 50,
          ),
          VxConsumer(
              mutations: const {RemoveMutation},
              builder: ((context, store, status) {
                return "\$${cart.totalprice}"
                    .text
                    .xl5
                    .color(context.accentColor)
                    .make();
              })),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    if (isPlaying) {
                      controller.stop();
                    } else {
                      controller.play();
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            "Hurray! Your order has been placed".text.make()));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.lightBluishColor),
                      shape: MaterialStateProperty.all(const StadiumBorder())),
                  child: "Buy".text.make())
              .wh(100, 50)
        ],
      ),
    );
  }
}

class cart_list extends StatelessWidget {
//   const cart_list({super.key});

//   @override
//   State<cart_list> createState() => _cart_listState();
// }

// class _cart_listState extends State<cart_list> {
  final CartModel _cart = (VxState.store as MyStore).cart;

   cart_list({super.key});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? "Your Cart Is Empty".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: ((context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline_outlined),
                    onPressed: () {
                      RemoveMutation(_cart.items[index]);
                      // setState(() {});
                    },
                  ),
                  title: _cart.items[index].name.text.make(),
                )),
          );
  }
}
