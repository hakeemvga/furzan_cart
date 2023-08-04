import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

List<String> crouselList = [
  'assets/sliderimg1.png',
  'assets/sliderimg2.png',
];

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 44.h),
            Text(
              "Hi,Hitech Mobiles",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xffFFC113),
              ),
            ),
            SizedBox(height: 35.h),
            CarouselSlider.builder(
              itemCount: crouselList.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return SizedBox(
                  height: 204.h,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.sp),
                      child: Image.asset(
                        crouselList[itemIndex],
                        fit: BoxFit.cover,
                      )),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                height: 150,
                //aspectRatio: 16/9,
                viewportFraction: 1,
              ),
            ),
            SizedBox(height: 26.h),
            Text("Categories",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff264050))),
            SizedBox(height: 20.h),
            SizedBox(
              height: 130,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 16.w);
                },
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 116.h,
                        width: 116.w,
                        child: Image.asset("assets/phoneimg.png"),
                      ),
                      Text(
                        "Smart phones",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff264050),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 60.h),
            Text("Categories",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff264050))),
            SizedBox(height: 17.h),
            Container(
              height: 203.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: Color(0xffF5F5F5)),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 11.w);
                },
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 203.h,
                    width: 145.w,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 87.h,
                          width: 87.w,
                          child: Image.asset("assets/washingmachine.png"),
                        ),
                        SizedBox(height: 9.h),
                        Text(
                          "Whirpool washing\nMachine",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff264050),
                          ),
                        ),
                        SizedBox(height: 9.h),
                        Row(
                          children: [
                            SizedBox(
                              height: 12.h,
                              width: 64.w,
                              child: Image.asset("assets/star.png"),
                            ),
                            Text("4.9",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff264050),
                                )),
                          ],
                        ),
                        SizedBox(height: 9.h),
                        Container(
                          height: 35.h,
                          width: 145.w,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Color(0xffFFC113),
                          ),
                          child: Center(
                            child: Text(
                              "250 SAR",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
