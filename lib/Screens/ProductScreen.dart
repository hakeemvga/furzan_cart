import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furzan_app/bloc/ProductBloc/product_bloc.dart';
import 'package:furzan_app/repository/model_class/ProductModel.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

List<bool> isEnabled = [];

class _ProductScreenState extends State<ProductScreen> {
  List<String> mylist = [
    "assets/washingmachine.png",
    "assets/washingmachine.png",
    "assets/washingmachine.png",
    "assets/washingmachine.png",
    "assets/washingmachine.png",
    "assets/washingmachine.png",
    "assets/washingmachine.png",
    "assets/washingmachine.png",
    "assets/washingmachine.png",
    "assets/washingmachine.png",
    "assets/washingmachine.png",
  ];

  late List<ProductModel> products;

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(FetchProduct());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 200) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            width: double.infinity,
          ),
          SizedBox(
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
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Product Shelf',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(
                        child: CircularProgressIndicator(strokeWidth: 1));
                  }
                  if (state is ProductError) {
                    return const Center(
                        child: Text("oops somthing went wrong"));
                  }
                  if (state is ProductLoaded) {
                    products =
                        BlocProvider.of<ProductBloc>(context).productModel;
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        childAspectRatio: (itemWidth / itemHeight),
                      ),
                      itemBuilder: (_, index) {
                        for (int i = 0; i < mylist.length; i++) {
                          isEnabled.add(true);
                        }

                        return Container(
                          height: 312.h,
                          width: 190.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp)),
                          //color: isEnabled[index]==false?Colors.white:Colors.grey,
                          child: Column(
                            children: [
                              SwitchListTile(
                                  activeColor: isEnabled[index] == false
                                      ? Colors.grey
                                      : Colors.green,
                                  title: isEnabled[index] == true
                                      ? Text(
                                          "Enable",
                                          style: TextStyle(color: Colors.green),
                                        )
                                      : Text("Disable",
                                          style: TextStyle(color: Colors.grey)),
                                  value: isEnabled[index],
                                  onChanged: (
                                    bool value,
                                  ) {
                                    setState(() {
                                      isEnabled[index] = value;
                                    });
                                  }),
                              //SizedBox(height: 30.h),
                              SizedBox(
                                height: 87.h,
                                width: 87.w,
                                child: Opacity(
                                  opacity: isEnabled[index] == true ? 1 : 0.25,
                                  child:Image.network("${products[index].images![0].url}")
                                ),
                              ),
                              SizedBox(height: 9.h),
                              Text(
                                products[index].name.toString(),textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: isEnabled[index] == true
                                      ? Color(0xff264050)
                                      : Colors.grey,
                                ),
                              ),
                              SizedBox(height: 9.h),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 12.h,
                                    width: 64.w,
                                    child: Opacity(
                                        opacity:
                                            isEnabled[index] == true ? 1 : 0.25,
                                        child: RatingBar.builder(
                                          initialRating: double.parse(products[index].rating.toString()),
                                          minRating: 5,
                                          direction: Axis.vertical,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 10,
                                          // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        )),
                                  ),
                                  Text(products[index].rating.toString(),
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: isEnabled[index] == true
                                            ? Color(0xff264050)
                                            : Colors.grey,
                                      )),
                                ],
                              ),
                              SizedBox(height: 9.h),
                              Container(
                                height: 33.h,
                                width: 190.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: isEnabled[index] == true
                                      ? Color(0xffFFC113)
                                      : Colors.grey,
                                ),
                                child: Center(
                                  child: Text(
                                    products[index].price.toString(),
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: isEnabled[index] == true
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: products.length,
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
