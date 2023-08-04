import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import 'package:furzan_app/Screens/ShopScreen.dart';
import 'package:furzan_app/Screens/BottomNavigation.dart';
import 'package:furzan_app/bloc/LoginBloc/user_data_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailTextController = TextEditingController();
TextEditingController passwordTextController = TextEditingController();

bool showPassword=false;

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {

  @override
  void dispose() {
   emailTextController.clear();
   passwordTextController.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 500.h,
                    width: 430.w,
                  ),
                  SizedBox(
                    height: 350.h,
                    width: 430.w,
                    child: Image.asset(
                      "assets/curvedContainer.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: 146.h,
                      left: 61.w,
                      child: SizedBox(
                        height: 323.h,
                        width: 308.w,
                        child: Image.asset("assets/loginimg.png"),
                      ))
                ],
              ),
              SizedBox(height: 60.h),
              Text("Welcome back..!",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 57.h),
              SizedBox(
                height: 63,
                width: 336,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    label: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffFFC113),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@') ||
                        !value.contains('.')) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 63,
                width: 336,
                child: TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    obscureText: showPassword,
                    controller: passwordTextController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            showPassword=!showPassword;
                          });
                        },
                        child: showPassword==false? Icon(
                          Icons.visibility,
                          color: Color(0xffFFC113),
                        ):Icon(
                          Icons.visibility_off,
                          color: Color(0xffFFC113),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      label: Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffFFC113),
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter you password';
                      }
                      if (value.length < 3) {
                        return 'Must be more than 2 charater';
                      }
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(right: 46.w),
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Forgot password ?",
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff264050),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              BlocListener<UserDataBloc, UserDataState>(
                listener: (context, state) {
                 if(state is UserDataLoading){
                   print("loading");
                  const Center(child: CircularProgressIndicator(strokeWidth: 2));
                 }
                 if(state is UserDataError){
                   print("error");
                  const Center(child: Text("oops... something went wrong"));
                 }
                 if(state is UserDataLoaded){
                   print("loaded");
                 String tok= BlocProvider.of<UserDataBloc>(context).userModel.tokens!.accessToken.toString();
                   String userName= BlocProvider.of<UserDataBloc>(context).userModel.user!.username.toString();
                   String phone=BlocProvider.of<UserDataBloc>(context).userModel.user!.phone.toString();
                    String refferalCode=BlocProvider.of<UserDataBloc>(context).userModel.user!.referralCode.toString();
                    String email=BlocProvider.of<UserDataBloc>(context).userModel.user!.email.toString();
                    String walletBalance = BlocProvider.of<UserDataBloc>(context).userModel.user!.walletBalance.toString();
                    String id =BlocProvider.of<UserDataBloc>(context).userModel.user!.id.toString();
                token(tok, userName, phone, refferalCode, email, walletBalance,id);
                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const BottomNav()));
                 }
                },
                child: InkWell(
                  onTap: () {
                    final isValid = _formKey.currentState?.validate();
                    if (isValid == true) {
                      _formKey.currentState?.save();
                      BlocProvider.of<UserDataBloc>(context).add(FetchUser(
                          email: emailTextController.text.trimRight(),
                          password: passwordTextController.text.trimRight()));
                    }
                  },
                  child: Container(
                    width: 99,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(31),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xffFFC113),
                          const Color(0xffFDCD46).withOpacity(0.62),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  token(String tok,String userName,String phone,String refferalCode,String email,String walletBalance,String id)async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Token", tok);
    prefs.setString("Username", userName);
    prefs.setString("Phone", phone);
    prefs.setString("RefferalCode", refferalCode);
    prefs.setString("Email", email);
    prefs.setString("WalletBalance", walletBalance);
    prefs.setString("Id", id);
    // if(walletBalance!=null){
    // prefs.setString("WalletBalance", walletBalance);}
    // String token1=prefs.getString("Token").toString();
    // print(token1);
  }
}
