import 'package:accent_service_app/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineTileDemo extends StatelessWidget {
  TimelineTileDemo({Key? key, required this.orderModel}) : super(key: key);

  final OrderModel orderModel;

  List<String> status = ['Pending', 'Accepted', 'Progress', 'Finished'];
  List<String> statusSub = [
    'Waiting for confirm',
    'Accepted your booking, wait for your worker',
    'Work in Progress',
    'Work Finished'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        bool isCompleted = orderModel.isDelivered;
        // bool ispending = orderModel.ispending;
        // bool isaccept = orderModel.isaccepted;
        // bool istarted = orderModel.isworkstarted;

        switch (index) {
          case 0:
            isCompleted = orderModel.ispending;
            break;
          case 1:
            isCompleted = orderModel.isaccepted;
            break;
          case 2:
            isCompleted = orderModel.isworkstarted;
            break;
          case 3:
            isCompleted = orderModel.isDelivered;
            break;
        }

        return TimelineTile(
          axis: TimelineAxis.vertical,
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          isFirst: index == 0,
          isLast: index == 3,
          beforeLineStyle:
              LineStyle(color: isCompleted ? Colors.green : Colors.grey),
          afterLineStyle:
              LineStyle(color: isCompleted ? Colors.green : Colors.grey),
          indicatorStyle: IndicatorStyle(
            width: 20,
            color: isCompleted ? Colors.green : Colors.white,
            // padding: EdgeInsets.all(6),
          ),
          endChild: Container(
            constraints: const BoxConstraints(
              minHeight: 50,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              // border: Border.all(
              //   color: isCompleted ? Colors.green : Colors.white,
              //   width: 2,
              // ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  status[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          startChild: Container(),
        );
      },
    );
  }
}
