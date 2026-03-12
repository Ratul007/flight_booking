import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/constants.dart';
import '../../../data/apiclient/api_client.dart';
import '../../../routes/app_routes.dart';
import '../state/flight_state.dart';

final flightProvider =
NotifierProvider<FlightNotifier, FlightState>(FlightNotifier.new);

class FlightNotifier extends Notifier<FlightState> {

  @override
  FlightState build() {
    return FlightState();
  }

  void selectButton(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  Future<void> getFlight(BuildContext context) async {
    final apiRequest = ApiRequest(
      url: "${Constant.baseUrl}flight_api.php/flight",
      frmData:{
        "id": 4
      }
    );
    await apiRequest.post(
      beforeSend: () {},
      onSuccess: (response) async {
        if (response.statusCode == 200) {
          print("Success ${response.data}");
          Navigator.pushNamed(context, AppRoutes.flightDetails);
        }
      },
      onError: (error) {
        print("Exception: $error");
      },
    );
  }

}