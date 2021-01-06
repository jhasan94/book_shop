import 'package:book_shop/models/event_model/events_model.dart';
import 'package:book_shop/models/event_model/past_event_model.dart';

List<EventsModel> getEvents() {
  List<EventsModel> events = new List<EventsModel>();
  EventsModel eventsModel = new EventsModel();

  //1
  eventsModel.imgeAssetPath = "assets/images/events/edu.jpg";
  eventsModel.date = "Jan 12, 2021";
  eventsModel.desc = "Education Event in Bangladesh 2021";
  eventsModel.address = "NSU, Bashundhara R/A, Dhaka";
  events.add(eventsModel);

  eventsModel = new EventsModel();

  //2
  eventsModel.imgeAssetPath = "assets/images/events/concert.jpg";
  eventsModel.date = "Jan 22, 2021";
  eventsModel.desc = "Folk Concert 2021";
  eventsModel.address = "Army Studium, Dhaka";
  events.add(eventsModel);

  eventsModel = new EventsModel();

  //3
  eventsModel.imgeAssetPath = "assets/images/events/sport.jpg";
  eventsModel.date = "feb 12, 2021";
  eventsModel.desc = "Global Sports Day";
  eventsModel.address = "Dhaka, Bangladesh";
  events.add(eventsModel);

  eventsModel = new EventsModel();

  return events;
}

List<PastEventModel> getPastEvent() {
  List<PastEventModel> pastEvents = new List<PastEventModel>();
  PastEventModel pastEventModel = new PastEventModel();
  //1
  pastEventModel.imgeAssetPath = "assets/images/events/sport.jpg";
  pastEventModel.date = "feb 12, 2021";
  pastEventModel.desc = "Global Sports Day";
  pastEventModel.address = "Dhaka, Bangladesh";
  pastEvents.add(pastEventModel);

  pastEventModel = new PastEventModel();

  //2
  pastEventModel.imgeAssetPath = "assets/images/events/sport.jpg";
  pastEventModel.date = "feb 12, 2021";
  pastEventModel.desc = "Global Sports Day";
  pastEventModel.address = "Dhaka, Bangladesh";
  pastEvents.add(pastEventModel);

  pastEventModel = new PastEventModel();

  return pastEvents;
}
