import 'package:hsssiot/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hsssiot/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var phoneControler = TextEditingController();

  var passwordController = TextEditingController();

  var passwordConfirmController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  XFile? image;
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    // var authProvider = Provider.of<AuthProvider>(context);
    // ScreenUtil.init(
    //   BoxConstraints(
    //       maxWidth: MediaQuery.of(context).size.width,
    //       maxHeight: MediaQuery.of(context).size.height),
    //   designSize: Size(360, 690),
    //   orientation: Orientation.portrait,
    // );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Create Profile",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: Container(
                      height: kSpacingUnit.w * 10,
                      width: kSpacingUnit.w * 10,
                      margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
                      child: Stack(
                        children: <Widget>[
                          CircleAvatar(
                            radius: kSpacingUnit.w * 5,
                            backgroundImage: AssetImage('images/avatar.png'),
                            backgroundColor: Colors.white,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: kSpacingUnit.w * 2.5,
                              width: kSpacingUnit.w * 2.5,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                heightFactor: kSpacingUnit.w * 1.5,
                                widthFactor: kSpacingUnit.w * 1.5,
                                child: Icon(
                                  LineAwesomeIcons.pen,
                                  color: Colors.white,
                                  size:
                                      ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        builder: (BuildContext context) {
                          return Container(
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.photo_library,
                                        size: 36,
                                      ),
                                      Text(
                                        "Galery",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  onTap: () async {
                                    image = await _picker.pickImage(
                                        source: ImageSource.gallery);
                                  },
                                ),
                                GestureDetector(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.camera,
                                        size: 36,
                                      ),
                                      Text(
                                        "Camera",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  onTap: () async {
                                    image = await _picker.pickImage(
                                      source: ImageSource.camera,
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextFeild(
                    label: "First Name",
                    keyboardtype: TextInputType.name,
                    controller: phoneControler,
                  ),
                  CustomTextFeild(
                    label: "Last Name",
                    keyboardtype: TextInputType.name,
                    controller: passwordController,
                  ),
                  CustomTextFeild(
                    label: "Phone Number",
                    keyboardtype: TextInputType.phone,
                    controller: phoneControler,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    // authProvider
                    //     .registerUser(
                    //       phoneControler.text,
                    //       passwordController.text,
                    //       passwordConfirmController.text,
                    //     )
                    //     .then(
                    //       (value) => {
                    //         if (value)
                    //           {
                    Navigator.of(context).pushReplacementNamed("/dashboard");
                    //   //       ),
                    //   //     }
                    //   // },
                    // );
                  },
                  color: Theme.of(context).primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Create",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
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
