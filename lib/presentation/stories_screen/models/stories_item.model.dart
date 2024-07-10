import 'package:flutter/material.dart';

import '../../../core/utils/imageconstants.dart';

class StoriesItemModel {
  String? storyind;
  String? storyname;
  String? id;

  StoriesItemModel({String? storyind, String? storyname, String? id}) {
    this.storyind = storyind ?? ImageConstant.DefStoryImage;
    this.storyname = storyname ?? "kunal";
    this.id = id ?? "";
  }
}

