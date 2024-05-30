import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../../../core/services/image_service.dart';
import '../../../domain/entities/career_quiz_creator_entity.dart';

class CareerQuizAuthorWidget extends StatelessWidget {
  const CareerQuizAuthorWidget({super.key,required this.careerAuthor});
  final CareerQuizCreatorEntity careerAuthor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      constraints: BoxConstraints(
          minHeight: 220.h
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.w),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ColorConstant.appBarColor, ColorConstant.peachColor]
          ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                    child: GFAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                          getImageFromString(careerAuthor.careerQuizAuthor?.file?.url,),
                      ),
                      radius: 75.w,
                      shape: GFAvatarShape.circle
                    )
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${careerAuthor.careerQuizAuthor?.name}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          Text(
                            "${careerAuthor.careerQuizAuthor?.positionRu}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Divider(
              height: 2.h,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Об авторе:",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            Html(
                              data: '${careerAuthor.careerQuizAuthor?.descriptionRu}',
                              style: {
                                "ul":Style(
                                  color: Colors.white,
                                  fontSize: FontSize(12),
                                  padding: HtmlPaddings.zero,
                                )
                              },

                            ),
                          ],
                        )
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Text(
                  "Автор в соцсетях:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 10.h,),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: _getAuthorSocialNetwork(),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }

  List<Widget> _getAuthorSocialNetwork(){
    List<Widget> socials = [];
    if(careerAuthor.careerQuizAuthor?.facebookUrl != null){
      socials.add(_getSocialNetworkIconDesign(FontAwesomeIcons.facebookF, careerAuthor.careerQuizAuthor!.facebookUrl??""));
    }
    if(careerAuthor.careerQuizAuthor?.instagramUrl != null){
      socials.add(_getSocialNetworkIconDesign(FontAwesomeIcons.instagram, careerAuthor.careerQuizAuthor!.instagramUrl??""));
    }
    if(careerAuthor.careerQuizAuthor?.linkedinUrl != null){
      socials.add(_getSocialNetworkIconDesign(FontAwesomeIcons.linkedinIn, careerAuthor.careerQuizAuthor!.linkedinUrl??""));
    }
    if(careerAuthor.careerQuizAuthor?.vkUrl != null){
      socials.add(_getSocialNetworkIconDesign(FontAwesomeIcons.vk, careerAuthor.careerQuizAuthor!.vkUrl??""));
    }
    if(careerAuthor.careerQuizAuthor?.phone != null){
      socials.add(_getSocialNetworkIconDesign(FontAwesomeIcons.phone, careerAuthor.careerQuizAuthor!.phone??""));
    }
    if(careerAuthor.careerQuizAuthor?.email != null){
      socials.add(_getSocialNetworkIconDesign(FontAwesomeIcons.envelope, careerAuthor.careerQuizAuthor!.email??""));
    }
    if(careerAuthor.careerQuizAuthor?.site != null){
      socials.add(_getSocialNetworkIconDesign(FontAwesomeIcons.sitemap, careerAuthor.careerQuizAuthor!.site??""));
    }
    return socials;
  }

  Widget _getSocialNetworkIconDesign(IconData icon, String url){
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white,width: 2)
      ),
      child: Center(
        child: Icon(icon, size: 18, color: Colors.white),
      ),
    );


  }
}
