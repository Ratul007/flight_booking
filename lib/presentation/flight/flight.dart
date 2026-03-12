import 'package:flight_booking/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/size_utils.dart';
import '../../typography/app_typography.dart';
import '../../widgets/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_ticket_clipper.dart';
import 'notifier/flight_notifier.dart';

class Flight extends ConsumerWidget {
  const Flight({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(flightProvider);
    final notifier = ref.read(flightProvider.notifier);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin:  const Alignment(2.28, -6.12),
                end:  const Alignment(0.1, 0.1),
                colors: [AppColors.colorSecondary, AppColors.colorPrimary]
            ),
          ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60.v),
              Padding(padding: EdgeInsetsGeometry.only(left: 15.h,right: 15.h),child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/images/left_arrows.png",
                      width: 50.h,
                      height: 50.v,
                    ),
                  ),
                  Text(
                    "Flight Result",
                    style: AppTypography.dmSansAccentSemiBold28,
                  ),
                  Image.asset("assets/images/show_more.png",width: 50.h,height: 50.v),
                ],
              )),
              SizedBox(height: 30.v),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:Row(
                  children: [
                    CustomElevatedButton(
                      text: "Lowest to Highest",
                      height: 46.v,
                      width: 210.h,
                      onPressed: () => notifier.selectButton(0),
                      buttonStyle: state.selectedIndex == 0
                          ? CustomButtonStyles.outlineSecondary23
                          : CustomButtonStyles.outlineWhiteSmoke23,
                      buttonTextStyle: state.selectedIndex == 0
                          ? AppTypography.dmSansPrimarySemiBold14
                          : AppTypography.dmSansAccentSemiBold14,
                    ),
                    SizedBox(width: 5.h),
                    CustomElevatedButton(
                      text: "Preferred Airline",
                      height: 46.v,
                      width: 210.h,
                      onPressed: () => notifier.selectButton(1),
                      buttonStyle: state.selectedIndex == 1
                          ? CustomButtonStyles.outlineSecondary23
                          : CustomButtonStyles.outlineWhiteSmoke23,
                      buttonTextStyle: state.selectedIndex == 1
                          ? AppTypography.dmSansPrimarySemiBold14
                          : AppTypography.dmSansAccentSemiBold14,
                    ),
                    SizedBox(width: 5.h),
                    CustomElevatedButton(
                      text: "Upcoming Flight",
                      height: 46.v,
                      width: 210.h,
                      onPressed: () => notifier.selectButton(2),
                      buttonStyle: state.selectedIndex == 2
                          ? CustomButtonStyles.outlineSecondary23
                          : CustomButtonStyles.outlineWhiteSmoke23,
                      buttonTextStyle: state.selectedIndex == 2
                          ? AppTypography.dmSansPrimarySemiBold14
                          : AppTypography.dmSansAccentSemiBold14,
                    ),
                  ],
                )
              ),
              SizedBox(height: 15.v),
              Transform.scale(
                scale: 0.90, // 70% of original size
                child: ClipPath(
                  clipper: CustomTicketClipper(),
                  child: SizedBox(
                    width: 350.h,
                    height: 200.v,
                    child: Card(
                        color: AppColors.colorWhiteSmoke,
                        child: Padding(padding: EdgeInsetsGeometry.all(10),child: Column(
                          children: [
                            Text("Citilink Airline",style: AppTypography.dmSansGreenSemiBold20),
                            SizedBox(height: 10.v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("07:47",style: AppTypography.dmSansSecondarySemiBold16),
                                    Row(children: [
                                      Text("CGK",style: AppTypography.dmSansAccentSemiBold20),
                                      Text("(Jakarta)",style: AppTypography.dmSansTaupeGrayMedium13),
                                    ]),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset("assets/images/airplane.png",height: 30.v,width: 30.h),
                                    Text("7h 15m",style: AppTypography.dmSansAccentSemiBold16),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("14:30",style: AppTypography.dmSansSecondarySemiBold16),
                                    Row(children: [
                                      Text("NRT",style: AppTypography.dmSansAccentSemiBold20),
                                      Text("(Tokyo)",style: AppTypography.dmSansTaupeGrayMedium13),
                                    ]),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16.v),
                            Divider(thickness: 2,indent: 0.h,endIndent: 0.h),
                            SizedBox(height: 5.v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("\$321",style: AppTypography.dmSansSecondarySemiBold16),
                                    Text("/person",style: AppTypography.dmSansGraySemiBold16),
                                  ],
                                ),
                                CustomElevatedButton(
                                  text: "Select Flight",
                                  buttonTextStyle: AppTypography.dmSansPrimarySemiBold14,
                                  buttonStyle: CustomButtonStyles.outlineAccent23,
                                  height: 46.v,
                                  width: 175.h,
                                ),
                              ],
                            )
                          ],
                        ))
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.colorSecondary,
        shape:  CircleBorder(),
        onPressed: () {},
        child:  Icon(
          Icons.filter_alt,
          color: AppColors.colorPrimary,
        ),
      ),
    );
  }
}

