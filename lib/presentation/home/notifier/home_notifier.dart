import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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


}