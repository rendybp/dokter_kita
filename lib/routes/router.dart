import 'package:flutter/material.dart';
import 'package:dokter_kita/screens/doctor_detail.dart';
import 'package:dokter_kita/screens/home.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => Home(),
  '/detail': (context) => SliverDoctorDetail(),
};
