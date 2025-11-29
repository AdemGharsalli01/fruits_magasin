//import 'dart:io';

//import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/colors.dart';
import 'package:fruit/model.dart';
import 'package:fruit/product_item.dart';
import 'package:fruit/profile.dart';
//import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //image de profile selection
  //XFile? selectedimage;

  /*Future<void> _uploadImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedimage = image;
    });
  }*/

  bool basketselected = false;
  String titrecategory = "Fruits";
  bool seeall = false;
  bool profile = false;
  bool edit = false;

  //late double width_basekt= MediaQuery.of(context).size.width ;
  // ignore: non_constant_identifier_names
  // ignore: non_constant_identifier_names
  late double height_basket = MediaQuery.of(context).size.height * 0.6;
  // les images dans le banner
  List<String> items = [
    "assets/banners/Slider 1.png",
    "assets/banners/Slider 2.png",
    "assets/banners/Slider 3.png",
  ];
  // les categories
  List<CategoryModel> category = [
    CategoryModel(name: 'Fruits', image: "assets/category/fruits.png"),
    CategoryModel(name: 'Milk & Egg', image: "assets/category/egg.png"),
    CategoryModel(name: 'Bavergas', image: "assets/category/bavergas.png"),
    CategoryModel(name: 'luandry', image: "assets/category/luandry.png"),
    CategoryModel(name: 'vegatbels', image: "assets/category/vegatbels.png"),
  ];
  List<ProductModel> product = [];
  // les produits dans chaque category
  List<ProductModel> fruirstproduct = [
    ProductModel(
      name: "Banana",
      image: "assets/fruits/banana.png",
      price: 3.99,
      totalprice: 3.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Papper",
      image: "assets/fruits/papper.png",
      price: 2.99,
      totalprice: 2.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Orange",
      image: "assets/fruits/orange.png",
      price: 1.99,
      totalprice: 1.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
  ];
  List<ProductModel> bavergasproduct = [
    ProductModel(
      name: "Coca Cola",
      image: "assets/bavergas/cocacola.png",
      price: 3.99,
      totalprice: 3.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Fanta",
      image: "assets/bavergas/fanta.png",
      price: 2.99,
      totalprice: 2.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Sprite",
      image: "assets/bavergas/sprite.png",
      price: 1.99,
      totalprice: 1.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
  ];
  List<ProductModel> luandryproduct = [
    ProductModel(
      name: "Detergent",
      image: "assets/luandry/detergent.png",
      price: 3.99,
      totalprice: 3.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Softener",
      image: "assets/luandry/softener.png",
      price: 2.99,
      totalprice: 2.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Bleach",
      image: "assets/luandry/bleach.png",
      price: 1.99,
      totalprice: 1.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
  ];
  List<ProductModel> vegatbelsproduct = [
    ProductModel(
      name: "Broccoli",
      image: "assets/vegatbels/broccoli.png",
      price: 3.99,
      totalprice: 3.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Carrot",
      image: "assets/vegatbels/carrot.png",
      price: 2.99,
      totalprice: 2.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Lettuce",
      image: "assets/vegatbels/lettuce.png",
      price: 1.99,
      totalprice: 1.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
  ];
  List<ProductModel> milkeggproduct = [
    ProductModel(
      name: "Milk",
      image: "assets/milkegg/milk.png",
      price: 3.99,
      totalprice: 3.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Cheese",
      image: "assets/milkegg/cheese.png",
      price: 2.99,
      totalprice: 2.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Eggs",
      image: "assets/milkegg/egg.png",
      price: 1.99,
      totalprice: 1.99,
      quantity: 1,
      rate: "4",
      rateCount: "287",
    ),
  ];
  List<user> profiles = [
    user(name: "adem", email: "gharsalli adem ", password: '11550022'),
  ];
  @override
  void initState() {
    super.initState();
    product = fruirstproduct;
  }

  List basketList = [];
  // selection des produits dans le basket
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
      //app bar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: GestureDetector(
          onTap: () {
            setState(() {
              basketselected = false;
              seeall = false;
              profile = false;
              edit = false;
            });
          },
          child: AppBar(
            backgroundColor: Colors.white,
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
                    seeall = false;
                    basketselected = false;
                    setState(() {
                      if (profile == false) {
                        profile = true;
                      } else {
                        profile = false;
                      }
                    });
                  },
                  child: Icon(
                    Icons.person_2_rounded,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // body
      body: Stack(
        children: [
          // page prinsipal
          GestureDetector(
            onTap: () {
              setState(() {
                basketselected = false;
                seeall = false;
                profile = false;
              });
            },
            child: Column(
              children: [
                /// banner
                CarouselSlider.builder(
                  itemCount: items.length,
                  itemBuilder:
                      (
                        BuildContext context,
                        int itemIndex,
                        int pageViewIndex,
                      ) => Image.asset(items[itemIndex]),
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
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (index == 0) {
                              product = fruirstproduct;
                              titrecategory = "Fruits";
                            } else if (index == 1) {
                              product = milkeggproduct;
                              titrecategory = "Milk & Egg";
                            } else if (index == 2) {
                              product = bavergasproduct;
                              titrecategory = "Bavergas";
                            } else if (index == 3) {
                              product = luandryproduct;
                              titrecategory = "Luandry";
                            } else if (index == 4) {
                              product = vegatbelsproduct;
                              titrecategory = "Vegatbels";
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              // category image
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.circle,
                                ),
                                width: whidthscren * 0.2,
                                height: heightscren * 0.1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    category[index].image,
                                    width: whidthscren * 0.1,
                                  ),
                                ),
                              ),
                              // space between image and name
                              SizedBox(height: heightscren * 0.01),
                              // category name
                              Text(
                                category[index].name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: heightscren * 0.03),

                /// title  and see all
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        titrecategory,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          profile = false;
                          basketselected = false;
                          setState(() {
                            if (seeall == false) {
                              seeall = true;
                            } else {
                              seeall = false;
                            }
                          });
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
                          price: item.price.toString(),
                          onTap: () => selection(item),
                          icon:
                              isSelected(item)
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
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                              //les images dans le basket
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
                              //ligne blanche verticale
                              Container(
                                width: whidthscren * 0.005,
                                height: heightscren * 0.06,
                                color: Colors.white,
                              ),
                              //separator
                              SizedBox(width: whidthscren * 0.015),
                              // view basket text + icon
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
                              //separator
                              SizedBox(width: whidthscren * 0.025),
                              // icon basket with number of items
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
                    // basket el kol el box el 5adhra
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //el matta eli wast el basket
                        GestureDetector(
                          onPanUpdate: (details) {
                            // kif n7arek el matta chnawa ysir
                            //width_basekt+=details.delta.dx;==> hedi kif nhe7 na9es fel 3ordh
                            height_basket -= details.delta.dy;
                            //width_basekt=width_basekt.clamp(whidthscren,whidthscren);
                            if (height_basket < heightscren * 0.25) {
                              basketselected = false;
                              height_basket =
                                  MediaQuery.of(context).size.height * 0.6;
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
                        // liste des produits dans le basket
                        Container(
                          height: height_basket * 0.5,
                          width: whidthscren * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 1),
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          // les items fel basket
                          child: ListView.builder(
                            itemCount: basketList.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // image fruit
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
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          basketList[index].image,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // separator
                                  //SizedBox(width: whidthscren * 0.03),
                                  // nom fruit
                                  Text(
                                    basketList[index].name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  // separator
                                  //SizedBox(width: whidthscren * 0.02),
                                  // quantite
                                  Text(
                                    "x${basketList[index].quantity}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  // augmente le quantite
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        basketList[index].quantity += 1;
                                        basketList[index].totalprice =
                                            basketList[index].price *
                                            basketList[index].quantity;
                                      });
                                    },
                                    icon: Icon(Icons.add, color: Colors.white),
                                  ),
                                  // diminue le quantite
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (basketList[index].quantity > 1) {
                                          basketList[index].quantity -= 1;
                                          basketList[index].totalprice =
                                              basketList[index].price *
                                              basketList[index].quantity;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                  // separator
                                  // SizedBox(width: whidthscren * 0.05),
                                  // prix fruit
                                  Text(
                                    "\$${basketList[index].totalprice.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width: whidthscren * 0.07),
                                ],
                              );
                            },
                          ),
                        ),
                        // close basket
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // clere basket
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    basketList.clear();
                                  });
                                },
                                child: Text(
                                  "Clear Basket",
                                  style: TextStyle(
                                    color: Colors.red.shade900,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              // separator
                              SizedBox(width: whidthscren * 0.2),

                              // close basket
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
                                  "Close Basket",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: heightscren * 0.045),
                      ],
                    ),
                  ),
                ],
              )
              : SizedBox.shrink(),
          // see all
          seeall == true
              ? Container(
                width: whidthscren,
                height: heightscren,
                color: Colors.white,
                child: Center(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final item = product[index];
                      return Row(
                        children: [
                          ProductItem(
                            image: item.image,
                            name: item.name,
                            rate: item.rate,
                            rateCount: item.rateCount,
                            price: item.price.toString(),
                            onTap: () => selection(item),
                            icon:
                                isSelected(item)
                                    ? Icon(Icons.close)
                                    : Icon(Icons.add),
                          ),
                          Row(
                            children: [
                              SizedBox(width: whidthscren * 0.02),
                              Text(
                                "x${product[index].quantity}",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              // augmente le quantite
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    product[index].quantity += 1;
                                    product[index].totalprice =
                                        product[index].price *
                                        product[index].quantity;
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              // diminue le quantite
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (product[index].quantity > 1) {
                                      product[index].quantity -= 1;
                                      product[index].totalprice =
                                          product[index].price *
                                          product[index].quantity;
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              // separator
                              SizedBox(width: whidthscren * 0.055),
                              // total price
                              Text(
                                "\$${product[index].totalprice.toStringAsFixed(2)}",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    itemCount: product.length,
                  ),
                ),
              )
              : SizedBox.shrink(),
          // profile vieux
          profile == true
              ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 200,
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: heightscren * 0.02),
                        // profile image
                        CircleAvatar(
                          radius: 50,
                          /*backgroundImage:
                              selectedimage != null
                                  ? FileImage(File(selectedimage!.path))
                                  : null,*/
                          //backgroundColor: AssetImage(""),
                        ),
                        // space between image and name
                        SizedBox(height: 20),
                        // profile name
                        Text(
                          profiles[0].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // space between name and hellow
                        SizedBox(height: 10),
                        // hellow text
                        Text(
                          "helow",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        // space between hellow and edit profile
                        SizedBox(height: heightscren * 0.06),
                        // edit profile
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (edit == false) {
                                    edit = true;
                                  } else {
                                    edit = false;
                                  }
                                });
                              },
                              child: Text(
                                "edit profile",
                                style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
              : SizedBox.shrink(),
          //edit profile vieux
          edit == true
              ? Container(
                width: whidthscren,
                height: heightscren,
                // ignore: deprecated_member_use
                color: Colors.black,
                child: Column(
                  children: [
                    //spacer
                    SizedBox(height: heightscren*0.05),
                    // image selecter
                    Container(
                      height: 200,
                      width: 200,
                      // ignore: deprecated_member_use
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.4),
                      ),
                     /* child:
                          selectedimage == null
                              ? null
                              : Image.file(
                                File(selectedimage!.path),
                                height: 200,
                                width: 200,
                              ),*/
                    ),
                    //spacer
                    SizedBox(height: 20),
                    //button de selection

                    GestureDetector(
                      //onTap: _uploadImage,
                      child: Container(
                        height: 30,
                        width: 200,

                        // ignore: deprecated_member_use
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: deprecated_member_use
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        child: Center(
                          child: Text(
                            "upload image",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    //spacer
                    SizedBox(height: 10),
                    // saisir de nom
                    Row(
                      children: [
                        Text("Name"),
                        Container(
                          height:  heightscren*0.05,
                          width: heightscren*0.05,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)
                          ),
                          
                        ),
                      ],
                    ),




                    /*selectedimage != null
                        ? GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedimage = null;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 200,
                            // ignore: deprecated_member_use
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // ignore: deprecated_member_use
                              color: Colors.grey.withOpacity(0.4),
                            ),
                            child: Center(
                              child: Text(
                                "delet photo",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        )
                        : SizedBox.shrink(),*/
                   
                    Spacer(),
                    Text("developed by adem gharsalli"),
                    SizedBox(height: heightscren*0.09,)
                  
                  ],
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
