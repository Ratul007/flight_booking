import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_colors.dart';
import '../../typography/app_typography.dart';
import '../../widgets/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_ticket_clipper.dart';
import '../flight/model/flight_model.dart';

class FlightDetails extends ConsumerWidget {
  const FlightDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final FlightModel flightModel = ModalRoute.of(context)!.settings.arguments as FlightModel;
    final flight = flightModel.data.flightDetails;
    final passengers = flightModel.data.passengers;
    final booking = flightModel.data.bookingInfo;


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
                      "Your flight details",
                      style: AppTypography.dmSansAccentSemiBold28,
                    ),
                    Text(
                      "",
                      style: AppTypography.dmSansAccentSemiBold28,
                    ),                  ],
                )),
                SizedBox(height: 30.v),
                Transform.scale(
                  scale: 0.90, // 70% of original size
                  child: ClipPath(
                    clipper: CustomTicketClipper(),
                    child: SizedBox(
                      width: 400.h,
                      height: 220.v,
                      child: Card(
                          color: AppColors.colorWhiteSmoke,
                          child: Padding(padding: EdgeInsetsGeometry.all(10),child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
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
                                      Text(flight.airlineName,style: AppTypography.dmSansAccentSemiBold20),
                                    ],
                                  ),
                                  Text(flight.flightNumber,style: AppTypography.dmSansTaupeGrayMedium16),
                                ],
                              ),
                              SizedBox(height: 10.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(flight.departure.time,style: AppTypography.dmSansSecondarySemiBold16),
                                      Row(children: [
                                        Text(flight.departure.airportCode,style: AppTypography.dmSansAccentSemiBold20),
                                        Text("(${flight.departure.city})",style: AppTypography.dmSansTaupeGrayMedium13),
                                      ]),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset("assets/images/airplane.png",height: 30.v,width: 30.h),
                                      Text(flight.duration,style: AppTypography.dmSansAccentSemiBold16),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(flight.arrival.time,style: AppTypography.dmSansSecondarySemiBold16),
                                      Row(children: [
                                        Text(flight.arrival.airportCode,style: AppTypography.dmSansAccentSemiBold20),
                                        Text("(${flight.arrival.city})",style: AppTypography.dmSansTaupeGrayMedium13),
                                      ]),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 7.v),
                              Divider(thickness: 2,indent: 0.h,endIndent: 0.h),
                              SizedBox(height: 5.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Terminal",style: AppTypography.dmSansGraySemiBold16),
                                      Text(flight.terminal,style: AppTypography.dmSansAccentSemiBold16),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Gate",style: AppTypography.dmSansGraySemiBold16),
                                      Text(flight.gate,style: AppTypography.dmSansAccentSemiBold16),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Class",style: AppTypography.dmSansGraySemiBold16),
                                      Text(flight.flightDetailsClass,style: AppTypography.dmSansAccentSemiBold16),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ))
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.v),
                /// Passenger Info - scrollable
                Transform.scale(
                  scale: 0.90,
                  child: ClipPath(
                    clipper: CustomTicketClipper(),
                    child: SizedBox(
                      width: 400.h,
                      height: 445.v, // adjust as needed
                      child: Card(
                        color: AppColors.colorWhiteSmoke,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Passenger Info",
                                      style: AppTypography.dmSansAccentSemiBold20),
                                ],
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: passengers.length,
                                  itemBuilder: (context, index) {
                                    final p = passengers[index];
                                    return  Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
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
                                                      key: ValueKey("${p.profilePicture}_${p.passengerNumber}"),
                                                      imageUrl: "${p.profilePicture}?id=${p.passengerNumber}",
                                                      fit: BoxFit.fill,
                                                      width: 50.h,
                                                      height: 50.v,
                                                      placeholder: (context, url) =>
                                                      const CircularProgressIndicator(strokeWidth: 2),
                                                      errorWidget: (context, url, error) =>
                                                      const Icon(Icons.person),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 8.h),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Passenger ${p.passengerNumber}",
                                                        style: AppTypography.dmSansGraySemiBold16),
                                                    Text("${p.title} ${p.name}",
                                                        style: AppTypography.dmSansAccentSemiBold16),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Seat",
                                                    style: AppTypography.dmSansGraySemiBold16),
                                                Text(p.seat,
                                                    style: AppTypography.dmSansAccentSemiBold16),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(thickness: 2,indent: 0.h,endIndent: 0.h),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Divider(thickness: 2,indent: 0.h,endIndent: 0.h),
                              SizedBox(height: 12.v),
                              SvgPicture.string(booking.barcode),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.v),
                CustomElevatedButton(
                  text: "Download & Save pass",
                  buttonTextStyle: AppTypography.dmSansPrimarySemiBold14,
                  buttonStyle: CustomButtonStyles.outlineAccent23,
                  height: 46.v,
                  width: 297.h,
                  onPressed: () {},
                ),
                SizedBox(height: 50.v),
              ],
            ),
          )
      ),
    );
  }
}