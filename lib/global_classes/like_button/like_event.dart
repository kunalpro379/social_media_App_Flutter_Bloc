import 'package:equatable/equatable.dart';

abstract class LikeEvent extends Equatable {
  const LikeEvent();

  @override
  List<Object> get props => [];
}

class LikeButtonPressed extends LikeEvent {
  final bool isLiked;

  const LikeButtonPressed(this.isLiked);

  @override
  List<Object> get props => [isLiked];
}
