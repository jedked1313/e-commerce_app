import 'package:e_commerce/controller/address/addressdetails_controller.dart';
import 'package:e_commerce/core/functions/validinput.dart';
import 'package:e_commerce/view/widget/auth/custominputfield.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:e_commerce/view/widget/requestwidgets/handlingdataicons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddressDetailsController controller = Get.put(AddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.isUpdate ? "Edit Address Details" : "Add Address",
        ),
      ),
      body: GetBuilder<AddressDetailsController>(
        builder: (controller) => HandlingDataIcons(
          statusRequests: controller.statusRequests,
          defaultWidget: Form(
            key: controller.formState,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
              children: [
                Text(
                  "Address Information",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 12),
                Text(
                  "Provide Location it will appear publicly",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(height: 12),
                Divider(),
                CustomInputField(
                  label: "Address Name (Home, Work, etc)",
                  controller: controller.addressName,
                  valid: (value) => null,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomInputField(
                        label: "City",
                        controller: controller.city,
                        valid: (value) => validInput(value!, 3, 128, ""),
                      ),
                    ),
                    Expanded(
                      child: CustomInputField(
                        label: "Neighborhood",
                        controller: controller.neighborhood,
                        valid: (value) => validInput(value!, 3, 128, ""),
                      ),
                    ),
                  ],
                ),
                CustomInputField(
                  label: "Street",
                  controller: controller.street,
                  valid: (value) => null,
                ),
                CustomInputField(
                  label: "Building",
                  controller: controller.building,
                  valid: (value) => null,
                ),
                CustomInputField(
                  label: "Contact Phone",
                  controller: controller.contactPhone,
                  valid: (value) => validInput(value!, 9, 128, "phone_number"),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomInputField(
                        label: "Apartment",
                        controller: controller.apartment,
                        valid: (value) => null,
                      ),
                    ),
                    Expanded(
                      child: CustomInputField(
                        label: "Postal Code",
                        controller: controller.postalCode,
                        valid: (value) => null,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 400,
                  width: Get.width,
                  child: GoogleMap(
                    markers: controller.markers.toSet(),
                    onTap: (latLng) {
                      controller.addMarkers(latLng);
                    },
                    initialCameraPosition: controller.kGooglePlex,
                    // Fix scrolling on maps inside listview
                    gestureRecognizers: {
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      ),
                    },
                    onMapCreated: (googleMapController) {
                      controller.mapController = googleMapController;
                    },
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CustomButton(
        horizontalPadding: 50,
        text: "Submit",
        onPressed: () {
          controller.saveAddressData();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
