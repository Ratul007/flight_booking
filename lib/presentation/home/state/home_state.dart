class HomeState {
  final bool isLoading;
  final String? error;
  final DateTime? departureDate;
  final int peopleCount;

  HomeState({
    this.isLoading = false,
    this.error,
    this.departureDate,
    this.peopleCount = 1,
  });

  HomeState copyWith({
    bool? isLoading,
    String? error,
    DateTime? departureDate,
    int? peopleCount,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      departureDate: departureDate ?? this.departureDate,
      peopleCount: peopleCount ?? this.peopleCount,
    );
  }

  factory HomeState.initial() => HomeState();
}