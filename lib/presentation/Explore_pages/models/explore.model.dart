import 'package:equatable/equatable.dart';
import 'profile_list_item.model.dart';

class ExploreModel extends Equatable {
  final List<ProfileslistItemModel> profilelistItemList;

  ExploreModel({this.profilelistItemList = const []});

  ExploreModel copyWith({
    List<ProfileslistItemModel>? profilelistItemList,
  }) {
    return ExploreModel(
      profilelistItemList: profilelistItemList ?? this.profilelistItemList,
    );
  }

  @override
  List<Object?> get props => [profilelistItemList];
}
