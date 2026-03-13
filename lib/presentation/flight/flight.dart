import 'package:cached_network_image/cached_network_image.dart';
import 'package:flight_booking/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/size_utils.dart';
import '../../typography/app_typography.dart';
import '../../widgets/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_ticket_clipper.dart';
import '../home/notifier/home_notifier.dart';
import 'notifier/flight_notifier.dart';

class Flight extends ConsumerWidget {
  const Flight({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(flightProvider);
    final notifier = ref.read(flightProvider.notifier);
    final searchResult = ref.watch(searchResultProvider);
    if (searchResult == null || searchResult.data.flights.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("No flights found.")),
      );
    }
    final flights = searchResult.data.flights;


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
            Expanded(child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
              shrinkWrap: true,
              itemCount: flights.length,
              itemBuilder: (context, index) {
                final flight = flights[index];
                return Transform.scale(
                  scale: 0.90,
                  child: ClipPath(
                    clipper: CustomTicketClipper(),
                    child: SizedBox(
                      width: 400.h,
                      height: 230.v,
                      child: Card(
                        color: AppColors.colorWhiteSmoke,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50.v,
                                      width: 50.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.colorPrimary,
                                          width: 2,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl: flight.airlineLogo,
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) =>
                                          const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                                          errorWidget: (context, url, error) =>
                                          const Icon(Icons.flight),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.h),
                                    Text(
                                      flight.airlineName,
                                      style: AppTypography.dmSansAccentSemiBold20,
                                    ),
                                  ],
                                )
                              ),
                              SizedBox(height: 10.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(flight.departure.time,
                                          style: AppTypography.dmSansSecondarySemiBold16),
                                      Row(
                                        children: [
                                          Text(
                                              flight.departure.airportCode
                                                  .name, // enum From value
                                              style: AppTypography.dmSansAccentSemiBold20),
                                          Text(
                                              "(${flight.departure.city.name})",
                                              style: AppTypography.dmSansTaupeGrayMedium13),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset("assets/images/airplane.png",
                                          height: 30.v, width: 30.h),
                                      Text(flight.duration,
                                          style: AppTypography.dmSansAccentSemiBold16),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(flight.arrival.time,
                                          style: AppTypography.dmSansSecondarySemiBold16),
                                      Row(
                                        children: [
                                          Text(flight.arrival.airportCode.name,
                                              style: AppTypography.dmSansAccentSemiBold20),
                                          Text(
                                              "(${flight.arrival.city.name})",
                                              style: AppTypography.dmSansTaupeGrayMedium13),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 25.v),
                              Divider(thickness: 2, indent: 0, endIndent: 0),
                              SizedBox(height: 5.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("\$${flight.price.amount}",
                                          style: AppTypography.dmSansSecondarySemiBold16),
                                      Text("/person",
                                          style: AppTypography.dmSansGraySemiBold16),
                                    ],
                                  ),
                                  CustomElevatedButton(
                                    onPressed: () {
                                      notifier.getFlight(context,flight);
                                    },
                                    text: "Select Flight",
                                    buttonTextStyle:
                                    AppTypography.dmSansPrimarySemiBold14,
                                    buttonStyle: CustomButtonStyles.outlineAccent23,
                                    height: 46.v,
                                    width: 175.h,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
            SizedBox(height: 50.v),
          ],
        ),
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

