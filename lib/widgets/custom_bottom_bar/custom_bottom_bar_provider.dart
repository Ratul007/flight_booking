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
      title: "Home",
      type: BottomBarEnum.home,
    ),
    CustomBottomBarModel(
      icon: 'assets/images/course.svg',
      title: "Course",
      type: BottomBarEnum.course,
    ),
    CustomBottomBarModel(
      icon: 'assets/images/profile.svg',
      title: "Profile",
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
        return AppRoutes.splashScreen;
      case BottomBarEnum.course:
        return AppRoutes.splashScreen;
      case BottomBarEnum.profile:
        return AppRoutes.splashScreen; // You should create a profile route
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