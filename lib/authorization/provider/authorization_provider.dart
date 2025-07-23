import 'package:clever_project_practical/authorization/models/details.dart';
import 'package:flutter/material.dart';

class AuthorizationProvider with ChangeNotifier {
  Details? userDetails; // used to save login info

  void setUserDetails(Details details) {
    userDetails = details;
    notifyListeners();
  }
}
