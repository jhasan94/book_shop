import 'package:book_shop/constants.dart';
import 'package:book_shop/data/data.dart';
import 'package:book_shop/models/event_model/date_model.dart';
import 'package:book_shop/models/event_model/event_type_model.dart';
import 'package:book_shop/models/event_model/events_model.dart';
import 'package:book_shop/screens/events/components/dateTile.dart';
import 'package:book_shop/screens/events/components/eventTile.dart';
import 'package:book_shop/screens/events/components/popular_eventTile.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<EventScreen> {
  List<DateModel> dates = new List<DateModel>();
  List<EventTypeModel> eventsType = new List();
  List<EventsModel> events = new List<EventsModel>();

  String todayDateIs = "12";

  @override
  void initState() {
    super.initState();
    dates = getDates();
    eventsType = getEventTypes();
    events = getEvents();
  }

//Color(0xff102733)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: kDefaultPaddin),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.black54),
            ),
            Scrollbar(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "EVE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                                "NTS",
                                style: TextStyle(
                                    color: Color(0xffFCCD00),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3, color: Color(0xffFAE072)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "assets/images/events/jahid.jpg",
                                  height: 30,
                                  width: 30,
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Hello From Book Shop",
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Let's explore what’s happening today",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      //
                      // /// Dates
                      // Container(
                      //   height: 60,
                      //   child: ListView.builder(
                      //       itemCount: dates.length,
                      //       shrinkWrap: true,
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder: (context, index) {
                      //         return DateTile(
                      //           weekDay: dates[index].weekDay,
                      //           date: dates[index].date,
                      //           isSelected: todayDateIs == dates[index].date,
                      //         );
                      //       }),
                      // ),
                      //
                      // /// Events
                      // SizedBox(
                      //   height: 16,
                      // ),
                      // Text(
                      //   "All Events",
                      //   style: TextStyle(color: Colors.white, fontSize: 20),
                      // ),
                      // SizedBox(
                      //   height: 16,
                      // ),
                      // Container(
                      //   height: 100,
                      //   child: ListView.builder(
                      //       itemCount: eventsType.length,
                      //       shrinkWrap: true,
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder: (context, index) {
                      //         return EventTile(
                      //           imgAssetPath: eventsType[index].imgAssetPath,
                      //           eventType: eventsType[index].eventType,
                      //         );
                      //       }),
                      // ),

                      /// Popular Events
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Popular Events",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        child: ListView.builder(
                            itemCount: events.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return PopularEventTile(
                                desc: events[index].desc,
                                imgeAssetPath: events[index].imgeAssetPath,
                                date: events[index].date,
                                address: events[index].address,
                              );
                            }),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
