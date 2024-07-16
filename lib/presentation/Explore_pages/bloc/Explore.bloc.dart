import 'package:bloc/bloc.dart';

import 'package:connectiva/core/utils/imageconstants.dart';
import 'package:flutter/material.dart';
import '../models/profile_list_item.model.dart';
import 'Explore.event.dart';
import 'Explore.state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc(ExploreState initialState) : super(initialState) {
    on<ExploreInitalEvent>(_onInitialize);
  }

  List<ProfileslistItemModel> fillProfileslistItemList() {
    return [
      ProfileslistItemModel(
        agnessmonica: "Agness Monica",
        nineteenOne: ImageConstant.DefStoryImage,
      ),
      ProfileslistItemModel(
        agnessmonica: "Jhon Doe",
        nineteenOne: ImageConstant.DefStoryImage,
      ),
    ];
  }

  _onInitialize(
    ExploreInitalEvent event,
    Emitter<ExploreState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
      exploreModelObj: state.ExploreModelObj?.copyWith(
        profilelistItemList: fillProfileslistItemList(),
      ),
    ));
  }
}
