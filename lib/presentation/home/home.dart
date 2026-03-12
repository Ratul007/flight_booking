import 'package:flight_booking/typography/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_colors.dart';
import '../../widgets/custom_bottom_bar/custom_bottom_bar.dart';
import '../../widgets/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_ticket_clipper.dart';
import 'notifier/home_notifier.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final notifier = ref.read(homeProvider.notifier);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: SizeUtils.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.colorSecondary, AppColors.colorPrimary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.2, // 20% position for colorPrimary
              0.4, // 80% position for colorFireEngineRed
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 15.h, right: 15.h),
          child: SingleChildScrollView(child: Column(
            children: [
              SizedBox(height: 60.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Plan Your Trip",
                    style: AppTypography.dmSansPrimarySemiBold28,
                  ),
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
                ],
              ),
              SizedBox(height: 30.v),
              SizedBox(
                height: 300.v,
                width: 350.h,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side:  BorderSide(
                      color: AppColors.colorSecondary, // black border
                      width: 0.1,
                    ),
                  ),
                  color: AppColors.colorWhiteSmoke.withAlpha(130),
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(25),
                    child: Column(children: [
                      TextFormField(
                        controller: notifier.fromController,
                        style: AppTypography.dmSansAccentSemiBold14,
                        decoration: InputDecoration(
                          labelText: "From",
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.colorTaupeGray),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.colorTaupeGray),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.v),
                      TextFormField(
                        controller: notifier.toController,
                        style: AppTypography.dmSansAccentSemiBold14,
                        decoration: InputDecoration(
                          labelText: "To",
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.colorTaupeGray),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.colorTaupeGray),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.v),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 142.h,
                            child: TextFormField(
                              style: AppTypography.dmSansAccentSemiBold14,
                              controller: notifier.departureController,
                              readOnly: true,
                              onTap: () => notifier.pickDepartureDate(context),
                              decoration: InputDecoration(
                                labelText: "Departure",
                                border:  UnderlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon:  Icon(Icons.calendar_month,size: 20,),
                                  onPressed: () =>
                                      notifier.pickDepartureDate(context),
                                ),
                                enabledBorder:
                                UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.colorTaupeGray,
                                  ),
                                ),
                                focusedBorder:
                                UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.colorTaupeGray,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 142.h,
                            child: TextFormField(
                              style: AppTypography.dmSansAccentSemiBold14,
                              controller: notifier.amountController,
                              readOnly: true,
                              onTap: () => notifier.pickPeople(context),
                              decoration:  InputDecoration(
                                labelText: "Amount",
                                border: UnderlineInputBorder(),
                                suffixIcon: Icon(Icons.keyboard_arrow_down,size: 30,),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30.v),
                      CustomElevatedButton(
                        text: "Search flights",
                        buttonTextStyle: AppTypography.dmSansPrimarySemiBold14,
                        buttonStyle: CustomButtonStyles.outlineAccent23,
                        height: 46.v,
                        width: 297.h,
                        onPressed: () {
                        },
                      )
                    ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saved trips",
                    style: AppTypography.dmSansAccentSemiBold24,
                  ),
                  Text(
                    "See more",
                    style: AppTypography.dmSansAccentSemiBold14,
                  ),
                ],
              ),
              SizedBox(height: 15.v,),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child:  Row(
                 children: [
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
                                 Text("Citilink",style: AppTypography.dmSansGreenSemiBold20),
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
                                     SizedBox(width: 1.h),
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
                                         Text("Date",style: AppTypography.dmSansGraySemiBold16),
                                         Text("Jan 20, 2025",style: AppTypography.dmSansAccentSemiBold16),
                                       ],
                                     ),
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text("Date",style: AppTypography.dmSansGraySemiBold16),
                                         Text("Jan 20, 2025",style: AppTypography.dmSansAccentSemiBold16),
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
                                 Text("Citilink",style: AppTypography.dmSansGreenSemiBold20),
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
                                     SizedBox(width: 1.h),
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
                                         Text("Date",style: AppTypography.dmSansGraySemiBold16),
                                         Text("Jan 20, 2025",style: AppTypography.dmSansAccentSemiBold16),
                                       ],
                                     ),
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text("Date",style: AppTypography.dmSansGraySemiBold16),
                                         Text("Jan 20, 2025",style: AppTypography.dmSansAccentSemiBold16),
                                       ],
                                     ),
                                   ],
                                 )
                               ],
                             ))
                         ),
                       ),
                     ),
                   )
                 ],
               ),
             )
            ],
          )),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        onChanged: (type) {
          print('Navigating to: $type');
        },
      ),
    );
  }
}

