import 'package:flutter/material.dart';
import 'package:sathguru/pages/signup_page.dart';
import 'package:toast/toast.dart';
import '../common/button/user_button.dart';
import '../common/text/label_text.dart';
import '../common/text_field/user_password_text_filed.dart';
import '../common/text_field/user_text_field.dart';
import '../common/toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../manager/data_base/db_manager.dart';
import '../model/login/login_response.dart';

class LoginPage extends StatefulWidget{

  LoginPageState  createState()=> LoginPageState();
}
class LoginPageState extends State<LoginPage>{
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();
  FocusNode _passwordFocus = FocusNode();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  var dbManager;
  @override
  void initState() {
    super.initState();
    dbManager = DbManager();
  }
  login() async {
    String userName = userNameController.text;
    String passwd = passwordController.text;
    if (userName.isEmpty&&passwd.isEmpty) {
      ToastMessage("Please Enter Details");
    } else if (passwd.isEmpty) {
      ToastMessage("Please Enter Password");
    } else {
      await dbManager.getLoginUser(userName, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(builder: (_) => HomeScreen()),
            //         (Route<dynamic> route) => false);
          });
        } else {
          ToastMessage("Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        ToastMessage( "Error: Login Fail");
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;
    sp.setString("user_id", user.user_id!);
    sp.setString("user_name", user.user_name!);
    sp.setString("email", user.email!);
    sp.setString("password", user.password!);
  }
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

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
                  height: 50,
                ),
                Image(image: AssetImage('assets/images/SMC-logo.png',),height: 150,width: 150,),
                const SizedBox(
                  height: 30,
                ),
                UserTextField(
                  controller: userNameController,
                  labelText: 'Username',
                  hintText: '',
                  inputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  onSubmit: (_) => _passwordFocus.requestFocus(),
                ),
                const SizedBox(
                  height: 35,
                ),
                UserPasswordTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  hintText: '',
                  obscureText: _obscureText,
                  focusNode: _passwordFocus,
                  inputAction: TextInputAction.done,
                  onPressed: (value){
                    setState(() {

                    });
                    _obscureText=value;
                  },
                  onSubmit: (_) {
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                UserButton(() {
                  login();

                }, 'Log In',context),
                const SizedBox(
                  height: 20,
                ),
                Align(alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ItemLabelText(text: "Don't have an account? ",style: TextStyle(fontSize: 16,color: Colors.black),),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  SignUpPage()),
                              );

                            },
                            child: ItemLabelText(text: "Sign up",style: TextStyle(fontSize: 16,color: Colors.blue),)),

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