class FlightState {
  final int selectedIndex;

  FlightState({this.selectedIndex = 0});

  FlightState copyWith({int? selectedIndex}) {
    return FlightState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}