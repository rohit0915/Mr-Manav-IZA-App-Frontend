  /*  Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 1.h,
                    spacing: 2.w,
                    children: List.generate(
                      titles.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            // Toggle clicked state of the item
                            isItemClicked[index] = !isItemClicked[index];
                            if (index==1) {
                              
                            }
                          },
                          child: Obx(() {
                            return Column(
                              children: [
                                AnimatedContainer(
                                  width: Adaptive.w(45),
                                  height: Adaptive.h(20),
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  margin: isItemClicked[index]
                                      ? EdgeInsets.only(top: 5.h)
                                      : EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.sp),
                                    gradient: LinearGradient(colors: [
                                      Color.fromARGB(255, 121, 4, 80),
                                      Color(0xffF8069D),
                                    ]),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(12.sp),
                                        child: Text(
                                          titles[index],
                                          style: TextStyle(
                                              fontSize: 19.px,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Image.asset(
                                          'assets/images/cat$index.png'),
                                      
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    buildVspacer(1.h),
                                    Obx(() {
                                      return isItemClicked[index]
                                          ? index == 4
                                              ? makeUpVantityItem()
                                              : shopCategoryItemMethod()
                                          : SizedBox();
                                    })
                                  ],
                                ),
                              ],
                            );
                          }),
                        );
                      },
                    )) */