import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/assets_factory/main_images_factory.dart';
import 'package:food_application/widgets/list_tile_profile.dart';
import 'package:food_application/widgets/orders_coupons_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    bool isMobileView = true;

    screenWidth > 800 ? isMobileView = false : true;

    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight / 36.1425,
              ),
              CircleAvatar(
                radius: isMobileView ? screenHeight * 0.1 : screenHeight * 0.2,
                backgroundImage:
                    const AssetImage(MainImageFactory.profileImage),
              ),
              SizedBox(
                height: screenHeight / 36.1425,
              ),
              const Text(
                "Ahmed Musleh",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Mooli"),
              ),
              SizedBox(
                height: screenHeight / 144.57,
              ),
              const Text(
                "Software Engineer",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Mooli"),
              ),
              SizedBox(
                height: screenHeight / 36.1425,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const OrdersCouponsWidget(title: "Orders", value: 10),
                  SizedBox(
                      height: screenHeight / 19.276,
                      child: const VerticalDivider()),
                  const OrdersCouponsWidget(title: "Coupons", value: 5),
                ],
              ),
              SizedBox(
                height: screenHeight / 108.4275,
              ),
              Divider(
                indent: screenWidth / 20.5714,
                endIndent: screenWidth / 20.5714,
              ),
              if (!Platform.isIOS) ...[
                const ListTileProfilePage(
                    leadingIcon: Icons.shopping_cart_outlined, title: "Orders"),
                Divider(
                  indent: screenWidth / 20.5714,
                  endIndent: screenWidth / 20.5714,
                ),
                const ListTileProfilePage(
                    leadingIcon: Icons.card_giftcard_outlined,
                    title: "Coupons"),
                Divider(
                  indent: screenWidth / 20.5714,
                  endIndent: screenWidth / 20.5714,
                ),
              ] else
                CupertinoListSection(
                  children: const [
                    ListTileProfilePage(
                        leadingIcon: Icons.shopping_cart_outlined,
                        title: "Orders"),
                    ListTileProfilePage(
                        leadingIcon: Icons.card_giftcard_outlined,
                        title: "Coupons"),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
