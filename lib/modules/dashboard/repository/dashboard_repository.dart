import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pingo_learn_assignment/modules/dashboard/model/comments_response_model.dart';
import 'package:pingo_learn_assignment/utils/app_utils.dart';
import 'package:pingo_learn_assignment/utils/text_constants.dart';

class DashboardRepository {
  DashboardRepository._() : super();
  static DashboardRepository? _instance;
  static DashboardRepository get instance =>
      _instance ??= DashboardRepository._();

  static const _getComments = 'https://jsonplaceholder.typicode.com/comments';
  Dio dio = Dio(BaseOptions(
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      sendTimeout: const Duration(minutes: 1)));
  Future<List<CommentsResponseModel>> getCommentsList() async {
    try {
      final response = await dio.get(_getComments);
      List<dynamic> commentsResponseModel = response.data;
      List<CommentsResponseModel> commentsList = List.empty(growable: true);
      for (var value in commentsResponseModel) {
        commentsList.add(CommentsResponseModel.fromJson(value));
      }
      return commentsList;
    } catch (e) {
      debugPrint('getCommentsList $e');
      AppUtils.showLoader(TextConstants.genericError);
      return Future.error(e);
    }
  }
}
