import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../routes/app_routes.dart';
import 'custom_bottom_bar_enumeration.dart';
import 'custom_bottom_bar_model.dart';

final bottomBarIndexProvider = StateProvider<int>((ref) => 0);

final bottomMenuListProvider = Provider<List<CustomBottomBarModel>>((ref) {
  return [
    CustomBottomBarModel(
      icon: 'assets/images/home.svg',
      type: BottomBarEnum.home,
    ),
    CustomBottomBarModel(
      icon: 'assets/images/flight.svg',
      type: BottomBarEnum.flight,
    ),
    CustomBottomBarModel(
      icon: 'assets/images/map.svg',
      type: BottomBarEnum.map,
    ),
    CustomBottomBarModel(
      icon: 'assets/images/person.svg',
      type: BottomBarEnum.profile,
    ),
  ];
});

final bottomBarNavigationProvider = Provider<BottomBarNavigationProvider>((ref) {
  return BottomBarNavigationProvider(ref);
});

class BottomBarNavigationProvider {
  final Ref ref;

  BottomBarNavigationProvider(this.ref);

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.home:
        return AppRoutes.home;
      case BottomBarEnum.flight:
        return AppRoutes.home;
      case BottomBarEnum.map:
        return AppRoutes.home;
      case BottomBarEnum.profile:
        return AppRoutes.home; // You should create a profile route
    }
  }

  void navigateTo(BuildContext context, int index, Function(BottomBarEnum)? onChanged) {
    final menuList = ref.read(bottomMenuListProvider);
    if (index >= 0 && index < menuList.length) {
      final type = menuList[index].type;
      final route = getCurrentRoute(type);

      // Update the selected index
      ref.read(bottomBarIndexProvider.notifier).state = index;

      // Perform navigation using the passed context
      Navigator.of(context).pushNamedAndRemoveUntil(
        route,
            (route) => false, // Remove all previous routes
      );

      // Call the callback
      onChanged?.call(type);
    }
  }
}