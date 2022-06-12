import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:take_home_pj/api/api_service.dart';
import 'package:take_home_pj/models/take_home_models/prices_response_model.dart';
import 'package:take_home_pj/models/take_home_models/slots_model.dart';
import 'package:take_home_pj/utils/colors.dart';
import 'package:take_home_pj/utils/constants.dart';
import 'package:take_home_pj/utils/string_util.dart';
import 'package:take_home_pj/utils/strings.dart';
import 'package:take_home_pj/utils/toast.dart';

class DashboardHomeView extends StatefulWidget {
  @override
  State<DashboardHomeView> createState() => _DashboardHomeViewState();
}

class _DashboardHomeViewState extends State<DashboardHomeView> {
  late PricesResponseModel pricesResponseModel;
  List<Ounce> pricesModel = [];

  List<SlotsModel> slotsModel = [];
  late SlotsModel selectedDate;

  @override
  void initState() {
    super.initState();
    callPricesApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(STRINGS.home),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              (pricesModel != null && pricesModel.length > 0)
                  ? Container(
                      child: CarouselSlider.builder(
                        itemCount: pricesModel.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 400,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        getDashboardTitle(itemIndex),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            STRINGS.silver + " - ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            pricesModel[itemIndex]
                                                .silver
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            STRINGS.gold + " - ",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            pricesModel[itemIndex]
                                                .gold
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            STRINGS.platinum + " - ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            pricesModel[itemIndex]
                                                .platinum
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                        options: CarouselOptions(
                          height: 200,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    )
                  : SizedBox(
                      child: Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                    ),

              const SizedBox(height: 20),

              ///Date DDL
              (slotsModel.isNotEmpty)
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                          Text("${STRINGS.appointment_available}:",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: COLORS.black)),
                        ])
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              (slotsModel != null && slotsModel.length > 0)
                  ? Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: COLORS.black,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<SlotsModel>(
                          isExpanded: true,
                          hint: Text(
                              (slotsModel != null && slotsModel.length > 0)
                                  ? "Select Date"
                                  : "No Date"),
                          value: selectedDate,
                          onChanged: (SlotsModel? selectModel) {
                            setState(() {
                              selectedDate = selectModel!;
                            });
                          },
                          items: slotsModel.map((SlotsModel rejModel) {
                            return DropdownMenuItem<SlotsModel>(
                              value: rejModel,
                              child: Container(
                                child: Text(
                                  rejModel.date.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  : const SizedBox(),

              SizedBox(
                height: 20,
              ),
              dataTableView(),
              tableView(),
            ],
          ),
        ),
      ),
    );
  }

  String getDashboardTitle(int index) {
    if (index == 0) {
      return "Ounce";
    } else if (index == 1) {
      return "Gram";
    } else if (index == 2) {
      return "Hundred Gram";
    } else if (index == 3) {
      return "Thousand Gram";
    } else {
      return "";
    }
  }

  Future<void> callPricesApi() async {
    ApiService.createOtherUrl(Constants.BASE_URL).getPrices().then((value) {
      if (value != null) {
        pricesResponseModel = value;
        if (pricesResponseModel != null) {
          pricesModel.add(pricesResponseModel.prices.ounce);
          pricesModel.add(pricesResponseModel.prices.gram);
          pricesModel.add(pricesResponseModel.prices.hundred_gram);
          pricesModel.add(pricesResponseModel.prices.thousand_gram);
        }
        if (mounted) setState(() {});
      } else {
        showToast('Empty List');
      }
      callSlotsApi();
    }).catchError((onError) {
      print(onError.toString());
      callSlotsApi();
    });
  }

  Future<void> callSlotsApi() async {
    ApiService.createOtherUrl(Constants.BASE_URL).getSlots().then((value) {
      slotsModel.clear();
      if (value.data != null) {
        List date = value.data;
        if (date.isNotEmpty) {
          for (int i = 0; i < date.length; i++) {
            SlotsModel model = SlotsModel.fromJson(date[i]);
            slotsModel.add(model);
            if (i == 0) {
              selectedDate = slotsModel[0];
            }
          }

          if (mounted) setState(() {});
        } else {
          showToast('Empty List');
        }
      } else {
        showToast('Empty List');
      }
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  Widget dataTableView() {
    return (slotsModel != null &&
            slotsModel.length > 0 &&
            selectedDate != null &&
            selectedDate.slots != null &&
            selectedDate.slots.length > 0)
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black12,
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Row(
              children: const <Widget>[
                Expanded(
                    flex: 1,
                    child: Text(
                      STRINGS.no,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Expanded(
                  flex: 2,
                  child: Text(
                    STRINGS.start_time,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Text(
                      STRINGS.end_time,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      STRINGS.available,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ))
        : const SizedBox();
  }

  Widget tableView() {
    return (slotsModel != null &&
            slotsModel.length > 0 &&
            selectedDate != null &&
            selectedDate.slots != null &&
            selectedDate.slots.length > 0)
        ? ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: selectedDate.slots.length,
            itemBuilder: (BuildContext context, index) {
              return Container(
                  child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index % 2 == 0) ? Colors.white : Colors.blueGrey,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1, child: Text((index + 1).toString() + ".")),
                        Expanded(
                            flex: 2,
                            child: Text(StringUtil.splitDateString(selectedDate
                                .slots[index].start_time
                                .toString()))),
                        Expanded(
                            flex: 2,
                            child: Text(StringUtil.splitDateString(selectedDate
                                .slots[index].end_time
                                .toString()))),
                        Expanded(
                            flex: 2,
                            child: (selectedDate.slots[index].available == true)
                                ? const Text(STRINGS.yes)
                                : const Text(STRINGS.no)),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey)
                ],
              ));
            })
        : const SizedBox();
  }
}
