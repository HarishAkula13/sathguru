import 'package:flutter/material.dart';
import '../common/button/user_button.dart';
import '../common/text/label_text.dart';
import '../common/text_field/user_password_text_filed.dart';
import '../common/text_field/user_text_field.dart';
import '../common/toast/toast.dart';
import '../manager/data_base/db_manager.dart';
import '../model/login/login_response.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget{

  SignUpPageState  createState()=> SignUpPageState();
}
class SignUpPageState extends State<SignUpPage>{
  final _formKey = new GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var dbManager;

  @override
  void initState() {
    super.initState();
    dbManager = DbManager();
  }
  signUp() async {
    String uid = userNameController.text;
    String uname = mobileNumberController.text;
    String email = emailController.text;
    String passwd = passwordController.text;
    UserModel uModel = UserModel(uid, uname, email, passwd);
    await dbManager.saveData(uModel).then((userData) {
      ToastMessage("Successfully Saved");

      Navigator.push(
          context, MaterialPageRoute(builder: (_) => LoginPage()));
    }).catchError((error) {
      print(error);
      ToastMessage(" Save Fail");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 20,
                          child: Icon(Icons.arrow_back,color: Colors.white,),

                        ),
                      ),
                    ),

                    Expanded(
                        flex: 4,
                        child: Image(image: AssetImage('assets/images/SMC-logo.png',),height: 150,width: 150,)),
                  ],
                ),

                ItemLabelText(text: "Sign up for free? ",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.w300),),

                const SizedBox(
                  height: 30,
                ),
                UserTextField(
                  controller: userNameController,
                  labelText: 'Name',
                  hintText: '',
                  inputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
                UserTextField(
                  controller: mobileNumberController,
                  labelText: 'Mobile Number',
                  hintText: '',
                  inputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20,),
                UserTextField(
                  controller:emailController ,
                  labelText: 'Email',
                  hintText: '',
                  inputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
                UserTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  hintText: '',
                  inputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                ),

                const SizedBox(
                  height: 50,
                ),
                UserButton(() {
                  signUp();

                  }, 'Sign up',context),
                const SizedBox(
                  height: 20,
                ),
                Align(alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ItemLabelText(text: "Already have an account? ",style: TextStyle(fontSize: 16,color: Colors.black),),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  LoginPage()),
                              );                            },
                            child: ItemLabelText(text: "Login",style: TextStyle(fontSize: 16,color: Colors.blue),)),

                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }


}