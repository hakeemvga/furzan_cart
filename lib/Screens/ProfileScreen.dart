import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furzan_app/Screens/change_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

TextEditingController emailText= TextEditingController(text: email);
TextEditingController phoneText =TextEditingController(text: phone);
 String? wallet;
String? userName;
  String? refferalCode;
String? email;
String? phone;


bool isEmailEdited=false;
bool isPhoneEdited=false;


class _ProfileScreenState extends State<ProfileScreen> {
  getData()async{
    final SharedPreferences prefs=  await SharedPreferences.getInstance();

    setState(() {

      userName=prefs.getString("Username").toString();
      wallet=prefs.getString("WalletBalance").toString();
      refferalCode=prefs.getString("RefferalCode").toString();
      email=prefs.getString("Email").toString();
      phone=prefs.getString("Phone").toString();
      emailText.text=email.toString();
      phoneText.text=phone.toString();


       // print(walletBalance);
    });

  }
  @override
  void initState() {

    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.sp),
        child: SingleChildScrollView(
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
                          child: Text(userName.toString(),
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
                          Text(wallet==null?"0 SAR":wallet.toString(),
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          // Text(walletBalance.toString(),
                          //    style: TextStyle(
                          //        fontSize: 20.sp,
                          //        fontWeight: FontWeight.w700,
                          //        color: Colors.white)),
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
                    Text(refferalCode==null?"ABC123":refferalCode.toString(),
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
              SizedBox(height: 39.h),
              ListTile(
                leading: Icon(
                  Icons.mail_outline,
                  color: Color(0xffCBCBCB),
                ),
                title: isEmailEdited==false?Text(email==null?"Email not provided":email.toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffA0A0A0),
                    )):SizedBox(
                  height: 24.h,width: 143.w,
                      child: TextFormField(
controller: emailText,

                ),
                    ),
                trailing: InkWell(
                  onTap: (){
                    setState(() {
                      isEmailEdited = !isEmailEdited;
                      print(isEmailEdited);
                    });
                  },
                  child:isEmailEdited==false? Text("edit",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff264050))): Text("done",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff264050))),
                ),
              ),
              SizedBox(height: 23.h),
              ListTile(
                leading: Icon(
                  Icons.call,
                  color: Color(0xffCBCBCB),
                ),
                title: isPhoneEdited==false?Text(phone==null?"No Phone Number":phone.toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffA0A0A0),
                    )):SizedBox(
                  height: 24.h,width: 143.w,
                      child: TextFormField(
                  controller: phoneText,
                ),
                    ),
                trailing: InkWell(
                  onTap: (){

                    setState(() {
                      isPhoneEdited=!isPhoneEdited;
                    });
                  },
                  child:isPhoneEdited==false? Text("edit",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff264050))):Text("done",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff264050))),
                ),
              ),
              SizedBox(height: 23.h),
              ListTile(
                leading: const Icon(
                  Icons.location_on_outlined,
                  color: Color(0xffCBCBCB),
                ),
                title: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffA0A0A0),
                    )),
                trailing: Text("edit",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff264050))),
              ),
              SizedBox(height: 68.h),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const ChangePasswordScreen()));
                },
                child: Container(
                  width: 153,
                  height: 49,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: const Color(0xbaffc012),
                  ),
                  child: Center(
                    child: Text("Change Password",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
