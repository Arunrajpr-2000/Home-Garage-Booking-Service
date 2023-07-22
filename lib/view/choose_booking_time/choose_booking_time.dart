import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/common/snackbar.dart';
import 'package:accent_service_app/model/service_model.dart';
import 'package:accent_service_app/view/payment_screen/payment_screen.dart';
import 'package:accent_service_app/view/payment_screen/widget/textfield_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BookingDateTime extends StatefulWidget {
  BookingDateTime({Key? key, required this.serviceModel}) : super(key: key);
  ServiceModel serviceModel;
  @override
  // ignore: library_private_types_in_public_api
  _BookingDateTimeState createState() => _BookingDateTimeState();
}

class _BookingDateTimeState extends State<BookingDateTime> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final detailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff74d3d9),
        title: const Text(
          'Select Available Date and Time',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: <Color>[
              Color(0xff74d3d9),
              Color(0xff1a1b1f),
              Color(0xff1a1b1f),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextfieldContainer(
                  controller: detailcontroller,
                  leadingIcon: const Icon(
                    Icons.document_scanner,
                    color: Colors.white,
                  ),
                  hinttext: 'Estimate details of needed service',
                ),
                k30height,
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Selected Date and Time:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        selectedDate != null
                            ? 'Date: ${selectedDate!.toString().split(' ')[0]}'
                            : 'No date selected',
                        style: const TextStyle(
                            fontSize: 16.0, color: Colors.white),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        selectedTime != null
                            ? 'Time: ${selectedTime!.format(context)}'
                            : 'No time selected',
                        style: const TextStyle(
                            fontSize: 16.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                k20height,
                ElevatedButton(
                  onPressed: () {
                    DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      onConfirm: (date) {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                      currentTime: selectedDate,
                      locale: LocaleType.en,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    selectedDate != null
                        ? 'Selected Date: ${selectedDate!.toString().split(' ')[0]}'
                        : 'Select Date',
                    style: const TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    DatePicker.showTimePicker(
                      context,
                      showTitleActions: true,
                      onConfirm: (time) {
                        setState(() {
                          selectedTime = TimeOfDay.fromDateTime(time);
                        });
                      },
                      currentTime: selectedTime != null
                          ? DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                              selectedTime!.hour,
                              selectedTime!.minute)
                          : DateTime.now(),
                      locale: LocaleType.en,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    selectedTime != null
                        ? 'Selected Time: ${selectedTime!.format(context)}'
                        : 'Select Time',
                    style: const TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () async {
                    if (detailcontroller.text.isEmpty) {
                      debugPrint('Please add Estimate Details');
                      Utils.showSnackBar(
                        context: context,
                        text: 'Please add Estimate Details',
                      );
                    } else if (selectedDate == null) {
                      debugPrint('Please add Available Date');
                      Utils.showSnackBar(
                        context: context,
                        text: 'Please add Available Date',
                      );
                    } else if (selectedTime == null) {
                      debugPrint('Please add Available Time');
                      Utils.showSnackBar(
                        context: context,
                        text: 'Please add Available Time',
                      );
                    } else {
                      Get.to(PaymentScreen(
                        availabledate: selectedDate!.toString().split(' ')[0],
                        availabletime: selectedTime!.format(context),
                        estimatedetails: detailcontroller.text,
                        serviceModel: ServiceModel(
                          discount: widget.serviceModel.discount,
                          cartImg: widget.serviceModel.cartImg,
                          mainservicename: widget.serviceModel.mainservicename,
                          specificservicename:
                              widget.serviceModel.specificservicename,
                          price: widget.serviceModel.price,
                          backgroundImg: widget.serviceModel.backgroundImg,
                          description: widget.serviceModel.description,
                          imgsubheading: widget.serviceModel.imgsubheading,
                        ),
                      ));
                    }
                  },
                  child: const Text('Confirm Selected Date and Time'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
