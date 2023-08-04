
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DeliveredScreen extends StatefulWidget {
  const DeliveredScreen({Key? key}) : super(key: key);

  @override
  State<DeliveredScreen> createState() => _DeliveredScreenState();
}

class _DeliveredScreenState extends State<DeliveredScreen> {
  String chooseDate = "";
  String chooseEndDate = '';
  List dropdownListItem = ["Oldest to Newest", "Newest to Oldest"];

  final dateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  // DateTime selectedDate = DateTime.now();
  // String fromDate="";

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: ,
//         firstDate: DateTime(2015),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != fromDate) {
// return
//       setState(() {
//
//         fromDate = picked.toString();
//
//         print(fromDate);
//       });
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 17.h),
          Padding(
            padding: EdgeInsets.only(right: 19.w),
            child: InkWell(
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context,
                          void Function(void Function()) setState) {
                        return Container(
                          height: 301.h,
                          width: 430.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.sp),
                              topLeft: Radius.circular(20.sp),
                            ),
                            //color: Colors.purple
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 40.h, left: 40.w, right: 40.w),
                                child: Row(
                                  children: [
                                    Text("Sort by Date",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff264050))),
                                    SizedBox(width: 50.w),
                                    Container(
                                      width: 176.w,
                                      height: 50.h,
                                      padding: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff0fff400)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white),
                                      child: Center(
                                        child: DropdownButtonHideUnderline(
                                          child:
                                              DropdownButtonFormField<String>(
                                            icon: Icon(Icons.arrow_forward_ios),
                                            decoration:
                                                InputDecoration.collapsed(
                                                    hintText: ''),
                                            hint: Text("Choose type..."),
                                            onChanged: (value) {
                                              print(value);
                                              setState(() {});
                                            },
                                            items: dropdownListItem.map(
                                              (e) {
                                                return DropdownMenuItem<String>(
                                                  value: e,
                                                  child: Text(e),
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 45.h),
                              Padding(
                                padding: EdgeInsets.only(left: 40.w, top: 0),
                                child: Row(
                                  children: [
                                    Text("Start Date",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff264050))),
                                    SizedBox(width: 50.w),
                                    Stack(
                                      children: [
                                        Container(
                                          width: 150.w,
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xffffc113))),
                                          //color: Colors.pink,
                                          child: Center(
                                            child: InkWell(
                                              onTap: () async {
                                                var date = await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050));
                                                if (date != null) {
                                                  setState(() {
                                                    chooseDate = DateFormat(
                                                            'dd   -   MM   -   yyyy')
                                                        .format(date);
                                                    print(chooseDate);
                                                  });
                                                }
                                              },
                                              child: chooseDate.isEmpty
                                                  ? Text("Choose your Date")
                                                  : Text(chooseDate),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            left: 0,
                                            child: Container(
                                                height: 40.h,
                                                width: 5,
                                                color: Colors.white)),
                                        Positioned(
                                            left: 45,
                                            child: Container(
                                                height: 40.h,
                                                width: 5,
                                                color: Colors.white)),
                                        Positioned(
                                            left: 70,
                                            child: Container(
                                                height: 40.h,
                                                width: 5,
                                                color: Colors.white)),
                                        Positioned(
                                            right: 0,
                                            child: Container(
                                                height: 40.h,
                                                width: 20,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Padding(
                                padding: EdgeInsets.only(left: 40.w, top: 0),
                                child: Row(
                                  children: [
                                    Text("  End Date",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff264050))),
                                    SizedBox(width: 50.w),
                                    Stack(
                                      children: [
                                        Container(
                                          width: 150.w,
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xffffc113))),
                                          //color: Colors.pink,
                                          child: Center(
                                            child: InkWell(
                                              onTap: () async {
                                                var date = await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050));
                                                if (date != null) {
                                                  setState(() {
                                                    chooseEndDate = DateFormat(
                                                            'dd   -   MM   -   yyyy')
                                                        .format(date);
                                                    print(chooseEndDate);
                                                  });
                                                }
                                              },
                                              child: chooseEndDate.isEmpty
                                                  ? Text("Choose your Date")
                                                  : Text(chooseEndDate),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            left: 0,
                                            child: Container(
                                                height: 40.h,
                                                width: 5,
                                                color: Colors.white)),
                                        Positioned(
                                            left: 45,
                                            child: Container(
                                                height: 40.h,
                                                width: 5,
                                                color: Colors.white)),
                                        Positioned(
                                            left: 70,
                                            child: Container(
                                                height: 40.h,
                                                width: 5,
                                                color: Colors.white)),
                                        Positioned(
                                            right: 0,
                                            child: Container(
                                                height: 40.h,
                                                width: 20,
                                                color: Colors.white)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  width: 106,
                                  height: 43,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xffffc113)),
                                  child: Center(
                                    child: Text("APPLY",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Container(
                alignment: Alignment.topRight,
                child: Container(
                  width: 161,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color(0xff264050),
                  ),
                  child: Center(
                    child: Text("Sort and Filter",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 22.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8..sp),
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
                                      child: Image.asset(
                                          "assets/washingmachine.png"),
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
                                width: 208.w,
                                height: 39.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.sp),
                                  color: const Color(0xffFFC113),
                                ),
                                child: Center(
                                  child: Text("Delivered On :  21 jan 2023",
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
          ),
        ],
      ),
    );
  }
}
