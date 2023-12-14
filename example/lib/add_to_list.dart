import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class ExampleAddOnSwipe extends StatefulWidget {
  const ExampleAddOnSwipe({Key? key}) : super(key: key);

  @override
  State<ExampleAddOnSwipe> createState() => _ExampleAddOnSwipeState();
}

class _ExampleAddOnSwipeState extends State<ExampleAddOnSwipe> {
  final List<String> items = ['item[0]', 'item[1]', 'item[2]'];
  final SwiperController controller = SwiperController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Example add on swipe'),
        ),
        body: Swiper(
          controller: controller,
          itemBuilder: (context, index) {
            log('itemBuilder: items[$index]=${items[index]} items.length=${items.length}');
            return Center(
              child: Text(items[index]),
            );
          },
          itemCount: items.length,
          scrollDirection: Axis.vertical,
          onIndexChanged: (index) async {
            log('onIndexChanged: items[$index]=${items[index]} items.length=${items.length}');
            // add 1 item at end of list
            if (index == items.length - 1) {
              setState(() {
                final newItem = 'item[${items.length}]';
                items.add(newItem);
                log('onIndexChanged: added $newItem');
              });
            }
          },
        ));
  }
}
