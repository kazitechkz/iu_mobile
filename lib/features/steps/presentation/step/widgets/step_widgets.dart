import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/features/steps/domain/entities/step_entity.dart';
import 'package:transformable_list_view/transformable_list_view.dart';
import '../../../../../core/services/image_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
Widget courseGrid(MainStepEntity stepEntity, BuildContext context) {
  return Container(
    margin: EdgeInsets.all(5.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.w),
      gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            ColorConstant.darkOrangeColor,
            ColorConstant.appBarColor,
          ])
    ),
    child: GFListTile(
      padding: EdgeInsets.all(10.h),
        avatar: GFAvatar(
          backgroundImage: AssetImage(getSubjectImagePath(stepEntity.id)),
          // backgroundImage: getImageProviderFromServer(stepEntity.image?.url),
        ),
        title: Text(stepEntity.getLocalizedTitle(context), style: TextStyle(color: Colors.white, fontSize: 16.sp)),
        subTitle: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${AppLocalizations.of(context)!.steps_title}: ${stepEntity.steps_count}', style: TextStyle(color: Colors.white60, fontSize: 14.sp)),
              Text('${AppLocalizations.of(context)!.sub_steps_title}: ${stepEntity.sub_steps_count}', style: TextStyle(color: Colors.white60, fontSize: 14.sp))
            ],
          ),
        ),
        description: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: GFProgressBar(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              percentage: stepEntity.progress/100,
              lineHeight: 14,
              alignment: MainAxisAlignment.spaceBetween,
              // leading  : const Icon( Icons.sentiment_dissatisfied, color: GFColors.DANGER),
              // trailing: const Icon( Icons.sentiment_satisfied, color: GFColors.SUCCESS),
              backgroundColor: Colors.black26,
              progressBarColor: GFColors.INFO,
              child: Text('${stepEntity.progress}%', textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
        ),
    ),
  );
}


class TransformMatrices {
  static Matrix4 scaleDown(TransformableListItem item) {
    /// final scale of child when the animation is completed
    const endScaleBound = 0.3;

    /// 0 when animation completed and [scale] == [endScaleBound]
    /// 1 when animation starts and [scale] == 1
    final animationProgress = item.visibleExtent / item.size.height;

    /// result matrix
    final paintTransform = Matrix4.identity();

    /// animate only if item is on edge
    if (item.position != TransformableListItemPosition.middle) {
      final scale = endScaleBound + ((1 - endScaleBound) * animationProgress);

      paintTransform
        ..translate(item.size.width / 2)
        ..scale(scale)
        ..translate(-item.size.width / 2);
    }

    return paintTransform;
  }

  static Matrix4 rotate(TransformableListItem item) {
    /// rotate item to 90 degrees
    const maxRotationTurnsInRadians = pi / 2.0;

    /// 0 when animation starts and [rotateAngle] == 0 degrees
    /// 1 when animation completed and [rotateAngle] == 90 degrees
    final animationProgress = 1 - item.visibleExtent / item.size.height;

    /// result matrix
    final paintTransform = Matrix4.identity();

    /// animate only if item is on edge
    if (item.position != TransformableListItemPosition.middle) {
      /// rotate to the left if even
      /// rotate to the right if odd
      final isEven = item.index?.isEven ?? false;

      /// To select corner of the rotation
      final FractionalOffset fractionalOffset;
      final int rotateDirection;

      switch (item.position) {
        case TransformableListItemPosition.topEdge:
          fractionalOffset = isEven
              ? FractionalOffset.bottomLeft
              : FractionalOffset.bottomRight;
          rotateDirection = isEven ? -1 : 1;
          break;
        case TransformableListItemPosition.middle:
          return paintTransform;
        case TransformableListItemPosition.bottomEdge:
          fractionalOffset =
          isEven ? FractionalOffset.topLeft : FractionalOffset.topRight;
          rotateDirection = isEven ? 1 : -1;
          break;
      }

      final rotateAngle = animationProgress * maxRotationTurnsInRadians;
      final translation = fractionalOffset.alongSize(item.size);

      paintTransform
        ..translate(translation.dx, translation.dy)
        ..rotateZ(rotateDirection * rotateAngle)
        ..translate(-translation.dx, -translation.dy);
    }

    return paintTransform;
  }

  static Matrix4 wheel(TransformableListItem item) {
    /// rotate item to 36 degrees
    const maxRotationTurnsInRadians = pi / 5.0;
    const minScale = 0.6;
    const maxScale = 1.0;

    /// perception of depth when the item rotates
    const depthFactor = 0.01;

    /// offset when [animationProgress] == 0
    final medianOffset = item.constraints.viewportMainAxisExtent / 2;
    final animationProgress =
        1 - item.offset.dy.clamp(0, double.infinity) / medianOffset;
    final scale = minScale + (maxScale - minScale) * animationProgress.abs();

    /// alignment of item
    final translationOffset = FractionalOffset.center.alongSize(item.size);
    final rotationMatrix = Matrix4.identity()
      ..setEntry(3, 2, depthFactor)
      ..rotateX(maxRotationTurnsInRadians * animationProgress)
      ..scale(scale);

    final result = Matrix4.identity()
      ..translate(translationOffset.dx, translationOffset.dy)
      ..multiply(rotationMatrix)
      ..translate(-translationOffset.dx, -translationOffset.dy);

    return result;
  }
}