import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pingo_learn_assignment/modules/common/widget/base_scaffold.dart';
import 'package:pingo_learn_assignment/modules/common/widget/common_sized_boxes.dart';
import 'package:pingo_learn_assignment/modules/common/widget/common_text_widget.dart';
import 'package:pingo_learn_assignment/modules/common/widget/no_result_view.dart';
import 'package:pingo_learn_assignment/modules/dashboard/model/comments_response_model.dart';
import 'package:pingo_learn_assignment/modules/dashboard/provider/dashboard_provider.dart';
import 'package:pingo_learn_assignment/utils/app_colors.dart';
import 'package:pingo_learn_assignment/utils/app_extensions.dart';
import 'package:pingo_learn_assignment/utils/app_sizes.dart';
import 'package:pingo_learn_assignment/utils/text_constants.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (c, DashboardProvider dashboardProvider, _) =>
          Builder(builder: (context) {
        return BaseScaffold(
          appBar: AppBar(
            title: const CommonTextWidget(
              text: TextConstants.appName,
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: AppColors.primaryColor,
            actions: [
              GestureDetector(
                onTap: () {
                  dashboardProvider.showLogoutConfirmationDialog(context);
                },
                child: const Icon(
                  Icons.logout_outlined,
                  color: AppColors.white,
                ),
              ),
              smallSizedBox(isWidth: true)
            ],
          ),
          body: RefreshIndicator(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: dashboardProvider.commentsList.isEmpty
                    ? const NoResultView()
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: dashboardProvider.commentsList.length,
                        itemBuilder: (context, index) {
                          CommentsResponseModel commentsResponseModel =
                              dashboardProvider.commentsList.elementAt(index);
                          return Card(
                            surfaceTintColor: AppColors.white,
                            color: AppColors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColors.grey,
                                    child: CommonTextWidget(
                                      text: (commentsResponseModel.name ?? "")
                                          .split('')
                                          .map((char) => char)
                                          .toList()
                                          .first
                                          .toUpperCase(),
                                    ),
                                  ),
                                  smallSizedBox(isWidth: true),
                                  SizedBox(
                                    width:
                                        AppSizes.getWidth(context, percent: 75),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: "${TextConstants.name}: ",
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                                  AppSizes.defaultFontSize,
                                              color: AppColors.grey,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: commentsResponseModel
                                                        .name ??
                                                    "",
                                                style: GoogleFonts.poppins(
                                                  fontSize:
                                                      AppSizes.defaultFontSize,
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        smallSizedBox(),
                                        RichText(
                                          text: TextSpan(
                                            text: "${TextConstants.email}: ",
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                                  AppSizes.defaultFontSize,
                                              color: AppColors.grey,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    dashboardProvider.isMasked()
                                                        ? (commentsResponseModel
                                                                    .email ??
                                                                "")
                                                            .maskEmail()
                                                        : (commentsResponseModel
                                                                .email ??
                                                            ""),
                                                style: GoogleFonts.poppins(
                                                  fontSize:
                                                      AppSizes.defaultFontSize,
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        smallSizedBox(),
                                        CommonTextWidget(
                                          text:
                                              commentsResponseModel.body ?? "",
                                          color: AppColors.black,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
              ),
              onRefresh: () async {
                dashboardProvider.getCommentsList();
              }),
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<DashboardProvider>(context, listen: false).getCommentsList();
  }
}
