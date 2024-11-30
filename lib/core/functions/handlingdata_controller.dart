import 'package:e_commerce/core/class/statusrequests.dart';

// Change StatusRequest to success if the date fetched successfully,
// otherwise return the StatusRequests
handlingData(response) {
  if (response is StatusRequests) {
    return response;
  } else {
    return StatusRequests.success;
  }
}
