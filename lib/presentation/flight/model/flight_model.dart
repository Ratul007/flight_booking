// To parse this JSON data, do
//
//     final flightModel = flightModelFromJson(jsonString);

import 'dart:convert';

FlightModel flightModelFromJson(String str) => FlightModel.fromJson(json.decode(str));

String flightModelToJson(FlightModel data) => json.encode(data.toJson());

class FlightModel {
  String status;
  String message;
  Data data;

  FlightModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) => FlightModel(
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
  FlightDetails flightDetails;
  List<Passenger> passengers;
  BookingInfo bookingInfo;

  Data({
    required this.flightDetails,
    required this.passengers,
    required this.bookingInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    flightDetails: FlightDetails.fromJson(json["flight_details"]),
    passengers: List<Passenger>.from(json["passengers"].map((x) => Passenger.fromJson(x))),
    bookingInfo: BookingInfo.fromJson(json["booking_info"]),
  );

  Map<String, dynamic> toJson() => {
    "flight_details": flightDetails.toJson(),
    "passengers": List<dynamic>.from(passengers.map((x) => x.toJson())),
    "booking_info": bookingInfo.toJson(),
  };
}

class BookingInfo {
  int totalPassengers;
  String bookingReference;
  DateTime bookingDate;
  String barcode;

  BookingInfo({
    required this.totalPassengers,
    required this.bookingReference,
    required this.bookingDate,
    required this.barcode,
  });

  factory BookingInfo.fromJson(Map<String, dynamic> json) => BookingInfo(
    totalPassengers: json["total_passengers"],
    bookingReference: json["booking_reference"],
    bookingDate: DateTime.parse(json["booking_date"]),
    barcode: json["barcode"],
  );

  Map<String, dynamic> toJson() => {
    "total_passengers": totalPassengers,
    "booking_reference": bookingReference,
    "booking_date": "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
    "barcode": barcode,
  };
}

class FlightDetails {
  int id;
  String airlineName;
  String airlineLogo;
  String flightId;
  String flightNumber;
  Arrival departure;
  Arrival arrival;
  String duration;
  String aircraftType;
  int stops;
  String terminal;
  String gate;
  String flightDetailsClass;

  FlightDetails({
    required this.id,
    required this.airlineName,
    required this.airlineLogo,
    required this.flightId,
    required this.flightNumber,
    required this.departure,
    required this.arrival,
    required this.duration,
    required this.aircraftType,
    required this.stops,
    required this.terminal,
    required this.gate,
    required this.flightDetailsClass,
  });

  factory FlightDetails.fromJson(Map<String, dynamic> json) => FlightDetails(
    id: json["id"],
    airlineName: json["airline_name"],
    airlineLogo: json["airline_logo"],
    flightId: json["flight_id"],
    flightNumber: json["flight_number"],
    departure: Arrival.fromJson(json["departure"]),
    arrival: Arrival.fromJson(json["arrival"]),
    duration: json["duration"],
    aircraftType: json["aircraft_type"],
    stops: json["stops"],
    terminal: json["terminal"],
    gate: json["gate"],
    flightDetailsClass: json["class"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "airline_name": airlineName,
    "airline_logo": airlineLogo,
    "flight_id": flightId,
    "flight_number": flightNumber,
    "departure": departure.toJson(),
    "arrival": arrival.toJson(),
    "duration": duration,
    "aircraft_type": aircraftType,
    "stops": stops,
    "terminal": terminal,
    "gate": gate,
    "class": flightDetailsClass,
  };
}

class Arrival {
  String time;
  String airportCode;
  String city;

  Arrival({
    required this.time,
    required this.airportCode,
    required this.city,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
    time: json["time"],
    airportCode: json["airport_code"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "airport_code": airportCode,
    "city": city,
  };
}

class Passenger {
  int passengerNumber;
  String title;
  String name;
  String seat;
  String profilePicture;

  Passenger({
    required this.passengerNumber,
    required this.title,
    required this.name,
    required this.seat,
    required this.profilePicture,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
    passengerNumber: json["passenger_number"],
    title: json["title"],
    name: json["name"],
    seat: json["seat"],
    profilePicture: json["profile_picture"],
  );

  Map<String, dynamic> toJson() => {
    "passenger_number": passengerNumber,
    "title": title,
    "name": name,
    "seat": seat,
    "profile_picture": profilePicture,
  };
}
