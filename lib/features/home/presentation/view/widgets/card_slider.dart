import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:graduation_project/features/home/presentation/view/widgets/slider_item.dart';

final List<List> imgList = [
  ['Chat with our AI chatbot', Icons.chat_rounded, 'Start Chatting'],
  ['Progress Tracker', Icons.track_changes, 'See your track']
];

class CardSlider extends StatelessWidget {
  final List<Widget> imageSliders = imgList
      .map((item) =>
          SliderItem(title: item[0], icon: item[1], buttonText: item[2]))
      .toList();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 90 / 38,
          disableCenter: true,
          viewportFraction: 0.1,
          padEnds: false),
      items: imageSliders,
    );
  }
}
