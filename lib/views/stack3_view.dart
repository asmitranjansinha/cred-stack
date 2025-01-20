import 'package:cred_assignment/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/stack_controller.dart';

class Stack3View extends StatelessWidget {
  const Stack3View({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeUtils = SizeUtils(context);

    return Consumer<StackController>(builder: (context, controller, child) {
      final stackItem = controller.stackItems[2];

      return Container(
        height: sizeUtils.heightPercentage(55),
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
              padding: EdgeInsets.symmetric(
                horizontal: sizeUtils.widthPercentage(7),
                vertical: sizeUtils.heightPercentage(5),
              ),
              child: Column(
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
                  25.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              sizeUtils.widthPercentage(2),
                            ),
                            child: Image.asset(
                              "assets/images/HDFC-icon.png",
                              width: sizeUtils.widthPercentage(12),
                            ),
                          ),
                          15.widthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                stackItem.openState?.body?.items?[0].title ??
                                    "",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: sizeUtils.widthPercentage(3.4),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              3.heightBox,
                              Text(
                                "${stackItem.openState?.body?.items?[0].subtitle}",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: sizeUtils.widthPercentage(3.4),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: sizeUtils.widthPercentage(5),
                        ),
                      ),
                    ],
                  ),
                  20.heightBox,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(sizeUtils.widthPercentage(6)),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeUtils.widthPercentage(3),
                      vertical: sizeUtils.widthPercentage(2),
                    ),
                    child: Text(
                      stackItem.openState?.body?.footer ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeUtils.widthPercentage(3),
                      ),
                    ),
                  )
                ],
              ),
            ),
            bottomSheet: InkWell(
              onTap: () {},
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
      );
    });
  }
}
