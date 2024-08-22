import 'package:flutter/material.dart';
import 'package:linkfy_text/linkfy_text.dart';
import '../../../../../common/common.dart';

class PostTextWidget extends StatelessWidget {
  String? content;
  bool? withDivider;

  PostTextWidget({super.key, this.content, this.withDivider});

  @override
  Widget build(BuildContext context) {
    return content != null
        ? Column(
            children: [
              Container(
                child: LinkifyText(
                  content ?? "",
                  linkStyle: TextStyle(color: AppColors.primaryColor, fontFamily: "Glory", fontWeight: FontWeight.w600, fontSize: 16),
                  linkTypes: [LinkType.userTag],
                  textStyle: TextStyle(color: AppColors.postTextColor, fontFamily: "Glory", fontWeight: FontWeight.w400, fontSize: 16),
                  onTap: (link) {},
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              withDivider == true
                  ? Divider(
                      thickness: 1,
                      color: AppColors.dividerColor.withOpacity(0.6),
                    )
                  : const SizedBox.shrink(),
            ],
          )
        : const SizedBox.shrink();
  }
}
