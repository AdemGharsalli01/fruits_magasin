import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/colors.dart';
import 'package:fruit/model.dart';
import 'package:fruit/product_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool basketselected = false;
  //late double width_basekt= MediaQuery.of(context).size.width ;
  // ignore: non_constant_identifier_names
  // ignore: non_constant_identifier_names
  late double height_basket = MediaQuery.of(context).size.height * 0.6;
  List<String> items = [
    "assets/banners/Slider 1.png",
    "assets/banners/Slider 2.png",
    "assets/banners/Slider 3.png",
  ];
  List<CategoryModel> category = [
    CategoryModel(name: 'Fruits', image: "assets/category/fruits.png"),
    CategoryModel(name: 'Milk & Egg', image: "assets/category/egg.png"),
    CategoryModel(name: 'Bavergas', image: "assets/category/bavergas.png"),
    CategoryModel(name: 'luandry', image: "assets/category/luandry.png"),
    CategoryModel(name: 'luandry', image: "assets/category/luandry.png"),
  ];
  List<ProductModel> product = [
    ProductModel(
      name: "Banana",
      image: "assets/fruits/banana.png",
      price: "3.99",
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Papper",
      image: "assets/fruits/papper.png",
      price: "2.99",
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Orange",
      image: "assets/fruits/orange.png",
      price: "1.99",
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Egg",
      image: "assets/category/egg.png",
      price: "1.99",
      rate: "4",
      rateCount: "287",
    ),
  ];
  
  List basketList = [];
  void selection(ProductModel product) {
    setState(() {
      if (basketList.contains(product)) {
        basketList.remove(product);
      } else {
        basketList.add(product);
      }
    });
  }
  bool isSelected(ProductModel product) => basketList.contains(product);

  @override
  Widget build(BuildContext context) {
    final whidthscren = MediaQuery.of(context).size.width;
    final heightscren = MediaQuery.of(context).size.height;

    return Scaffold(
      //nav bar
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset("assets/icons/motor.svg"),
            SizedBox(width: whidthscren * 0.1),
            Text("61 Hopper street..", style: TextStyle(fontSize: 19)),
            SizedBox(width: whidthscren * 0.09),
            Icon(Icons.keyboard_arrow_down_rounded, size: 34),
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (basketselected == false) {
                    basketselected = true;
                  } else {
                    basketselected = false;
                  }
                });
              },
              child: SvgPicture.asset("assets/icons/basket.svg"),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // page prinsipal
          GestureDetector(
            onTap:(){
              setState(() {
                basketselected=false;
              });
            },
            child: Column(
              children: [
                /// banner
                CarouselSlider.builder(
                  itemCount: items.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) =>
                          Image.asset(items[itemIndex]),
                  options: CarouselOptions(
                    height: heightscren * 0.2,
                    aspectRatio: 1,
                    viewportFraction: 0.6,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 6),
                    autoPlayAnimationDuration: Duration(seconds: 3),
                    autoPlayCurve: Curves.linearToEaseOut,
                    enlargeCenterPage: true,
                  ),
                ),
            
                /// category
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(category.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                shape: BoxShape.circle,
                              ),
                              width: whidthscren * 0.19,
                              height: heightscren * 0.1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  category[index].image,
                                  width: whidthscren * 0.1,
                                ),
                              ),
                            ),
                            SizedBox(height: heightscren * 0.01),
                            Text(
                              category[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
            
                SizedBox(height: heightscren * 0.03),
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fruits",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Text(
                          "See all",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: heightscren * 0.02),
            
                /// product in  one category
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: List.generate(product.length, (index) {
                        final item = product[index];
                        return ProductItem(
                          image: item.image,
                          name: item.name,
                          rate: item.rate,
                          rateCount: item.rateCount,
                          price: item.price,
                          onTap: () => selection(item),
                          icon:isSelected(item)
                                  ? Icon(Icons.close)
                                  : Icon(Icons.add),
                        );
                      }),
                    ),
                  ),
                ),
                Spacer(),
                // basket
                basketselected == false
                    ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        width: double.infinity,
                        height: heightscren * 0.09,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: whidthscren * 0.5,
                                child: ListView.builder(
                                  itemCount: basketList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Container(
                                        width: whidthscren * 0.137,
                                        height: heightscren * 0.07,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            basketList[index].image,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: whidthscren * 0.005,
                                height: heightscren * 0.06,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (basketselected == false) {
                                      basketselected = true;
                                    } else {
                                      basketselected = false;
                                    }
                                  });
                                },
                                child: Text(
                                  "View Basket",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              SizedBox(width: whidthscren * 0.05),
                              Badge(
                                backgroundColor: Colors.red,
                                label: Text(
                                  basketList.length.toString(),
                                  style: TextStyle(fontSize: 13),
                                ),
                                largeSize: 13,
                                // ignore: deprecated_member_use
                                child: SvgPicture.asset(
                                  "assets/icons/basket.svg",
                                  // ignore: deprecated_member_use
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: whidthscren * 0.025),
                            ],
                          ),
                        ),
                      ),
                    )
                    : SizedBox.shrink(),
                SizedBox(height: heightscren * 0.08),
              ],
            ),
          ),
          //vieux all basket
          basketselected == true
              ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   Container(
                      width: whidthscren,
                      height: height_basket,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.grey.withOpacity(1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          //el mata eli wast el basket
                          GestureDetector(
                            onPanUpdate: (details) {
                              //width_basekt+=details.delta.dx;
                              height_basket -= details.delta.dy;
                              //width_basekt=width_basekt.clamp(whidthscren,whidthscren);
                              if (height_basket < heightscren * 0.25) {
                                basketselected = false;
                                height_basket=MediaQuery.of(context).size.height * 0.6;
                              }
                              height_basket = height_basket.clamp(
                                heightscren * 0.14,
                                heightscren * 0.6,
                              );
                              setState(() {});
                            },
                            child: Container(
                              width: whidthscren * 0.2,
                              height: heightscren * 0.01,
                              margin: EdgeInsets.symmetric(
                                vertical: heightscren * 0.02,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              
                              ),
                            ),
                          ),
                          Container(
                            height: height_basket * 0.5,
                            width: whidthscren * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white, width: 1),

                              
                            ),
                            child: ListView.builder(
                                  itemCount: basketList.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: whidthscren * 0.15,
                                            height: heightscren * 0.1,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                basketList[index].image,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          basketList[index].name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "\$${basketList[index].price}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(width: whidthscren * 0.05),
                                      ],
                                    );
                                  },
                                ),
                          ),
                          Spacer(),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (basketselected == false) {
                                    basketselected = true;
                                  } else {
                                    basketselected = false;
                                  }
                                });
                              },
                              child: Text(
                                "Close Basket",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: heightscren * 0.045),
                        ],
                      ),
                    ),
                ],
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
