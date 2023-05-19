import 'package:flutter/material.dart';
import 'package:dokter_kita/screens/doctor_detail.dart';
import 'package:dokter_kita/screens/doctor_detail2.dart';
import 'package:dokter_kita/screens/doctor_detail3.dart';
import 'package:dokter_kita/screens/doctor_detail4.dart';
import 'package:dokter_kita/screens/home.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => Home(),
  '/1': (context) => SliverDoctorDetail(),
  '/2': (context) => SliverDoctorDetail2(),
  '/3': (context) => SliverDoctorDetail3(),
  '/4': (context) => SliverDoctorDetail4(),
};
