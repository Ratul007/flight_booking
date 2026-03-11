import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../typography/app_typography.dart';
import 'custom_bottom_bar_enumeration.dart';
import 'custom_bottom_bar_provider.dart';

class CustomBottomBar extends ConsumerWidget {
  const CustomBottomBar({super.key, this.onChanged});

  final Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomBarIndexProvider);
    final bottomMenuList = ref.watch(bottomMenuListProvider);
    final navigation = ref.read(bottomBarNavigationProvider);

    return SizedBox(
      height: 80.v,
      child: PopScope<bool>(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? result) {
          if (didPop) return;

          final currentRoute = ModalRoute.of(context)?.settings.name;

          if (currentRoute == AppRoutes.splashScreen) {
            SystemNavigator.pop(); // exit app
          } else {
            // Navigate to home and remove all other routes
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.splashScreen,
                  (route) => false,
            );
          }
        },
        child: BottomNavigationBar(
          backgroundColor: AppColors.colorPrimary,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            final isActive = selectedIndex == index;
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    bottomMenuList[index].icon,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    colorFilter: ColorFilter.mode(
                      isActive
                          ? AppColors.colorSecondary
                          : AppColors.colorTaupeGray,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              label: '',
            );
          }),
          onTap: (index) {
            navigation.navigateTo(context, index, onChanged); // Pass context here
          },
        ),
      ),
    );
  }
}
