import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConformedScreen extends StatefulWidget {
  const ConformedScreen({Key? key}) : super(key: key);

  @override
  State<ConformedScreen> createState() => _ConformedScreenState();
}

class _ConformedScreenState extends State<ConformedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(8..sp),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 140.h,
              color: Colors.white,
              child: ListTile(
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.all(0),
                title: Row(
                  children: [
                    Container(
                      width: 140.w,
                      //color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 144.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30.sp),
                              ),
                              color: const Color(0xfffff400),
                            ),
                            child: Center(
                              child: Text(
                                "Express Delivery",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 14.h),
                          Container(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 56.h,
                                width: 60.w,
                                child: Image.asset("assets/washingmachine.png"),
                              )),
                          Container(
                            alignment: Alignment.center,
                            child: Text("Whirpool washing\nMachine",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff264050),
                                )),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text("         Order Time  :",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                )),
                            Text(" 11:00 Pm",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFFC113))),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Total Amount :",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                )),
                            Text("250 SAR",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFFC113))),
                          ],
                        ),
                        Row(
                          children: [
                            Text("       Delivered Before  :",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                )),
                            Text(" 21 Jan 2023",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFFC113))),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          width: 138.w,
                          height: 33.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.sp),
                            color: Color(0xffFFC113),
                          ),
                          child: Center(
                            child: Text("Move to shipped",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        width: 50.w,
                        alignment: Alignment.topRight,
                        child: const Icon(
                          Icons.more_vert,
                          color: Color(0xffD9D9D9),
                        ))
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 18.h);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
