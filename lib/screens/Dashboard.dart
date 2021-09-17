import 'package:flutter/material.dart';
import 'package:task/components/colors.dart';
import 'package:task/components/fryo_icons.dart';
import 'package:task/components/partials.dart';
import 'package:task/components/styles.dart';
import 'package:task/logic/cartprovider.dart';
// import 'package:task/screens/ordersscreen.dart';
import 'package:provider/provider.dart';
import 'package:task/screens/ProductPage.dart';
// import './ProductPage.dart';
// import 'package:bubble/bubble.dart';

class Dashboard extends StatefulWidget {
  final String pageTitle;

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text('Homy', style: logoWhiteStyle, textAlign: TextAlign.center),
        actions: <Widget>[],
      ),
      drawer: Drawer(
        child: Container(
          child: headerTopCategories(),
        ),
      ),
      body: storeTab(context),
    );
  }
}

Widget storeTab(BuildContext context) {
  final provider = Provider.of<Cartprovider>(context);

  return ListView(children: <Widget>[
    deals(
      'Hot Deals',
      category: 1,
      onViewMore: () {},
      builder: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return (provider.foods != null)
              ? Fooditem(provider.foods[index], index: index, onLike: () {},
                  onTapped: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductPage(
                                productData: provider.foods[index],
                              )));
                },
                  isliked:
                      Provider.of<Cartprovider>(context).foods[index].userLiked)
              : <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text('No provider.foods available at this moment.',
                        style: taglineText),
                  )
                ];
        },
        itemCount: provider.foods.length,
      ),
    ),
    deals('Drinks Parol',
        category: 2,
        onViewMore: () {},
        builder: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return (provider.drinks != null)
                ? Fooditem(provider.drinks[index], index: index, onLike: () {},
                    onTapped: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductPage(
                                  productData: provider.drinks[index],
                                )));
                  },
                    isliked: Provider.of<Cartprovider>(context)
                        .drinks[index]
                        .userLiked)
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('No provider.foods available at this moment.',
                          style: taglineText),
                    )
                  ];
          },
          itemCount: provider.drinks.length,
        ))
  ]);
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          child: Text('View all ›', style: contrastText),
        ),
      )
    ],
  );
}

// wrap the horizontal listview inside a sizedBox..
Widget headerTopCategories() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('All Categories', onViewMore: () {}),
      ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          headerCategoryItem('Frieds', Fryo.dinner, onPressed: () {}),
          headerCategoryItem('Fast Food', Fryo.food, onPressed: () {}),
          headerCategoryItem('Creamery', Fryo.poop, onPressed: () {}),
          headerCategoryItem('Hot Drinks', Fryo.coffee_cup, onPressed: () {}),
          headerCategoryItem('Vegetables', Fryo.leaf, onPressed: () {}),
        ],
      )
    ],
  );
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 86,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
        Text(name + ' ›', style: categoryText)
      ],
    ),
  );
}

Widget deals(
  String dealTitle, {
  onViewMore,
  int category,
  Widget builder,
  int count,
}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(height: 250, child: builder)
      ],
    ),
  );
}
