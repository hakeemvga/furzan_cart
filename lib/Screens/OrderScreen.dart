import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furzan_app/Screens/conformed_screen.dart';
import 'package:furzan_app/Screens/delivered_screen.dart';
import 'package:furzan_app/Screens/new_order_screen.dart';
import 'package:furzan_app/Screens/out_for-delivery.dart';
import 'package:furzan_app/Screens/shipped_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(250.h),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: SizedBox(
              height: 49,
              width: 320,
              child: TextFormField(
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Color(0xffFFC113),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Order Mangement',
                  hintStyle: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffFFC113),
                  ),
                  contentPadding: const EdgeInsets.all(8.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            flexibleSpace: Column(
              children: [
                SizedBox(height: 140.h),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(10.sp),
                        child: Text(
                          "Order Status",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff264050),
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),


              ],
            ),
            bottom: TabBar(
              isScrollable: true,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Color(0xffFFC113)),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: "New Order"),
                Tab(text: "Conformed"),
                Tab(text: "Shipped"),
                Tab(text: "Out of Delivery"),
                Tab(text: "Delivered"),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            NewOrderScreen(),
            ConformedScreen(),
            ShippedScreen(),
            OutForDelivery(),
            DeliveredScreen(),
          ],
        ),
      ),
    );
  }
}
