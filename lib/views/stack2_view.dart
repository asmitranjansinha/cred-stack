import 'package:cred_assignment/controllers/stack_controller.dart';
import 'package:cred_assignment/models/stack_item_model.dart';
import 'package:cred_assignment/views/stack3_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/size_utils.dart';

class Stack2View extends StatelessWidget {
  const Stack2View({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeUtils = SizeUtils(context);

    return Consumer<StackController>(builder: (context, controller, child) {
      final stackItem = controller.stackItems[1];

      return WillPopScope(
        onWillPop: () async {
          if (controller.isStack3Opened) {
            Navigator.pop(context);
            controller.toggleStack3Open(false);
            return false;
          }
          return true;
        },
        child: Container(
          height: sizeUtils.heightPercentage(70),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 26, 39, 46),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(sizeUtils.widthPercentage(6)),
              topRight: Radius.circular(sizeUtils.widthPercentage(6)),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(sizeUtils.widthPercentage(6)),
              topRight: Radius.circular(sizeUtils.widthPercentage(6)),
            ),
            child: Scaffold(
              backgroundColor: Color.fromARGB(255, 26, 39, 46),
              body: Padding(
                padding: EdgeInsets.only(
                  left: sizeUtils.widthPercentage(7),
                  top: sizeUtils.heightPercentage(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.isStack3Opened
                        ? Padding(
                            padding: EdgeInsets.only(
                              right: sizeUtils.widthPercentage(7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      stackItem.closedState?.body?['key1'] ??
                                          "",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: sizeUtils.widthPercentage(3),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    6.heightBox,
                                    Text(
                                      stackItem
                                              .openState
                                              ?.body
                                              ?.items?[controller.selectedPlan]
                                              .emi ??
                                          "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: sizeUtils.widthPercentage(4),
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.dotted,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      stackItem.closedState?.body?['key2'] ??
                                          "",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: sizeUtils.widthPercentage(3),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    6.heightBox,
                                    Text(
                                      stackItem
                                              .openState
                                              ?.body
                                              ?.items?[controller.selectedPlan]
                                              .duration ??
                                          "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: sizeUtils.widthPercentage(4),
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.dotted,
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
                            ),
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
                              Padding(
                                padding: EdgeInsets.only(
                                  right: sizeUtils.widthPercentage(7),
                                ),
                                child: Text(
                                  stackItem.openState?.body?.subtitle ?? "",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: sizeUtils.widthPercentage(3),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    30.heightBox,
                    body(sizeUtils, controller)
                  ],
                ),
              ),
              bottomSheet: InkWell(
                onTap: () {
                  controller.toggleStack3Open(true);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (ctx) => Stack3View(),
                  ).whenComplete(() {
                    controller.toggleStack3Open(false);
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
                    stackItem.ctaText ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: sizeUtils.widthPercentage(3.7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget body(SizeUtils sizeUtils, StackController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: sizeUtils.widthPercentage(43),
          child: ListView.builder(
            shrinkWrap: true,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: controller.stackItems[1].openState?.body?.items?.length,
            itemBuilder: (context, index) {
              return planCard(
                sizeUtils,
                controller.stackItems[1].openState!.body!.items![index],
                index == 1
                    ? const Color.fromARGB(116, 26, 9, 28)
                    : index == 2
                        ? const Color.fromARGB(116, 6, 29, 56)
                        : const Color.fromARGB(132, 65, 4, 14),
                index == controller.selectedPlan,
                () {
                  controller.setSelectedPlan(index);
                },
              );
            },
          ),
        ),
        20.heightBox,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(sizeUtils.widthPercentage(6)),
            border: Border.all(
              color: Colors.white,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: sizeUtils.widthPercentage(3),
            vertical: sizeUtils.widthPercentage(2),
          ),
          child: Text(
            controller.stackItems[1].openState?.body?.footer ?? "",
            style: TextStyle(
              color: Colors.white,
              fontSize: sizeUtils.widthPercentage(3),
            ),
          ),
        )
      ],
    );
  }

  Widget planCard(SizeUtils sizeUtils, ItemData stackItem, Color color,
      bool isSelected, void Function() onTap) {
    return Padding(
      padding: EdgeInsets.only(
        right: sizeUtils.widthPercentage(2),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          sizeUtils.widthPercentage(6),
        ),
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: sizeUtils.widthPercentage(43),
              width: sizeUtils.widthPercentage(40),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(
                  sizeUtils.widthPercentage(6),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: sizeUtils.widthPercentage(4),
                vertical: sizeUtils.heightPercentage(2.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      15.heightBox,
                      Container(
                        height: sizeUtils.widthPercentage(7),
                        width: sizeUtils.widthPercentage(7),
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: isSelected
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                                size: sizeUtils.widthPercentage(5),
                              )
                            : null,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stackItem.emi ?? "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: sizeUtils.widthPercentage(3.7),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "for ${stackItem.duration}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: sizeUtils.widthPercentage(3.7),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      10.heightBox,
                      Text(
                        stackItem.subtitle ?? "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: sizeUtils.widthPercentage(2.6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            stackItem.tag != null
                ? Positioned(
                    top: -6,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(sizeUtils.widthPercentage(6)),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: sizeUtils.widthPercentage(4),
                        vertical: sizeUtils.widthPercentage(1),
                      ),
                      child: Text(
                        stackItem.tag ?? "",
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: sizeUtils.widthPercentage(2),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
