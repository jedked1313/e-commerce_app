import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/view/widget/customiconbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColor.ligthGrey, width: 1),
          ),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Card(
                    elevation: 0,
                    color: AppColor.grey.shade200,
                    child: Image.asset(
                      AppImageAsset.apple,
                      height: Get.height * 0.15,
                    ))),
            const SizedBox(width: 10),
            Expanded(
                flex: 2,
                child: SizedBox(
                  height: Get.height * 0.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Test Product"),
                          CustomIconButton(
                            icon: Icon(Icons.cancel_outlined),
                            padding: 0,
                            color: AppColor.white,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$100",
                              style: Theme.of(context).textTheme.titleMedium),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.grey, width: 1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const CustomIconButton(
                                  icon: Icon(Icons.remove),
                                  padding: 0,
                                  color: AppColor.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "1",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.primaryColor, width: 1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const CustomIconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: AppColor.primaryColor,
                                  ),
                                  padding: 0,
                                  color: AppColor.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
