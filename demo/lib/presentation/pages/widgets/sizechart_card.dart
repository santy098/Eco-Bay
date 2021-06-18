import 'package:assignment/presentation/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class SizeChartCard extends StatelessWidget {
  const SizeChartCard({
    Key? key,
  }) : super(key: key);

  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
    ));
    return Padding(
      padding: EdgeInsets.only(
        top: 15.h,
      ),
      child: Card(
        child: Padding(
            padding: EdgeInsets.only(
              top: 15.h,
              bottom: 15.h,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Expanded(
                      //   flex: 3,
                      //   child: Text(
                      //     "SELECT SIZE",
                      //     style: Apptheme(context).normalText.copyWith(
                      //           fontSize: 15.h,
                      //         ),
                      //   ),
                      // ),
                      // Text(
                      //   " SIZE CHART",
                      //   style: Apptheme(context).boldText.copyWith(
                      //         fontSize: 13.h,
                      //         color: Colors.pink,
                      //       ),
                      // ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      8.0.h,
                    ),
                    child: Row(
                      children: [
                        // for (int i = 0; i < 4; i++)
                        //   Padding(
                        //       padding: EdgeInsets.all(8.h),
                        //       child: InkWell(
                        //         onTap: () {},
                        //         child: CircleAvatar(
                        //           radius: 20.h,
                        //           backgroundColor: Apptheme.secondaryColor,
                        //           child: Text("$i"),
                        //         ),
                        //       ))
                      ],
                    ),
                  ),
                  Padding(
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
                          onPressed: _launchURL,
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
                  )
                ],
              ),
            )),
      ),
    );
  }
}
