import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DraftPage extends StatelessWidget {
  DraftPage({super.key});
  // int mylength = 2;

  RxInt month = 1.obs;
  RxBool isVisiable = false.obs;

  @override
  Widget build(BuildContext context) {
    calculation() {
      int calculation_result;
      calculation_result = DateUtils.getDaysInMonth(2023, month.value);
      return calculation_result;
    }

    // var monthlength = DateUtils.getDaysInMonth(2023, month.value).obs;
    // print(monthlength);

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Column(
                    children: [
                      Visibility(
                          visible: false,
                          child: Text(isVisiable.value.toString())),
                      GestureDetector(
                        onTap: () {
                          if (month.value == 1) {
                            month.value = 5;
                          } else {
                            month.value--;
                          }
                          print(month.value);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.remove,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Obx(
                  () => Column(
                    children: [
                      Visibility(
                          visible: false,
                          child: Text(isVisiable.value.toString())),
                      GestureDetector(
                        onTap: () {
                          month++;
                          print("Month value==" + month.toString());
                          // print(monthlength);
                          // mylength.value++;
                          // print(mylength.value);
                          calculation();
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: calculation(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Container(
                            height: 12,
                            width: 100,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(index.toString()),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
