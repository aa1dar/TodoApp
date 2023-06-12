import 'package:flutter/material.dart';

import '../../utils/style/app_colors.dart';

class CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double statusBarHeight;
  final Widget expandedTitle;
  final Widget collapsedSubTitle;
  final Widget collapsedTitle;
  final Widget action;
  const CustomHeaderDelegate(
      {required this.action,
      required this.collapsedSubTitle,
      required this.expandedTitle,
      required this.collapsedTitle,
      required this.expandedHeight,
      required this.statusBarHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _buildCollapsedAppBar(shrinkOffset),
        Positioned(
            top: statusBarHeight,
            bottom: 0,
            right: 0,
            left: 0,
            child: _buildExpandedAppBar(shrinkOffset))
      ],
    );
  }

  Widget _buildCollapsedAppBar(double offset) => Opacity(
      opacity: calculateCollapsedOpacity(offset),
      child: AppBar(
          backgroundColor: AppColor.backLightPrimary,
          surfaceTintColor: AppColor.backLightPrimary,
          centerTitle: false,
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: action)
          ],
          title: collapsedTitle));

  Widget _buildExpandedAppBar(double offset) => Opacity(
      opacity: calculateExpandedOpacity(offset),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 60.0, right: 25.0, bottom: 18.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: FittedBox(child: expandedTitle),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [collapsedSubTitle, action],
                  )
                ]),
          )));

  double calculateCollapsedOpacity(double offset) {
    // NOTE: Adding the collapse speed of the appbar
    final opacity = 3 * (offset / expandedHeight);
    if (opacity > 1.0) {
      return 1.0;
    }
    return opacity;
  }

  double calculateExpandedOpacity(double offset) =>
      1 - calculateCollapsedOpacity(offset);

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + statusBarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
