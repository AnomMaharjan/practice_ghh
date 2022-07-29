import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get_hay/config.dart';
import 'package:get_hay/widget/alert_box.dart';
import 'package:get_hay/widget/disable_widget.dart';
import 'package:get_hay/widget/red_pill.dart';
import 'package:get_hay/widget/stock_widget.dart';
import 'package:location/location.dart';

import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  final SearchPageController searchPageController = Get.put(
    SearchPageController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Obx(
        () => ListView(
          shrinkWrap: true,
          children: [
            Row(
              //top section of search
              children: [
                Flexible(
                  //back button
                  flex: 1,
                  child: IconButton(
                    padding:
                        EdgeInsets.only(right: 6, bottom: 6, left: 14, top: 10),
                    onPressed: () {
                      Get.back();
                    },
                    color: APP_ICON_COLOR,
                    icon: const BackButtonIcon(),
                  ),
                ),
                Flexible(
                  //search bar
                  flex: 7,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 0.0, top: 12),
                    child: TextFormField(
                      textInputAction: TextInputAction.search,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        searchPageController.applyFilter();
                      },
                      controller: searchPageController.searchController,
                      autofocus: false,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.lightBlueAccent,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            searchPageController.applyFilter();
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.red,
                          ),
                        ),
                        hintText: 'Search',
                      ),
                    ),
                  ),
                ),
                Flexible(
                  // fiilter button
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      searchPageController.isVisible.value =
                          !searchPageController.isVisible.value;
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 18,
                      width: 26,
                      child: SvgPicture.string(
                        '''<svg xmlns="http://www.w3.org/2000/svg" aria-hidden="false" focusable="false" data-prefix="fas" data-icon="sliders-h" role="img" viewBox="0 0 512 512" class="svg-inline--fa fa-sliders-h fa-w-16"><path fill="red" d="M496 384H160v-16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v16H16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h80v16c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16v-16h336c8.8 0 16-7.2 16-16v-32c0-8.8-7.2-16-16-16zm0-160h-80v-16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v16H16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h336v16c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16v-16h80c8.8 0 16-7.2 16-16v-32c0-8.8-7.2-16-16-16zm0-160H288V48c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v16H16C7.2 64 0 71.2 0 80v32c0 8.8 7.2 16 16 16h208v16c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16v-16h208c8.8 0 16-7.2 16-16V80c0-8.8-7.2-16-16-16z" class=""/></svg>''',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            showAlertWidget(),
            Visibility(
              visible: searchPageController.isVisible.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DisableWidget(
                    disabled: searchPageController.permissionStatus !=
                        PermissionStatus.granted,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            FilterText(
                              text: "Distance",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 24.0, left: 12.0),
                              child: Text(
                                "${searchPageController.distanceValue.value} miles",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                        Slider(
                          value: searchPageController.distanceValue.value
                              .toDouble(),
                          min: DISTANCE_MIN.toDouble(),
                          max: DISTANCE_MAX.toDouble(),
                          label: DISTANCE_DEFAULT.toString(),
                          onChanged: (value) {
                            searchPageController.distanceValue.value =
                                value.toInt();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FilterText(
                        text: "Sort By",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                        child: Wrap(
                          spacing: 12,
                          children: List.generate(
                            searchPageController.sortByOptions.length,
                            (index) => DisableWidget(
                              disabled: (index == 0 &&
                                  searchPageController.permissionStatus !=
                                      PermissionStatus.granted),
                              child: RedPill(
                                text: searchPageController.sortByOptions[index]
                                    ["text"],
                                isSelected: searchPageController.isSorted(
                                    searchPageController.sortByOptions[index]
                                        ["value"]),
                                onTap: () => searchPageController.onSortByTap(
                                    value: searchPageController
                                        .sortByOptions[index]["value"]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                  // FilterText(
                  //   text: "Category",
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  //   child: Wrap(
                  //     spacing: 12,
                  //     children: [
                  //       StatefulRedPill(
                  //         text: "Category 1",
                  //         onChanged: (value) {
                  //           _onCategoryChange(
                  //               category: "Category 1", value: value);
                  //         },
                  //       ),
                  //       StatefulRedPill(
                  //         text: "Category 2",
                  //         onChanged: (value) {
                  //           _onCategoryChange(
                  //               category: "Category 2", value: value);
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  FilterText(
                    text: "Category",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Wrap(
                      spacing: 12,
                      children: List.generate(
                        searchPageController.categories.length,
                        (index) => RedPill(
                          text: searchPageController.categories[index].name,
                          isSelected: searchPageController.isCategorySelected(
                            searchPageController.categories[index].id,
                          ),
                          onTap: () => searchPageController.onCategoryTap(
                            category: searchPageController.categories[index].id,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      FilterText(
                        text: "Delivery Available Products",
                      ),
                      Checkbox(
                        activeColor: Colors.red,
                        value: searchPageController.willDeliver.value,
                        onChanged: (bool value) {
                          searchPageController.willDeliver.value =
                              !searchPageController.willDeliver.value;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 6),
                    child: MaterialButton(
                      minWidth: Get.width,
                      onPressed: searchPageController.applyFilter,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Text(
                        "Apply",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            searchPageController.searchList.length == 0
                ? Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(child: Text("No results found")),
                  )
                : ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(
                      searchPageController.searchList.length,
                      (index) {
                        return StockWidgetView(
                          product: searchPageController.searchList[index],
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget showAlertWidget() {
    if (!searchPageController.isLocationRequested.value)
      return SizedBox();
    else if (searchPageController.permissionStatus == PermissionStatus.denied)
      return AlertBox(
        alertText: "Allow location",
        trailingWidget: MaterialButton(
          minWidth: 0,
          padding: EdgeInsets.zero,
          onPressed: () {
            searchPageController.askCurrentLocation();
          },
          child: Text("Allow"),
        ),
        trailingWidgetPadding: EdgeInsets.zero,
      );
    else if (searchPageController.permissionStatus ==
        PermissionStatus.deniedForever)
      return AlertBox(
        alertText: "Allow location from settings",
        trailingWidget: Icon(
          Icons.settings,
          size: 18,
        ),
      );

    //
    return SizedBox();
  }
}

class FilterText extends StatelessWidget {
  final String text;
  const FilterText({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, bottom: 6, top: 8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
