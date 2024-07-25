import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:marquee/marquee.dart';

import '../app_constants/color_constant.dart';

class CommonAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const CommonAppBarWidget(
      {super.key,
      required this.routeLink,
      this.imageUrl,
      this.pathParams,
      required this.text});

  final String routeLink;
  final Map<String, String>? pathParams;
  final String? imageUrl;
  final String text;

  @override
  State<CommonAppBarWidget> createState() => _CommonAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CommonAppBarWidgetState extends State<CommonAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    // Максимальная ширина текста в пикселях (приблизительная)
    final maxTextWidth = MediaQuery.of(context).size.width - 300;

    // Стиль текста
    const textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    // Создаем текстовый стиль и используем его для вычисления размера текста
    final textSpan = TextSpan(text: widget.text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final isTextOverflow = textPainter.size.width > maxTextWidth;
    return AppBar(
      leading: InkWell(
        onTap: () {
          if (widget.pathParams != null) {
            context.goNamed(widget.routeLink,
                pathParameters: widget.pathParams!);
          } else {
            context.go("/${widget.routeLink}");
          }
        },
        child: const Icon(
          FontAwesomeIcons.chevronLeft,
          color: ColorConstant.grayColor,
        ),
      ),
      backgroundColor: ColorConstant.appBarColor,
      centerTitle: true,
      title: SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.imageUrl != null
                ? Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(widget.imageUrl!),
                      fit: BoxFit.contain,
                    )),
                  )
                : const SizedBox(),
            SizedBox(
              width: 5.w,
            ),
            isTextOverflow
                ? Expanded(
                    child: Marquee(
                      text: widget.text,
                      style: textStyle,
                      scrollAxis: Axis.horizontal,
                      blankSpace: 20.0,
                      velocity: 100.0,
                      pauseAfterRound: const Duration(seconds: 1),
                      startPadding: 10.0,
                      accelerationDuration: const Duration(seconds: 1),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: const Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeOut,
                    ),
                  )
                : Text(
                    widget.text,
                    style: textStyle,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  )
          ],
        ),
      ),
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(
      //     bottom: Radius.circular(10),
      //   ),
      // ),
    );
  }
}
