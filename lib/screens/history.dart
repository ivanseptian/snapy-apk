import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markaz_snappy/config/config.dart';

import 'package:markaz_snappy/modules/history/history.dart';
import 'package:markaz_snappy/widgets/empty_data.dart';

class History extends StatelessWidget {
  final HistoryController history;

  const History(this.history, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.backgroundWhite,
      body: Obx(
          ()=>ListView(
            children: [
              Container(
                color: ColorsValue.backgroundWhite,
                child: TabBar(
                  controller: history.tabController,
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsValue.textColor00),
                  unselectedLabelStyle: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsValue.textColor00),
                  onTap: (value) {
                    history.indexTab.value = value;
                    history.tabController.animateTo(value);
                  },
                  labelColor: ColorsValue.textColor00,
                  unselectedLabelColor: ColorsValue.textColorD0,
                  tabs: const [
                    Tab(
                      child: Text(
                        "Active",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Past",
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                child: IndexedStack(
                  index: history.indexTab.value,
                  children: [
                    _active(),
                    _past()
                  ],
                ),
              )
            ],
          )
      ),
    );
  }

  _active(){
    return Stack(
      children: [
        Visibility(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              child: Card(
                margin: EdgeInsets.only(bottom: 10),
                elevation: 1.0,
                color: Colors.white,
                child: Container(
                  width: Get.width,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem Ipsum",
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorsValue.textColor00),
                        ),
                        SizedBox(
                          height: 5.0.h,
                        ),
                        Text(
                          "Tuesday, 22 June 2021 10:00 AM",
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorsValue.textColor00),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: (){},
            ),
          ),
          visible: true,
        ),
        const Visibility(
            child: BuildEmptyListView(),
          visible: false,
        )
      ],
    );
  }

  _past(){
    return Stack(
      children: [
        Visibility(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              child: Card(
                margin: EdgeInsets.only(bottom: 10),
                elevation: 1.0,
                color: Colors.white,
                child: Container(
                  width: Get.width,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem Ipsum Ipsum",
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorsValue.textColor00),
                        ),
                        SizedBox(
                          height: 5.0.h,
                        ),
                        Text(
                          "Tuesday, 22 June 2021 10:00 AM",
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorsValue.textColor00),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: (){},
            ),
          ),
          visible: true,
        ),
        const Visibility(
          child: BuildEmptyListView(),
          visible: false,
        )
      ],
    );
  }

}