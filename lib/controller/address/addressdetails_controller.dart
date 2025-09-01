import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/static/remote/address_data.dart';
import 'package:e_commerce/data/model/addressmodel.dart';
import 'package:e_commerce/view/widget/snackbars/successfulsnackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressDetailsController extends GetxController {
  late StatusRequests statusRequests = StatusRequests.none;
  AddressData addressData = AddressData(Get.find());

  String? addressId; // Used for updating address details
  bool isUpdate =
      false; // It will be changed to (true) if the user wants to modify the address details.

  List<AddressModel> addressItems = [];

  // Address form
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController? addressName;
  late TextEditingController contactPhone;
  late TextEditingController city;
  late TextEditingController neighborhood;
  TextEditingController? street;
  TextEditingController? building;
  TextEditingController? apartment;
  TextEditingController? postalCode;

  // Location
  double? lat;
  double? long;

  Position? position;
  List<Marker> markers = [];
  GoogleMapController? mapController;

  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(24.76067370117626, 46.82713720947504),
    zoom: 8,
  );

  @override
  onInit() {
    addressName = TextEditingController();
    contactPhone = TextEditingController();
    city = TextEditingController();
    neighborhood = TextEditingController();
    street = TextEditingController();
    building = TextEditingController();
    apartment = TextEditingController();
    postalCode = TextEditingController();
    // If user create new address
    if (Get.arguments == null) {
      getCurrentLocation();
    } else {
      // If user update an already exist address
      addressId = Get.arguments["address_id"];
      isUpdate = true;
      showAddress(addressId);
    }
    super.onInit();
  }

  // Marker management
  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  saveAddressData() async {
    if (formState.currentState!.validate()) {
      statusRequests = StatusRequests.loading;
      update();
      if (!isUpdate) {
        await addressData.newAddressData(
          addressName!.text,
          city.text,
          neighborhood.text,
          street!.text,
          building!.text,
          apartment!.text,
          contactPhone.text,
          lat.toString(),
          long.toString(),
          postalCode!.text,
        );
        Get.back();
        successfulSnackbar(
          "Successeded",
          "The location has been added successfully.",
        );
      } else {
        await addressData.updateAddressData(
          addressId!,
          addressName!.text,
          city.text,
          neighborhood.text,
          street!.text,
          building!.text,
          apartment!.text,
          contactPhone.text,
          lat.toString(),
          long.toString(),
          postalCode!.text,
        );
        Get.back();
        successfulSnackbar(
          "Successeded",
          "The location has been modified successfully.",
        );
      }
    }
    update();
  }

  // Show address details to user before update
  showAddress(String? addressId) async {
    statusRequests = StatusRequests.loading;
    // refresh UI and display loading
    update();
    var response = await addressData.showAddressData(addressId);
    statusRequests = handlingData(response);
    if (StatusRequests.success == statusRequests) {
      city.text = response["data"]["city"];
      neighborhood.text = response["data"]["neighborhood"];
      street!.text = response["data"]["street"] ?? "";
      contactPhone.text = response["data"]["contact_phone"];
      addressName!.text = response["data"]["address_name"] ?? "";
      building!.text = response["data"]["building"] ?? "";
      apartment!.text = response["data"]["apartment"] ?? "";
      postalCode!.text = response["data"]["postal_code"] ?? "";
      kGooglePlex = CameraPosition(
        target: LatLng(
          response["data"]["latitude"],
          response["data"]["longitude"],
        ),
        zoom: 14.4746,
      );
      addMarkers(
        LatLng(response["data"]["latitude"], response["data"]["longitude"]),
      );
    }
    update();
  }

  Future<void> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar("Alert", "Location services are not enabled.");
        await Geolocator.openLocationSettings(); // Redirect to settings
        return;
      }

      // Check permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar("Alert", "Please give location permission to the app.");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar(
          "Alert",
          "Location permissions are permanently denied. Please enable them from settings.",
        );
        await Geolocator.openAppSettings(); // Redirect to app settings
        return;
      }

      // Get current position
      position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
      );

      // Assign the current location values to save it on database
      lat = position!.latitude;
      long = position!.longitude;

      // Update Google Map camera with current location
      kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 14.4746,
      );

      statusRequests = StatusRequests.none;
      update();
    } catch (e) {
      // Handle unexpected errors
      Get.snackbar("Error", "Failed to get location: $e");
    }
  }
}
