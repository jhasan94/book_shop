import 'package:book_shop/controllers/controller.dart';
import 'package:book_shop/screens/events/components/popular_eventTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Upcoming events",
    "Past events",
  ];
  final Controller controller = Get.put(Controller());
  String todayDateIs = "12";
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color:
                    selectedIndex == index ? Colors.amberAccent : Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
              height: 2,
              width: 80,
              color: selectedIndex == index
                  ? Colors.amberAccent
                  : Colors.transparent,
            ),
            Expanded(
              child: Container(child: Obx(() {
                if (controller.isLoading.value)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else
                  return ListView.builder(
                      itemCount: controller.eventList.first.data.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var event = controller.eventList.first.data[index];
                        return PopularEventTile(
                          desc: event.name,
                          date: event.createdAt.toString(),
                          address: "address",
                        );
                      });
              })),
            ),
          ],
        ),
      ),
    );
  }
}
