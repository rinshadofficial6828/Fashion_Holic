import 'package:fashion_app/Common/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CaroselOffersScreen extends StatefulWidget {
  const CaroselOffersScreen({super.key});

  @override
  State<CaroselOffersScreen> createState() => _CaroselOffersScreenState();
}

class _CaroselOffersScreenState extends State<CaroselOffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarAuth(context, true, "Today Deals"),
    );
  }
}