import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sathguru/common/text/label_text.dart';
import 'package:sathguru/model/login/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/button/user_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreenState createState()=>HomeScreenState();
}
class HomeScreenState extends State<HomeScreen> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  UserModel? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(

          children: [
            Row(

              children: [
                Expanded(flex: 3,
                    child:ItemLabelText(text: 'Name',style: TextStyle(color: Colors.black,fontSize: 16),)
                ),
                Expanded(flex: 5,
                    child: ItemLabelText(text:'${(data!.user_name!=null)?data!.user_name!:""}',style: TextStyle(color: Colors.black,fontSize: 16),))

              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(flex: 3,
                    child:ItemLabelText(text: 'Email',style: TextStyle(color: Colors.black,fontSize: 16),)
                ),
                Expanded(flex: 5,
                    child: ItemLabelText(text:'${(data!.email!=null)?data!.email!:""}',style: TextStyle(color: Colors.black,fontSize: 16),))

              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(flex: 3,
                    child:ItemLabelText(text: 'DOB',style: TextStyle(color: Colors.black,fontSize: 16),)
                ),
                Expanded(flex: 5,
                    child: ItemLabelText(text:'${(data!.dob!=null)?data!.dob!:""}',style: TextStyle(color: Colors.black,fontSize: 16),))

              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(flex: 3,
                    child:ItemLabelText(text: 'Address',style: TextStyle(color: Colors.black,fontSize: 16),)
                ),
                Expanded(flex: 5,
                    child: ItemLabelText(text:'${(data!.address!=null)?data!.address!:""}',style: TextStyle(color: Colors.black,fontSize: 16),))

              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(flex: 3,
                    child:ItemLabelText(text: 'Salary',style: TextStyle(color: Colors.black,fontSize: 16),)
                ),
                Expanded(flex: 5,
                    child: ItemLabelText(text:'${(data!.salary!=null)?data!.salary!:""}',style: TextStyle(color: Colors.black,fontSize: 16),))

              ],
            ),
            SizedBox(height: 50,),
            SizedBox(
              width: 150,
              child: UserButton(() {


              }, 'Show All Users',context),
            ),

              

          ],
        ),
      ),
    );
  }

  void getData() async{
    final SharedPreferences sp = await _pref;
    data=UserModel.fromJson(json.decode(sp.get("user_data").toString()));
  
    setState(() {
      
    });

  }



}