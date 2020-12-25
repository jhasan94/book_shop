import 'package:book_shop/models/event_model/date_model.dart';
import 'package:book_shop/models/event_model/event_type_model.dart';
import 'package:book_shop/models/event_model/events_model.dart';

List<DateModel> getDates() {
  List<DateModel> dates = new List<DateModel>();
  DateModel dateModel = new DateModel();

  //1
  dateModel.date = "10";
  dateModel.weekDay = "Sun";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "11";
  dateModel.weekDay = "Mon";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "12";
  dateModel.weekDay = "Tue";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "13";
  dateModel.weekDay = "Wed";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "14";
  dateModel.weekDay = "Thu";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "15";
  dateModel.weekDay = "Fri";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "16";
  dateModel.weekDay = "Sat";
  dates.add(dateModel);

  dateModel = new DateModel();

  return dates;
}

List<EventTypeModel> getEventTypes() {
  List<EventTypeModel> events = new List();
  EventTypeModel eventModel = new EventTypeModel();

  //1
  eventModel.imgAssetPath = "assets/images/events/education.png";
  eventModel.eventType = "Education";
  events.add(eventModel);

  eventModel = new EventTypeModel();

  //1
  eventModel.imgAssetPath = "assets/images/events/concert.png";
  eventModel.eventType = "Concert";
  events.add(eventModel);

  eventModel = new EventTypeModel();

  //1
  eventModel.imgAssetPath = "assets/images/events/sports.png";
  eventModel.eventType = "Sports";
  events.add(eventModel);

  eventModel = new EventTypeModel();

  return events;
}

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
