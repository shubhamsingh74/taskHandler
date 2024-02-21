import 'package:quickprism/domain/user/models/parties/parties_model.dart';

import 'models/user_model.dart';

class UserConstants {
  static int? userId;
  static String? userType;

  static UserModel? currentUser;

  static List<BusinessManagement> shops = [];
  static List<PartiesListDatum> partiesList = [];
  static BusinessManagement? currentShop;
  static BusinessDetails? currentBusiness;
  static EmployeeDetails? employeeDetails;
  static List<StaffManagement>? staffManagement;

  static int get getCompletedProfilePercentage => _getPercentage();

  static int _getPercentage() {
    int total = 0;

    if (currentUser!.data!.businessDetails == null) {
      return total;
    }
    if (currentUser!.data!.businessDetails!.businessProfile != null) {
      total = total + 49;
    }
    if (currentUser!.data!.businessDetails!.businessManagement != null) {
      total = total + 27;
    }
    if (currentUser!.data!.businessDetails!.staffManagement != null) {
      total = total + 24;
    }

    return total;
  }
}
