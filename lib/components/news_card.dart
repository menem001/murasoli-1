// ignore: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class NewsCard extends StatelessWidget {
  NewsCard(
      {super.key,
      required this.newsTitle,
      required this.date,
      required this.newsDis,
      required this.image,
      this.onTap,
      required this.editionid});

  final String newsTitle;
  final String date;
  final String image;
  final String editionid;
  final String newsDis;
  var onTap;
  @override
  String districtShort = "";
  Widget build(BuildContext context) {
    if (editionid == "1") {
      districtShort = "CHN";
    } else if (editionid == "3") {
      districtShort = "MDU";
    } else if (editionid == "4") {
      districtShort = "TPJ";
    } else if (editionid == "2") {
      districtShort = "CBE";
    }else if (editionid == "5") {
      districtShort = "VLR";
    }
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CachedNetworkImage(
          //   height: 100.h,
          //   width: 100.h,
          //   imageUrl: image,
          //   imageBuilder: (context, imageProvider) => Container(
          //     decoration: BoxDecoration(
          //         image: DecorationImage(
          //       image: imageProvider,
          //       fit: BoxFit.cover,
          //     )),
          //   ),
          //   placeholder: (context, url) => Container(),
          //   errorWidget: (context, url, error) => Icon(Icons.error),
          // ),
          // Container(
          //   height: 100.h,
          //   width: 100.h,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           fit: BoxFit.cover,
          //           alignment: Alignment.topCenter,
          //           image: ),
          //       borderRadius: BorderRadius.circular(12)),
          // ),
          if (image != "")
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://admin.murasoli.in/assets/layout/Documents/$image",
                height: 100.h,
                width: 100.h,
                fit: BoxFit.cover,
              ),
            ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newsTitle,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    // color: Theme.of(context).primaryColor,
                    fontSize: 14.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                newsDis,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 10.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                children: [
                  Text(
                    "${districtShort} ",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFA7A7A7),
                        fontSize: 12.sp),
                  ),
                  // Icon(
                  //   Icons.calendar_month,
                  //   color: const Color(0xFFA7A7A7),
                  //   size: 14.sp,
                  // ),
                  Expanded(
                    child: Text(
                      " ${date}",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA7A7A7),
                          fontSize: 12.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      margin: EdgeInsets.only(right: 5.w),
                      child: SvgPicture.asset(
                        "assets/svg/share.svg",
                        color: Colors.black,
                        height: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
