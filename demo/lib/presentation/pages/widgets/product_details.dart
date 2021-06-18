import 'package:assignment/infrastructure/shopdata/data_entity.dart';
import 'package:assignment/presentation/pages/widgets/sizechart_card.dart';
import 'package:assignment/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.shopData,
  }) : super(key: key);

  _launchURL(productUrl) async {
    // const url = 'https://flutter.io';
    var url = Uri.encodeFull(productUrl);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final Datum shopData;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
    ));
    return Padding(
      padding: EdgeInsets.all(
        15.h,
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(right: 10.h),
            //       child: Text("Eco - Score: ",
            //           style: Apptheme(context).boldText.copyWith(
            //                 fontSize: 15.h,
            //               )),
            //     ),
            //     new CircularPercentIndicator(
            //       radius: 60.0,
            //       lineWidth: 5.0,
            //       percent: shopData.longDesc!.ecoRating!,
            //       center: new Text(
            //           (shopData.longDesc!.ecoRating! * 100).toString()),
            //       progressColor: shopData.longDesc!.ecoRating! >= 0.7
            //           ? Colors.green
            //           : shopData.longDesc!.ecoRating! >= 0.4
            //               ? Colors.orange
            //               : Colors.red,
            //     )
            //   ],
            // ),
            Padding(
              padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    Text("Eco - Friendly",
                        style: Apptheme(context).boldText.copyWith(
                              fontSize: 15.h,
                            )),
                    Padding(
                        padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                        // child: new CircularPercentIndicator(
                        //   radius: 60.0,
                        //   lineWidth: 5.0,
                        //   percent: shopData.longDesc!.ecoRating!,
                        //   center: new Text(
                        //     (shopData.longDesc!.ecoRating! * 100).toString(),
                        //     style: Apptheme(context).appText.copyWith(
                        //           fontSize: 15.h,
                        //         ),
                        //   ),
                        //   progressColor: shopData.longDesc!.ecoRating! >= 0.7
                        //       ? Colors.green
                        //       : shopData.longDesc!.ecoRating! >= 0.4
                        //           ? Colors.orange
                        //           : Colors.red,
                        // ),
                        child: Padding(
                            padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                            child: shopData.longDesc!.ecoRating!
                                ? Icon(Icons.eco_outlined,
                                    size: 30.h, color: Colors.green)
                                : Icon(Icons.cancel,
                                    size: 30.h, color: Colors.red))),
                  ]),
                  Column(
                    children: [
                      Text("Recycle Number",
                          style: Apptheme(context).boldText.copyWith(
                                fontSize: 15.h,
                              )),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                        child: Text(shopData.longDesc!.recycleScore!.toString(),
                            style: Apptheme(context).appText.copyWith(
                                  fontSize: 35.h,
                                )),
                      )
                    ],
                  ),

                  // Padding(
                  //   padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                  //   child: Text(
                  //       "Recycle Number: " +
                  //           shopData.longDesc!.recycleScore!.toString(),
                  //       style: Apptheme(context).boldText.copyWith(
                  //             fontSize: 15.h,
                  //           )),
                  // ),
                ],
              ),
            ),

            Text("Product Details",
                style: Apptheme(context).boldText.copyWith(
                      fontSize: 13.h,
                    )),
            Padding(
              padding: EdgeInsets.only(top: 8.0.h),
              child: Text(shopData.longDesc!.details![0].productDetails!),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Text("Size & Fit ",
                  style: Apptheme(context).boldText.copyWith(
                        fontSize: 13.h,
                      )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0.h),
              child: Text(shopData.longDesc!.details![1].sizeFit!),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Text("Material & Care",
                  style: Apptheme(context).boldText.copyWith(
                        fontSize: 13.h,
                      )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0.h),
              child: Text(shopData.longDesc!.details![2].materialCare!),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Text("Style Note",
                  style: Apptheme(context).boldText.copyWith(
                        fontSize: 13.h,
                      )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0.h),
              child: Text(shopData.longDesc!.details![3].styleNote!),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0.h),
              child: Padding(
                padding: EdgeInsets.all(
                  8.0.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green,
                        ),
                      ),
                      onPressed: () {
                        _launchURL(shopData.longDesc!.productLink!);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 10.h,
                          bottom: 10.h,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_bag,
                            ),
                            Text(
                              "  BUY NOW",
                              style: Apptheme(context).normalText.copyWith(
                                    fontSize: 15.sp,
                                  ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
