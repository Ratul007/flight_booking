import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/constants.dart';
import '../../../data/apiclient/api_client.dart';
import '../../../routes/app_routes.dart';
import '../../home/model/search_model.dart';
import '../model/flight_model.dart';
import '../state/flight_state.dart';

final flightProvider = NotifierProvider<FlightNotifier, FlightState>(FlightNotifier.new);

class FlightNotifier extends Notifier<FlightState> {

  @override
  FlightState build() {
    return FlightState();
  }

  void selectButton(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  Future<void> getFlight(BuildContext context,Flight flight) async {
    final apiRequest = ApiRequest(
      url: "${Constant.baseUrl}flight_api.php/flight",
      frmData:{
        "id": flight.id
      }
    );
    await apiRequest.post(
      beforeSend: () {},
      onSuccess: (response) async {
        if (response.statusCode == 200) {
          final flightModel = flightModelFromJson(jsonEncode(response.data));
          print("FlightModel fetched successfully");
          Navigator.pushNamed(
            context,
            AppRoutes.flightDetails,
            arguments: flightModel,
          );
        }
      },
      onError: (error) {
        print("Exception: $error");
      },
    );
  }

}