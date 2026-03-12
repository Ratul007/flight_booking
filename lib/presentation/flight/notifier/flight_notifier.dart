import 'package:flutter_riverpod/flutter_riverpod.dart';
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
}