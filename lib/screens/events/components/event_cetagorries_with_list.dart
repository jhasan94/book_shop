import 'package:book_shop/controllers/controller.dart';
import 'package:book_shop/screens/events/components/eventTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventCatagorriesList extends StatelessWidget {
  final Controller controller = Get.put(Controller());
  String todayDateIs = "12";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorColor: Colors.brown,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 5.0),
                insets: EdgeInsets.symmetric(horizontal: 50.0)),
            tabs: [
              Tab(
                  child: Text(
                "Past events",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                  //color: selectedIndex == index ? Colors.amberAccent : Colors.white,
                ),
              )),
              Tab(
                  child: Text(
                "Future events",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                  //color: selectedIndex == index ? Colors.amberAccent : Colors.white,
                ),
              )),
              //Tab(icon: Icon(Icons.directions_transit)),
            ],
          ),
          title: Text(
            "Events",
            style: TextStyle(
              color: Colors.brown,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
          elevation: 0,
        ),
        body: TabBarView(
          children: [
            Container(
              child: Container(child: Obx(() {
                if (controller.isLoading.value)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else
                  return RefreshIndicator(
                    onRefresh: () => controller.fetchEvent(),
                    child: ListView.builder(
                        itemCount: controller.eventList.first.data.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var event = controller.eventList.first.data[index];
                          print("data is ...." + event.eventType.toString());
                          return (event.eventType.toString() ==
                                  "EventType.PAST")
                              ? PopularEventTile(
                                  desc: event.name,
                                  date: event.createdAt.toString(),
                                  address: "address",
                                )
                              : Container();
                        }),
                  );
              })),
            ),
            Container(
              child: Container(child: Obx(() {
                if (controller.isLoading.value)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else
                  return RefreshIndicator(
                    onRefresh: () => controller.fetchEvent(),
                    child: ListView.builder(
                        itemCount: controller.eventList.first.data.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var event = controller.eventList.first.data[index];
                          print("data is ...." + event.eventType.toString());
                          return (event.eventType.toString() ==
                                  "EventType.FUTURE")
                              ? PopularEventTile(
                                  desc: event.name,
                                  date: event.createdAt.toString(),
                                  address: "address",
                                )
                              : Container();
                        }),
                  );
              })),
            ),
            //Icon(Icons.directions_transit),
            //Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
