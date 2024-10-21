import 'package:fitnes/models/category_item_models.dart';
import 'package:fitnes/models/dite_model.dart';
import 'package:fitnes/models/popular_dite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryItemModels> categoris = [];
  List<DiteModel> dites = [];
  List<PopularDiteModel> popularDites = [];
  void _initializedDatas() {
    categoris = CategoryItemModels.getCategoryItems();
    dites = DiteModel.getDites();
    popularDites = PopularDiteModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _initializedDatas();
    return Scaffold(
      appBar: homePageAppBar(),
      body: ListView(
        children: [
          _searchText(),
          const SizedBox(
            height: 40,
          ),
          _categories(),
          const SizedBox(
            height: 40,
          ),
          _diteSection(),
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Popular",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 115,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff1D1617).withOpacity(0.2),
                                offset: Offset(0, 10),
                                blurRadius: 10,
                                spreadRadius: 0)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 65,
                            height: 65,
                            child:
                                SvgPicture.asset(popularDites[index].iconPath),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularDites[index].name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "${popularDites[index].level} | ${popularDites[index].duration} | ${popularDites[index].calorie}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/images/button.svg",
                              width: 30,
                              height: 30,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  padding: EdgeInsets.only(left: 20, right: 20),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 25,
                      ),
                  itemCount: popularDites.length)
            ],
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Column _diteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Recommendation\nFor Dite!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: 210,
                    decoration: BoxDecoration(
                      color: dites[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: SvgPicture.asset(dites[index].iconPath),
                        ),
                        Text(
                          dites[index].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${dites[index].level} | ${dites[index].duration} | ${dites[index].calorie}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Container(
                          width: 130,
                          height: 45,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                dites[index].viewIsSelected
                                    ? Color.fromARGB(237, 220, 238, 255)
                                    : Colors.transparent,
                                dites[index].viewIsSelected
                                    ? Color(0xff92A3FD)
                                    : Colors.transparent,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "View",
                              style: TextStyle(
                                color: dites[index].viewIsSelected
                                    ? Colors.white
                                    : Color(0xffc58B52),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ),
              itemCount: dites.length),
        )
      ],
    );
  }

  Column _categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Category",
            style: TextStyle(
                color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 130,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categoris.length,
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categoris[index].itemColor.withOpacity(0.40),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      margin: EdgeInsets.only(top: 10),
                      width: 50,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(categoris[index].itemIcon),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      categoris[index].itemText,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container _searchText() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 214, 212, 212).withOpacity(0.11),
            blurRadius: 10,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: "Search Pancake",
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide.none),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: Container(
            margin: const EdgeInsets.only(right: 10),
            width: 40,
            child: const IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    endIndent: 10,
                    indent: 10,
                    thickness: 0.1,
                  ),
                  Icon(Icons.manage_search_sharp),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar homePageAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SvgPicture.asset("assets/icons/arrowleft.svg"),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: Icon(Icons.more_vert),
        )
      ],
      title: const Text(
        "Fitness Application",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
      centerTitle: true,
    );
  }
}
