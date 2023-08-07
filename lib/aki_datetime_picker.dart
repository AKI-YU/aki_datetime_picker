library aki_datetime_picker;

import 'package:aki_datetime_picker/utils/date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AKIDateTimePicker extends StatefulWidget {
  final DateTime? selDate;
  final double? height;
  final double? width;
  final Color? color;
  final Color? colorMask;
  final Function? onChange;
  final int? startYear;
  final int? endYear;
  final String? lblYear;
  final String? lblMonth;
  final String? lblDay;
  final String? lblHour;
  final String? lblMin;

  const AKIDateTimePicker(
      {this.selDate,
      this.onChange,
      this.height = 120,
      this.width = 300,
      this.color = Colors.purple,
      this.colorMask,
      this.startYear = 1900,
      this.endYear = 2050,
      this.lblYear = "Y",
      this.lblMonth = "M",
      this.lblDay = "D",
      this.lblHour = "H",
      this.lblMin = "m",
      super.key});

  @override
  State<AKIDateTimePicker> createState() => _AKIDateTimePickerState();
}

class _AKIDateTimePickerState extends State<AKIDateTimePicker> {
  int startYear = 1900;
  int endYear = 2050;
  int selectedYear = 0;
  int selectedMonth = 1;
  int selectedDay = 1;
  int selectedHour = 0;
  int selectedMin = 0;
  int daysinMonth = 30;

  late FixedExtentScrollController dayScroll;

  @override
  void initState() {
    super.initState();

    startYear = widget.startYear!;
    endYear = widget.endYear!;

    if (widget.selDate == null) {
      selectedYear = 0;
    } else {
      var nowStr = dateToStr(widget.selDate!, f: "yyyy-MM-dd HH:mm:ss");
      selectedYear = int.parse(nowStr.split("-")[0]) - startYear;
      selectedMonth = int.parse(nowStr.split("-")[1]);
      selectedDay = int.parse(nowStr.split(" ")[0].split("-")[2]);
      selectedHour = int.parse(nowStr.split(" ")[1].split(":")[0]);
      selectedMin = int.parse(nowStr.split(" ")[1].split(":")[1]);
    }

    dayScroll = FixedExtentScrollController(
      initialItem: selectedDay - 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        color: Colors.white,
        child: Stack(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: CupertinoPicker.builder(
                    squeeze: 0.96,
                    diameterRatio: 10,
                    childCount: endYear - startYear,
                    selectionOverlay:
                        const CupertinoPickerDefaultSelectionOverlay(
                      background: Colors.transparent,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Text((startYear + index).toString(),
                            style: const TextStyle(fontSize: 20)),
                      );
                    },
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedYear,
                    ),
                    itemExtent: 59.0,
                    backgroundColor: Colors.transparent,
                    onSelectedItemChanged: (int index) {
                      selectedYear = index;
                      selectedMonth = selectedMonth;
                      daysinMonth =
                          getMonthDays(startYear + selectedYear, selectedMonth);

                      if (selectedDay >= daysinMonth) {
                        selectedDay = daysinMonth - 1;
                        dayScroll.jumpToItem(
                          selectedDay,
                        );
                      }
                      if (widget.onChange != null) {
                        widget.onChange!(
                            "${selectedYear + startYear}-$selectedMonth-$selectedDay $selectedHour:$selectedMin");
                      }
                    })),
            Text(widget.lblYear ?? " ",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                )),
            Expanded(
                child: CupertinoPicker.builder(
                    diameterRatio: 10,
                    squeeze: 0.96,
                    selectionOverlay:
                        const CupertinoPickerDefaultSelectionOverlay(
                      background: Colors.transparent,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: Text((index + 1).toString().padLeft(2, "0"),
                            style: const TextStyle(fontSize: 20)),
                      );
                    },
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedMonth - 1,
                    ),
                    itemExtent: 59.0,
                    childCount: 12,
                    backgroundColor: Colors.transparent,
                    onSelectedItemChanged: (int index) {
                      selectedYear = selectedYear;
                      selectedMonth = index + 1;
                      daysinMonth =
                          getMonthDays(startYear + selectedYear, selectedMonth);

                      if (selectedDay >= daysinMonth) {
                        selectedDay = daysinMonth - 1;
                        dayScroll.jumpToItem(
                          daysinMonth - 1,
                        );
                      }
                      if (widget.onChange != null) {
                        widget.onChange!(
                            "${selectedYear + startYear}-$selectedMonth-$selectedDay $selectedHour:$selectedMin");
                      }
                    })),
            const SizedBox(
              width: 5,
            ),
            Text(widget.lblMonth ?? " ",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                )),
            Expanded(
                child: CupertinoPicker.builder(
              diameterRatio: 10,
              squeeze: 0.96,
              childCount: daysinMonth,
              selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
                background: Colors.transparent,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Text((index + 1).toString().padLeft(2, "0"),
                      style: const TextStyle(
                        fontSize: 20,
                      )),
                );
              },
              scrollController: dayScroll,
              itemExtent: 59.0,
              backgroundColor: Colors.transparent,
              onSelectedItemChanged: (int index) {
                selectedDay = index + 1;
                if (widget.onChange != null) {
                  widget.onChange!(
                      "${selectedYear + startYear}-$selectedMonth-$selectedDay $selectedHour:$selectedMin");
                }
              },
            )),
            const SizedBox(
              width: 5,
            ),
            Text(widget.lblDay ?? " ",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                )),
            Expanded(
              child: CupertinoPicker.builder(
                diameterRatio: 10,
                squeeze: 0.96,
                childCount: 24,
                selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
                  background: Colors.transparent,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      (index).toString().padLeft(2, "0"),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                },
                scrollController: FixedExtentScrollController(
                  initialItem: selectedHour,
                ),
                itemExtent: 59.0,
                backgroundColor: Colors.transparent,
                onSelectedItemChanged: (int index) {
                  selectedHour = index;
                  if (widget.onChange != null) {
                    widget.onChange!(
                        "${selectedYear + startYear}-$selectedMonth-$selectedDay $selectedHour:$selectedMin");
                  }
                },
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(widget.lblHour ?? " ",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                )),
            Expanded(
                child: CupertinoPicker.builder(
              diameterRatio: 10,
              squeeze: 0.96,
              childCount: (60),
              selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
                background: Colors.transparent,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    (index).toString().padLeft(2, "0"),
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              },
              scrollController: FixedExtentScrollController(
                initialItem: selectedMin,
              ),
              itemExtent: 59.0,
              backgroundColor: Colors.transparent,
              onSelectedItemChanged: (int index) {
                selectedMin = index;
                if (widget.onChange != null) {
                  widget.onChange!(
                      "${selectedYear + startYear}-$selectedMonth-$selectedDay $selectedHour:$selectedMin");
                }
              },
            )),
            const SizedBox(
              width: 5,
            ),
            Text(widget.lblMin ?? " ",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                )),
            const SizedBox(
              width: 15,
            )
          ]),
          IgnorePointer(
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: widget.width,
                  height: 64,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: widget.color!)),
                )),
          )
        ]));
  }
}
