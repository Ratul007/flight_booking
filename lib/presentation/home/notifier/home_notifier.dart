import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/constants.dart';
import '../../../data/apiclient/api_client.dart';
import '../../../routes/app_routes.dart';
import '../state/home_state.dart';

final homeProvider = AutoDisposeNotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);

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

  Future<void> search(BuildContext context) async {
    /*ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Please enter a valid email',
          style: AppTypography.dmSansPrimaryRegular14,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.colorSecondary,
        behavior: SnackBarBehavior.floating,
      ),
    );*/
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
          print("Success ${response.data}");
          state = state.copyWith(isLoading: false);
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