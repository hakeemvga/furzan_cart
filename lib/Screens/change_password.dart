import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furzan_app/bloc/PasswordBloc/password_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

TextEditingController newPasswordController = TextEditingController();
TextEditingController currentPasswordController = TextEditingController();
TextEditingController conformePasswordController = TextEditingController();

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

bool isShowCurretPassword=false;
bool isShowNewPassword=false;
bool isShowConfirmPassword=false;

String? name;
String? wallet;
String? refferalCode;

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  getData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString("Username").toString();
      final String? wallet = pref.getString("WalletBalance").toString();
      final String? refferalCode = pref.getString("RefferalCode").toString();
    });
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    currentPasswordController.clear();
    newPasswordController.clear();
    conformePasswordController.clear();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.sp),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 28.h, width: double.infinity),
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffFFC113),
                  ),
                ),
                SizedBox(height: 75.h),
                Stack(
                  children: [
                    SizedBox(
                      height: 150.h,
                      width: 403.w,
                    ),
                    Positioned(
                      top: 15,
                      child: Container(
                        height: 108.h,
                        width: 202.w,
                        decoration: BoxDecoration(
                            color: const Color(0xff264050),
                            borderRadius: BorderRadius.circular(15.sp)),
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Center(
                            child: Text(name.toString(),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 205.w,
                      top: 15.h,
                      child: Container(
                        height: 108.h,
                        width: 197.w,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFC113),
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 29.h),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Wallet Balance",
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                  const Icon(
                                    Icons.account_balance_wallet_outlined,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ],
                              ),
                            ),
                            Text(wallet == null ? "0 SAR" : wallet.toString(),
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                            SizedBox(height: 6.h),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0.w),
                              child: Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "more details",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 150,
                      top: 1,
                      child: Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(42.sp),
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                      left: 152,
                      top: 3,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.sp)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset("assets/building.png"),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 193.w,
                      top: 100.h,
                      child: Container(
                        height: 23.h,
                        width: 23.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)),
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            color: const Color(0xff264050),
                            size: 16.sp,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: 311,
                  height: 52,
                  decoration: BoxDecoration(
                      border:
                      Border.all(width: 1, color: const Color(0xffFFC113)),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Refferal code :",
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA0A0A0))),
                      Text(refferalCode == null ? "ABC123" : refferalCode
                          .toString(),
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xffFFC113))),
                      const Icon(
                        Icons.copy_all,
                        size: 20,
                        color: Color(0xffD9D9D9),
                      ),
                      const Icon(
                        Icons.info_outline,
                        size: 20,
                        color: Color(0xffD9D9D9),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 75.h),

                BlocListener<PasswordBloc, PasswordState>(
                  listener: (context, state) {
                    if(state is PasswordLoading){
                      print("loading");
                      const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
                    }
                    if(state is PasswordError){
                      print("Error");
                      const Center(child: Text("OOps.. something went wrong"));
                    }
                    if(state is PasswordLoaded){
                      print("Loaded");
                      const Center(child: Text("Password Updated Successfully"));
                      Navigator.of(context).pop();
                    }
                    // TODO: implement listener
                  },
                  child: SizedBox(
                      child: Column(children: [
                        SizedBox(height: 40.h),
                        Container(
                          width: 273,
                          height: 47,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xfff7f7f7),
                          ),
                          child: TextFormField(
                            obscureText: isShowCurretPassword==false?true:false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter you password';
                              }
                              if (value.length < 3) {
                                return 'Must be more than 2 charater';
                              }
                            },
                            controller: currentPasswordController,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: (){
                                      setState(() {
                                        isShowCurretPassword=!isShowCurretPassword;
                                      });
                                    },
                                    child: Icon(isShowCurretPassword==true?Icons.visibility:Icons.visibility_off,color: const Color(0xbaffc012),)),
                                hintText: "Current Password",
                                hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffA0A0A0)),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(height: 27.h),
                        Container(
                          width: 273,
                          height: 47,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xfff7f7f7),
                          ),
                          child: TextFormField(
                            obscureText: isShowNewPassword==false?true:false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter you password';
                              }
                              if (value.length < 3) {
                                return 'Must be more than 2 charater';
                              }
                            },
                            controller: newPasswordController,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: (){
                                      setState(() {
                                        isShowNewPassword=!isShowNewPassword;
                                      });
                                    },
                                    child: Icon(isShowNewPassword==true?Icons.visibility:Icons.visibility_off,color: const Color(0xbaffc012),)),
                                hintText: "New Password",
                                hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffA0A0A0)),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(height: 27.h),
                        Container(
                          width: 273,
                          height: 47,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xfff7f7f7),
                          ),
                          child: TextFormField(

                            obscureText: isShowConfirmPassword==false?true:false,
                            validator: (value) {
                              if (value != newPasswordController.text) {
                                return 'Password not match';
                              }
                            },
                            controller: conformePasswordController,
                            decoration: InputDecoration(
                              suffixIcon: InkWell(
                                  onTap: (){
                                    setState(() {

                                      isShowConfirmPassword=!isShowConfirmPassword;
                                    });
                                  },
                                  child: Icon(isShowConfirmPassword==true?Icons.visibility:Icons.visibility_off,color: const Color(0xbaffc012),)),
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffA0A0A0)),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(height: 40.h),
                      ],)
                  ),
                ),

                InkWell(
                  onTap: () {
                    final _valid = _formKey.currentState!.validate();
                    if (_valid == true) {
                      _formKey.currentState!.save();
                      BlocProvider.of<PasswordBloc>(context).add(FetchPassword(
                          oldPassword: currentPasswordController.text,
                          newPassword: newPasswordController.text));
                    }
                  },
                  child: Container(
                    width: 96,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: const Color(0xbaffc012),
                    ),
                    child: Center(
                      child: Text("Done",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
