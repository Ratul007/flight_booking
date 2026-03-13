// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  String status;
  String message;
  Data data;

  SearchModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  SearchParams searchParams;
  List<Flight> flights;
  Pagination pagination;

  Data({
    required this.searchParams,
    required this.flights,
    required this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    searchParams: SearchParams.fromJson(json["search_params"]),
    flights: List<Flight>.from(json["flights"].map((x) => Flight.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "search_params": searchParams.toJson(),
    "flights": List<dynamic>.from(flights.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class Flight {
  int id;
  String airlineName;
  String airlineLogo;
  String flightNumber;
  Arrival departure;
  Arrival arrival;
  String duration;
  Price price;
  String aircraftType;
  int stops;
  DateTime createdAt;
  DateTime updatedAt;

  Flight({
    required this.id,
    required this.airlineName,
    required this.airlineLogo,
    required this.flightNumber,
    required this.departure,
    required this.arrival,
    required this.duration,
    required this.price,
    required this.aircraftType,
    required this.stops,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
    id: json["id"],
    airlineName: json["airline_name"],
    airlineLogo: json["airline_logo"],
    flightNumber: json["flight_number"],
    departure: Arrival.fromJson(json["departure"]),
    arrival: Arrival.fromJson(json["arrival"]),
    duration: json["duration"],
    price: Price.fromJson(json["price"]),
    aircraftType: json["aircraft_type"],
    stops: json["stops"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "airline_name": airlineName,
    "airline_logo": airlineLogo,
    "flight_number": flightNumber,
    "departure": departure.toJson(),
    "arrival": arrival.toJson(),
    "duration": duration,
    "price": price.toJson(),
    "aircraft_type": aircraftType,
    "stops": stops,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Arrival {
  String time;
  From airportCode;
  City city;

  Arrival({
    required this.time,
    required this.airportCode,
    required this.city,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
    time: json["time"],
    airportCode: fromValues.map[json["airport_code"]]!,
    city: cityValues.map[json["city"]]!,
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "airport_code": fromValues.reverse[airportCode],
    "city": cityValues.reverse[city],
  };
}

enum From {
  CGK,
  NRT
}

final fromValues = EnumValues({
  "CGK": From.CGK,
  "NRT": From.NRT
});

enum City {
  JAKARTA,
  TOKYO
}

final cityValues = EnumValues({
  "Jakarta": City.JAKARTA,
  "Tokyo": City.TOKYO
});

class Price {
  int amount;
  String currency;

  Price({
    required this.amount,
    required this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    amount: json["amount"],
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currency": currency,
  };
}

class Pagination {
  int total;
  int totalPages;
  int currentPage;
  int limit;
  bool hasNextPage;
  bool hasPrevPage;

  Pagination({
    required this.total,
    required this.totalPages,
    required this.currentPage,
    required this.limit,
    required this.hasNextPage,
    required this.hasPrevPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    totalPages: json["totalPages"],
    currentPage: json["currentPage"],
    limit: json["limit"],
    hasNextPage: json["hasNextPage"],
    hasPrevPage: json["hasPrevPage"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "totalPages": totalPages,
    "currentPage": currentPage,
    "limit": limit,
    "hasNextPage": hasNextPage,
    "hasPrevPage": hasPrevPage,
  };
}

class SearchParams {
  From from;
  From to;
  String date;
  int passengers;
  String sortBy;
  Filters filters;

  SearchParams({
    required this.from,
    required this.to,
    required this.date,
    required this.passengers,
    required this.sortBy,
    required this.filters,
  });

  factory SearchParams.fromJson(Map<String, dynamic> json) => SearchParams(
    from: fromValues.map[json["from"]]!,
    to: fromValues.map[json["to"]]!,
    date: json["date"],
    passengers: json["passengers"],
    sortBy: json["sort_by"],
    filters: Filters.fromJson(json["filters"]),
  );

  Map<String, dynamic> toJson() => {
    "from": fromValues.reverse[from],
    "to": fromValues.reverse[to],
    "date": date,
    "passengers": passengers,
    "sort_by": sortBy,
    "filters": filters.toJson(),
  };
}

class Filters {
  String airline;
  int priceMin;
  int priceMax;
  int stops;
  String aircraftType;

  Filters({
    required this.airline,
    required this.priceMin,
    required this.priceMax,
    required this.stops,
    required this.aircraftType,
  });

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
    airline: json["airline"],
    priceMin: json["price_min"],
    priceMax: json["price_max"],
    stops: json["stops"],
    aircraftType: json["aircraft_type"],
  );

  Map<String, dynamic> toJson() => {
    "airline": airline,
    "price_min": priceMin,
    "price_max": priceMax,
    "stops": stops,
    "aircraft_type": aircraftType,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
