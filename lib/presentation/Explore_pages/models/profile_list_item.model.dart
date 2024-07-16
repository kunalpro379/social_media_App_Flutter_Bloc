import 'package:connectiva/core/utils/imageconstants.dart';

class ProfileslistItemModel {
  ProfileslistItemModel({this.agnessmonica, this.nineteenOne, this.id}) {
    nineteenOne = nineteenOne ?? ImageConstant.DefStoryImage;
    agnessmonica = agnessmonica ?? "Agness Monica";
    id = id ?? "";
  }
  String? nineteenOne;
  String? agnessmonica;
  String? id;
}
