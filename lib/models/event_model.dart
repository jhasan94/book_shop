import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
  Event({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.details,
    this.date,
    this.time,
    this.eventType,
    this.coverPhoto,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String details;
  Date date;
  Time time;
  EventType eventType;
  CoverPhoto coverPhoto;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        details: json["details"],
        date: dateValues.map[json["date"]],
        time: timeValues.map[json["time"]],
        eventType: eventTypeValues.map[json["event_type"]],
        coverPhoto: coverPhotoValues.map[json["cover_photo"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "details": details,
        "date": dateValues.reverse[date],
        "time": timeValues.reverse[time],
        "event_type": eventTypeValues.reverse[eventType],
        "cover_photo": coverPhotoValues.reverse[coverPhoto],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum CoverPhoto { THE_1612156344_JPG, THE_1612156314_JPG, THE_1611795161_JPG }

final coverPhotoValues = EnumValues({
  "1611795161.jpg": CoverPhoto.THE_1611795161_JPG,
  "1612156314.jpg": CoverPhoto.THE_1612156314_JPG,
  "1612156344.jpg": CoverPhoto.THE_1612156344_JPG
});

enum Date { THE_31122022, THE_18022021 }

final dateValues = EnumValues(
    {"18/02/2021": Date.THE_18022021, "31/12/2022": Date.THE_31122022});

enum EventType { PAST, FUTURE }

final eventTypeValues =
    EnumValues({"Future": EventType.FUTURE, "Past": EventType.PAST});

enum Time { THE_1200_AM, THE_1000_PM }

final timeValues =
    EnumValues({"10:00 PM": Time.THE_1000_PM, "12:00AM": Time.THE_1200_AM});

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String url;
  dynamic label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
