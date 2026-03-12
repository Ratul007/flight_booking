import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_colors.dart';
import '../../typography/app_typography.dart';
import '../../widgets/custom_ticket_clipper.dart';

class FlightDetails extends ConsumerWidget {
  const FlightDetails({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      height: 200.v,
                      child: Card(
                          color: AppColors.colorWhiteSmoke,
                          child: Padding(padding: EdgeInsetsGeometry.all(10),child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Citilink Airline",style: AppTypography.dmSansAccentSemiBold20),
                                  Text("ID3242113",style: AppTypography.dmSansTaupeGrayMedium16),
                                ],
                              ),
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
                                      Text("Terminal",style: AppTypography.dmSansGraySemiBold16),
                                      Text("2A",style: AppTypography.dmSansAccentSemiBold16),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Gate",style: AppTypography.dmSansGraySemiBold16),
                                      Text("19",style: AppTypography.dmSansAccentSemiBold16),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Class",style: AppTypography.dmSansGraySemiBold16),
                                      Text("Economy",style: AppTypography.dmSansAccentSemiBold16),
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
                Transform.scale(
                  scale: 0.90, // 70% of original size
                  child: ClipPath(
                    clipper: CustomTicketClipper(),
                    child: SizedBox(
                      width: 400.h,
                      height: 300.v,
                      child: Card(
                          color: AppColors.colorWhiteSmoke,
                          child: Padding(padding: EdgeInsetsGeometry.all(10),child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Passenger Info",style: AppTypography.dmSansAccentSemiBold20),
                                  Text("",style: AppTypography.dmSansTaupeGrayMedium16),
                                ],
                              ),
                              SizedBox(height: 10.v),
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
                                            color: AppColors.colorPrimary, // border color
                                            width: 2, // border width
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage("assets/images/profile_picture.jpg"),
                                        ),
                                      ),
                                      SizedBox(width: 8.h),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Passenger 1",style: AppTypography.dmSansGraySemiBold16),
                                          Text("Mr.Budiari Rohman",style: AppTypography.dmSansAccentSemiBold16),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Seat",style: AppTypography.dmSansGraySemiBold16),
                                      Text("3A",style: AppTypography.dmSansAccentSemiBold16),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(thickness: 2,indent: 0.h,endIndent: 0.h),
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
                                            color: AppColors.colorPrimary, // border color
                                            width: 2, // border width
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage("assets/images/profile_picture.jpg"),
                                        ),
                                      ),
                                      SizedBox(width: 8.h),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Passenger 1",style: AppTypography.dmSansGraySemiBold16),
                                          Text("Mr.Budiari Rohman",style: AppTypography.dmSansAccentSemiBold16),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Seat",style: AppTypography.dmSansGraySemiBold16),
                                      Text("3A",style: AppTypography.dmSansAccentSemiBold16),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.v),
                              Divider(thickness: 2,indent: 0.h,endIndent: 0.h),
                              SizedBox(height:10.v),
                              Image.asset("assets/images/bar_code.png",height: 80.v,)
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
    );
  }
}

