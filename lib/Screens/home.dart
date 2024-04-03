import 'package:ecommerce_app/Model/popular_model.dart';
import 'package:ecommerce_app/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/diet_model.dart';
import '../Model/model_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  List<DietModel> diets = [];

  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiet();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    _getCategories();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: ListView(
        children: [
          searchField(),
          const SizedBox(
            height: 30,
          ),
          categoriesSection(),
          const SizedBox(
            height: 20,
          ),
          _dietSection(),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Popular",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(left: 20, right: 20),
                itemCount: popularDiets.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                          color: kBlack,
                          offset: Offset(0, 1),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ], color: kWhite, borderRadius: BorderRadius.circular(20)),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(popularDiets[index].iconPath),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularDiets[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            // ignore: prefer_interpolation_to_compose_strings
                            Text(diets[index].level +
                                ' | ' +
                                diets[index].duration +
                                " | " +
                                diets[index].calorie),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/arrow-right.png',))),
                            width: 30,
                            height: 30,
                            margin: const EdgeInsets.only(right: 20.0),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            textAlign: TextAlign.start,
            'Recommendation\nfor Diet',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: diets.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 20,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: categories[index].boxColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      diets[index].iconPath,
                      scale: 5.4,
                    ),
                    Text(
                      diets[index].name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(diets[index].level +
                        ' | ' +
                        diets[index].duration +
                        " | " +
                        diets[index].calorie),
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                              colors: [kBlueGradient, kRedGradient])),
                      child: const Center(
                          child: Text(
                        'View',
                        style: TextStyle(color: kWhite),
                      )),
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

  Column categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 130,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 20,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 110,
                height: 50,
                decoration: BoxDecoration(
                    color: categories[index].boxColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: kWhite,
                          image: DecorationImage(
                              image: AssetImage(categories[index].iconPath)),
                          shape: BoxShape.circle),
                    ),
                    Text(
                      categories[index].name,
                      style: const TextStyle(fontWeight: FontWeight.w300),
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

  Container searchField() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff1D1617).withOpacity(0.11),
          blurRadius: 20,
          spreadRadius: 0.0,
        ),
      ]),
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search here',
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 208, 206, 206),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color.fromARGB(255, 208, 206, 206),
          ),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    color: Color.fromARGB(255, 208, 206, 206),
                    endIndent: 10,
                    indent: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      color: const Color.fromARGB(255, 208, 206, 206),
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          contentPadding: const EdgeInsets.all(15),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        "Breakfast",
        style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffF7F8F8),
        ),
        child: SvgPicture.asset(
          'assets/icons/back-left-arrow.svg',
          width: 20,
          height: 20,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            //action perform here
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF7F8F8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/ellipsis.svg',
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
