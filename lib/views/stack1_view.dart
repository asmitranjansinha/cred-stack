import 'package:cred_assignment/controllers/stack_controller.dart';
import 'package:cred_assignment/utils/size_utils.dart';
import 'package:cred_assignment/views/stack2_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Stack1View extends StatelessWidget {
  const Stack1View({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeUtils = SizeUtils(context);

    return Consumer<StackController>(
      builder: (context, controller, child) {
        if (controller.isLoading) {
          return SizedBox(
            width: double.infinity,
            child: Lottie.asset(
              "assets/animations/cred-starting-animation.json",
              fit: BoxFit.cover,
            ),
          );
        } else {
          return WillPopScope(
            onWillPop: () async {
              if (controller.isStack2Opened) {
                Navigator.pop(context);
                controller.toggleStack2Open(false);
                return false;
              }
              return true;
            },
            child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 6, 17, 24),
              body: Padding(
                padding: EdgeInsets.only(top: sizeUtils.heightPercentage(5)),
                child: Column(
                  children: [
                    header(sizeUtils),
                    25.heightBox,
                    body(sizeUtils, controller),
                  ],
                ),
              ),
              bottomSheet: InkWell(
                onTap: () {
                  controller.toggleStack2Open(true);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (ctx) => Stack2View(),
                  ).whenComplete(() {
                    controller.toggleStack2Open(false);
                  });
                },
                child: Container(
                  height: sizeUtils.heightPercentage(9),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 20, 68, 151),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(sizeUtils.widthPercentage(6)),
                      topRight: Radius.circular(sizeUtils.widthPercentage(6)),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    controller.stackItems[0].ctaText ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: sizeUtils.widthPercentage(3.7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget header(SizeUtils sizeUtils) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sizeUtils.widthPercentage(3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: sizeUtils.heightPercentage(5),
            width: sizeUtils.widthPercentage(9),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 26, 39, 46),
              borderRadius: BorderRadius.circular(sizeUtils.widthPercentage(5)),
            ),
            padding: EdgeInsets.all(sizeUtils.widthPercentage(1)),
            alignment: Alignment.center,
            child: Text(
              String.fromCharCode(CupertinoIcons.xmark.codePoint),
              style: TextStyle(
                inherit: false,
                color: Colors.grey.shade400,
                fontSize: sizeUtils.widthPercentage(4),
                fontWeight: FontWeight.w900,
                fontFamily: CupertinoIcons.xmark.fontFamily,
                package: CupertinoIcons.xmark.fontPackage,
              ),
            ),
          ),
          Container(
            height: sizeUtils.heightPercentage(5),
            width: sizeUtils.widthPercentage(9),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 26, 39, 46),
              borderRadius: BorderRadius.circular(sizeUtils.widthPercentage(5)),
            ),
            padding: EdgeInsets.all(sizeUtils.widthPercentage(2)),
            alignment: Alignment.center,
            child: Text(
              String.fromCharCode(CupertinoIcons.question.codePoint),
              style: TextStyle(
                inherit: false,
                color: Colors.grey.shade400,
                fontSize: sizeUtils.widthPercentage(4),
                fontWeight: FontWeight.w900,
                fontFamily: CupertinoIcons.question.fontFamily,
                package: CupertinoIcons.question.fontPackage,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget body(SizeUtils sizeUtils, StackController controller) {
    final stackItem = controller.stackItems[0];

    return Container(
      height: sizeUtils.heightPercentage(85),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 26, 39, 46),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(sizeUtils.widthPercentage(6)),
          topRight: Radius.circular(sizeUtils.widthPercentage(6)),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: sizeUtils.widthPercentage(7),
        vertical: sizeUtils.heightPercentage(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          controller.isStack2Opened
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stackItem.closedState?.body?['key1'] ?? "",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: sizeUtils.widthPercentage(3),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        6.heightBox,
                        Text(
                          "₹${controller.sliderInitialValue.round()}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: sizeUtils.widthPercentage(6),
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.dotted,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      CupertinoIcons.chevron_down,
                      color: Colors.grey.shade400,
                      size: sizeUtils.widthPercentage(5),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stackItem.openState?.body?.title ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeUtils.widthPercentage(4.4),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    6.heightBox,
                    Text(
                      stackItem.openState?.body?.subtitle ?? "",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: sizeUtils.widthPercentage(3),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
          22.heightBox,
          Container(
            height: sizeUtils.heightPercentage(50),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(sizeUtils.widthPercentage(6)),
            ),
            padding: EdgeInsets.symmetric(
              vertical: sizeUtils.widthPercentage(7),
              horizontal: sizeUtils.widthPercentage(7),
            ),
            child: Column(
              children: [
                SleekCircularSlider(
                  min: 500,
                  max: 487891,
                  initialValue: controller.sliderInitialValue,
                  onChange: (value) {
                    controller.setSliderValue(value);
                  },
                  appearance: CircularSliderAppearance(
                    size: sizeUtils.widthPercentage(57),
                    angleRange: 360,
                    startAngle: 270,
                    customWidths: CustomSliderWidths(
                      handlerSize: sizeUtils.widthPercentage(4),
                      trackWidth: sizeUtils.widthPercentage(3.5),
                      progressBarWidth: sizeUtils.widthPercentage(3.5),
                    ),
                    customColors: CustomSliderColors(
                      trackColor: const Color.fromARGB(255, 240, 218, 201),
                      progressBarColor: Color.fromARGB(255, 179, 116, 68),
                      hideShadow: true,
                      dotColor: Color.fromARGB(255, 237, 155, 92),
                    ),
                  ),
                  innerWidget: (percentage) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          stackItem.openState?.body?.card?.header ?? "",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: sizeUtils.widthPercentage(3),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "₹${controller.sliderInitialValue.round()}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: sizeUtils.widthPercentage(6),
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.dotted,
                          ),
                        ),
                        5.heightBox,
                        Text(
                          stackItem.openState?.body?.card?.description ?? "",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: sizeUtils.widthPercentage(2.6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                30.heightBox,
                Text(
                  stackItem.openState?.body?.footer ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: sizeUtils.widthPercentage(2.6),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
