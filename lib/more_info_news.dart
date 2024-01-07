 
import 'package:flutter/material.dart';
import 'package:news/constant/constant.dart';
 
import 'package:url_launcher/url_launcher.dart';

import 'constant/app_colors.dart';
import 'widget/more_info_header.dart';

class MoreInfoNews extends StatelessWidget {
  final String? date;
  final String? sourceName;
  final String? title;
  final String? country;
  final String? language;
  final String? desc;
  final String? content;
  final String? image;
  final String? sourceUrl;
  const MoreInfoNews(
      {Key? key,
      this.date,
      this.image,
      this.sourceName,
      this.title,
      this.country,
      this.language,
      this.desc,
      this.content,
      this.sourceUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GestureDetector(
                  onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back_ios)),
              MoreInfoHeader(
                date: date ?? "",
                source: sourceName ?? "",
              ),
              Text(
                title ?? "",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  // fontFamily: AppFont.interBold,
                  // color: _Colors.primaryColorDark,
                ),
              ),
              const SizedBox(height: 35),
              const Text(
                "Description:",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  // fontFamily: AppFont.interBold,
                  // color: _Colors.primaryColorDark,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                desc ?? "",
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 14,
                  // fontFamily: AppFont.interMedium,
                ),
              ),
              const SizedBox(height: 35),
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: [
                  const Text(
                    "Read News",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      // fontFamily: AppFont.interBold,
                      // color: _Colors.primaryColorDark,
                    ),
                  ),
                  image == null
                      ? Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 20),
                          alignment: Alignment.center,
                          width: context.deviceWidth() / 1.2,
                          height: context.deviceHeight() / 3,
                          decoration: BoxDecoration(
                              color: primaryColor, borderRadius: BorderRadius.circular(20)),
                          child: const Text("Image Preview Unavailable",
                              style: TextStyle(
                                  fontSize: 14,
                                  // fontFamily: AppFont.interMedium,
                                  color: Colors.white)),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 20),
                          width: context.deviceWidth() / 1.2,
                          height: context.deviceHeight() / 3,
                          decoration: BoxDecoration(
                              color: primaryColorDark,
                              image: DecorationImage(
                                image: NetworkImage(image!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                  Text(
                    content ?? "",
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 14,
                      // fontFamily: AppFont.interRegular,
                      // color: _Colors.textBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _launchURL(sourceUrl),
                    child: const Align(
                      alignment: Alignment.bottomRight,
                      child: Text("Got to Source Link",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          )),
                    ),
                  )
                ],
              )),
            ])),
      ),
    );
  }

// Function to launch the URL
  void _launchURL(String? url) async {
    if (url != null) {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }
}
