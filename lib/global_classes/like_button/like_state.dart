import 'package:equatable/equatable.dart';

class LikeState extends Equatable {
  final bool isLiked;

  const LikeState({required this.isLiked});

  @override
  List<Object?> get props => [isLiked];
}
