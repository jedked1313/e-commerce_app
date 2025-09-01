import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/widget/profile/profilegriditem.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.ligthGrey, width: 4),
                ),
                child: ExtendedImage.asset(
                  AppImageAsset.profile,
                  height: Get.height * 0.15,
                ),
              ),
              const SizedBox(height: 20),
              Text("User Name", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),
              const Text("Email Address"),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.2,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              ProfileGridItem(
                title: "My Orders",
                image: AppImageAsset.orders,
                onTap: () {},
              ),
              ProfileGridItem(
                title: "My Address",
                image: AppImageAsset.address,
                onTap: () => Get.toNamed(AppRoute.address),
              ),
              ProfileGridItem(
                title: "Personal Info",
                image: AppImageAsset.peronalInfo,
                onTap: () {},
              ),
              ProfileGridItem(
                title: "Change Password",
                image: AppImageAsset.changePassword,
                onTap: () {},
              ),
              ProfileGridItem(
                title: "Orders History",
                image: AppImageAsset.ordersHistory,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
