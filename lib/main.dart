import 'package:bigbrewteatech/pages/OrderCustomizationScreen.dart';
import 'package:bigbrewteatech/pages/OrderTransactionHistoryScreen.dart';
import 'package:bigbrewteatech/pages/menu.dart';
import 'package:bigbrewteatech/pages/profile.dart';
import 'package:bigbrewteatech/pages/profileeditscreen.dart';
import 'package:flutter/material.dart';
import 'package:bigbrewteatech/pages/signup.dart';
import 'package:bigbrewteatech/pages/login.dart';
import 'package:bigbrewteatech/pages/dashboard.dart';
import 'package:bigbrewteatech/pages/cart.dart';
import 'package:bigbrewteatech/pages/trackorder.dart';
import 'package:bigbrewteatech/pages/checkout.dart';
import 'package:bigbrewteatech/pages/deliveryaddress.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/profile',
  routes: {
    '/dashboard' : (context) => Dashboard(),
    '/menu' : (context) => Menu(),
    '/signup' : (context) => Signup(),
    '/profile' : (context) => UserProfileScreen(),
    '/login' : (context) => Login(),
    '/cart' : (context) => Cart(),
    '/trackorder' : (context) => trackorder(),
    '/OrderTransactionHistoryScreen' : (context) => OrderTransactionHistoryScreen(),
    '/checkout' : (context) => checkout(),
    '/deliveryaddress' : (context) => deliveryaddress(),

  },
));