import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyResultScreen extends StatefulWidget {
  const MyResultScreen({super.key});

  @override
  State<MyResultScreen> createState() => _MyResultScreenState();
}

class _MyResultScreenState extends State<MyResultScreen> {

  var userName = "";
  var userEmail = "";
  var userPhone = "";


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      getSharedPreferenceData();

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result Screen"),),
      body: Center(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const SizedBox(height: 10,),

              displayTextField(userName),

              const SizedBox(height: 10,),

              displayTextField(userEmail),

              const SizedBox(height: 10,),

              displayTextField(userPhone),

              const SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }

  Widget displayTextField(String userValue) {

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
         border: Border.all(width: 3,),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(userValue,style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
    );
  }

  Future<void> getSharedPreferenceData() async {

    SharedPreferences mSharedPreference = await SharedPreferences.getInstance();

    userName = mSharedPreference.getString("UNAME")!;
    userEmail = mSharedPreference.getString("UEMAIL")!;
    userPhone = mSharedPreference.getString("UPHONE")!;

    print("UserName $userName");
    print("UserName $userEmail");
    print("UserName $userPhone");


  }
}
