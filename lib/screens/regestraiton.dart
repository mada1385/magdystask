import 'package:flutter/material.dart';
import 'package:task/components/Roundbutton.dart';
import 'package:task/components/primarytextfield.dart';
import 'package:task/constatns/colors.dart';

class Regstration extends StatefulWidget {
  @override
  _RegstrationState createState() => _RegstrationState();
}

class _RegstrationState extends State<Regstration> {
  final name = TextEditingController(),
      email = TextEditingController(),
      password = TextEditingController(),
      jobtittle = TextEditingController(),
      confirmpassword = TextEditingController();

  bool vname = false,
      vemail = false,
      vpassword = false,
      vjobtittle = false,
      vconfirmpassword = false;

  String ename = null,
      eemail = null,
      epassword = null,
      ejobtittle = null,
      econfirmpassword = null;

  String errortext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: k_primarycolor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: SizedBox(
                height: 20,
              ),
            ),
            Hero(
                tag: "logo",
                child: Container(
                    child: Image.asset(
                  "asset/HOMY.png",
                  width: 200,
                  height: 200,
                ))),
            // Padding(
            //     padding: EdgeInsets.only(right: 90, left: 78), child: k_title),
            SizedBox(
              height: 20,
            ),
            Primarytextfield(
              hint: "username",
              controller: name,
              validate: vname,
              error: ename,
            ),
            SizedBox(
              height: 10,
            ),
            Primarytextfield(
              hint: "mail",
              controller: email,
              validate: vemail,
              error: eemail,
            ),
            SizedBox(
              height: 10,
            ),
            Primarytextfield(
              hint: "jobtittle",
              controller: jobtittle,
              validate: vjobtittle,
              error: ejobtittle,
            ),
            SizedBox(
              height: 10,
            ),
            Primarytextfield(
              hint: "password",
              controller: password,
              validate: vpassword,
              obsucure: true,
              error: epassword,
            ),
            SizedBox(
              height: 10,
            ),
            Primarytextfield(
              hint: "confirmpassword",
              controller: confirmpassword,
              validate: vconfirmpassword,
              obsucure: true,
              error: econfirmpassword,
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Roundbutton(label: "signup", func: () async {}),
            SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
