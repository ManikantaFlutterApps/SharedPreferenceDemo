import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MyResultScreen.dart';

class SharedPreferenceDemo extends StatefulWidget {
  const SharedPreferenceDemo({super.key});

  @override
  State<SharedPreferenceDemo> createState() => _SharedPreferenceDemoState();
}

class _SharedPreferenceDemoState extends State<SharedPreferenceDemo> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SharedPrefernceDemo"),),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const SizedBox(height: 10,),

              displayTextField(userNameController,"Enter UserName"),

              const SizedBox(height: 10,),

              displayTextField(userEmailController,"Enter UserEmail"),

              const SizedBox(height: 10,),

              displayTextField(userPhoneController,"Enter UserPhone"),

              const SizedBox(height: 10,),

              ElevatedButton(onPressed: () {
                saveDataInPreference(userNameController,userEmailController,userPhoneController);
              }, child:Text("SAVE",style: TextStyle(fontSize: 15,color: Colors.blueAccent,fontWeight: FontWeight.bold),),)





            ],
          ),
        ),
      ),
    );
  }

  Widget displayTextField(TextEditingController userController, String hintText) {

    return TextField(
      controller: userController,
      decoration: InputDecoration(hintText: hintText),
    );
  }

  Future<void> saveDataInPreference(TextEditingController userNameController, TextEditingController userEmailController, TextEditingController userPhoneController) async {

    var userName = userNameController.text.toString();
    var userEmail = userEmailController.text.toString();
    var userPhone = userPhoneController.text.toString();

    SharedPreferences mSharedPreference = await SharedPreferences.getInstance();
    mSharedPreference.setString("UNAME",userName);
    mSharedPreference.setString("UEMAIL",userEmail);
    mSharedPreference.setString("UPHONE",userPhone);


    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyResultScreen()),
    );

  }
}
