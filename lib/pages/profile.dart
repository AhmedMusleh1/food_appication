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
    return const SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(MainImageFactory.profileImage),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Ahmed Musleh",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Mooli"),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                "Software Engineer",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Mooli"),
              ),
              SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OrdersCouponsWidget(title: "Orders", value: 10),
                  SizedBox(height: 45, child: VerticalDivider()),
                  OrdersCouponsWidget(title: "Coupons", value: 5),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              ListTileProfilePage(
                  leadingIcon: Icons.shopping_cart_outlined, title: "Orders"),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              ListTileProfilePage(
                  leadingIcon: Icons.card_giftcard_outlined, title: "Coupons"),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
