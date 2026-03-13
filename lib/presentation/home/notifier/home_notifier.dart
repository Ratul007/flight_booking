import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/constants.dart';
import '../../../data/apiclient/api_client.dart';
import '../../../routes/app_routes.dart';
import '../model/search_model.dart';
import '../state/home_state.dart';

final homeProvider = AutoDisposeNotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);
final searchResultProvider = StateProvider<SearchModel?>((ref) => null);
final flightsProvider = StateProvider<List<Flight>>((ref) => []);

class HomeNotifier extends AutoDisposeNotifier<HomeState> {

  final TextEditingController departureController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  @override
  HomeState build() {
    return HomeState.initial();
  }

  void pickDepartureDate(BuildContext context) async {

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {

      state = state.copyWith(departureDate: pickedDate);

      departureController.text =
      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }

  void setPeople(int count) {

    state = state.copyWith(peopleCount: count);

    amountController.text = "$count ${count > 1 ? "People" : "Person"}";
  }

  void pickPeople(BuildContext context) async {

    final result = await showMenu<int>(
      context: context,
      position: RelativeRect.fromLTRB(100, 300, 0, 0),
      items: List.generate(
        6,
            (index) => PopupMenuItem(
          value: index + 1,
          child: Text("${index + 1} ${index == 0 ? "Person" : "People"}"),
        ),
      ),
    );

    if (result != null) {
      setPeople(result);
    }
  }

  Future<void> search(BuildContext context, WidgetRef ref) async {
    state = state.copyWith(isLoading: true);

    final apiRequest = ApiRequest(
      url: "${Constant.baseUrl}flight_api.php/search",
      frmData: {
        "from": "CGK",
        "to": "NRT",
        "passengers": 1,
        "sort_by": "price_asc",
        "filters": {
          "airline": "",
          "price_min": 0,
          "price_max": 0,
          "stops": 0,
          "aircraft_type": ""
        }
      },
    );
    await apiRequest.post(
      beforeSend: () {},
      onSuccess: (response) async {
        if (response.statusCode == 200) {
          final Map<String, dynamic> data = response.data is String
              ? jsonDecode(response.data)
              : response.data;
          final searchModel = SearchModel.fromJson(data);
          ref.read(searchResultProvider.notifier).state = searchModel;
          state = state.copyWith(isLoading: false);
          if (searchModel.data.flights.isNotEmpty) {
            print("Airline Name : ${searchModel.data.flights.first.airlineName}");
          }
          Navigator.pushNamed(context, AppRoutes.flight);
        }
      },
      onError: (error) {
        print("Exception: $error");
        state = state.copyWith(isLoading: false);
      },
    );
  }

}