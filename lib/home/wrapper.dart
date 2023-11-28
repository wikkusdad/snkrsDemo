import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:snkrs_demo/main.dart';
import 'package:snkrs_demo/models/user.dart';
import 'package:snkrs_demo/authenticate/authentication.dart';
import 'package:snkrs_demo/pages/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});
  @override
  Widget build(context) {
    final user = Provider.of<FbUser?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
