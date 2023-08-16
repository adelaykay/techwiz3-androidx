import 'package:StreamMaster/components/bottom_nav.dart';
import 'package:StreamMaster/components/drawer.dart';
import 'package:StreamMaster/components/xtheme.dart';
import 'package:StreamMaster/models/subscription.dart';
import 'package:StreamMaster/screens/subs_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

class MySubs extends StatefulWidget {
  static const routeName = '/subscription';

  const MySubs({Key? key}) : super(key: key);

  @override
  State<MySubs> createState() => _MySubsState();
}

class _MySubsState extends State<MySubs> {
  static final wallet = {"balance": ""};
  List<Subscription> cardItems = Subscription.subscriptions;
  int? expandedIndex;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  void toggleCard(int index) {
    setState(() {
      if (expandedIndex == index) {
        expandedIndex = null;
      } else {
        expandedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    Color primary = XTheme.of(context).primary;
    return Scaffold(
      key: _key,
      backgroundColor: XTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: ()=> _key.currentState?.openDrawer(),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 18),
            child: CircleAvatar(
              // foregroundImage: NetworkImage('${user?.photoURL}'),
              backgroundImage:
                  NetworkImage('https://loremflickr.com/g/150/150/profile'),
            ),
          ),
        ),
        title: Text('${user?.displayName}', style: XTheme.of(context).title1,),
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: XTheme.of(context).primaryBackground,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            for (int i = 0; i < 10; i++)
                              ListTile(
                                leading: cardItems[i].icon,
                                title: Text(cardItems[i].serviceName),
                                onTap: () {
                                  // Handle subscription selection for Service 1
                                  Navigator.pop(context);
                                },
                              )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8, right: 18),
              child: CircleAvatar(
                backgroundColor: XTheme.of(context).primaryBackground,
                child: Icon(
                  Icons.add,
                  color: primary,
                ),
              ),
            ),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffFF7477),
                    boxShadow: kElevationToShadow[4],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(20))),
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Balance',
                        style: XTheme.of(context).bodyText1,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '\$180.60',
                        style: XTheme.of(context).headlineSmall.override(color: XTheme.of(context).primaryText, fontFamily: 'Inter'),
                      )
                    ],
                  ),
                  trailing: Column(
                    children: [Icon(SimpleIcons.mastercard), Text('05/32')],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming',
                    style: XTheme.of(context).title3,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('View all'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CarouselSlider(
                  items: [
                    ...List.generate(
                        cardItems.length,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      horizontalTitleGap: 20,
                                      minVerticalPadding: 10,
                                      // isThreeLine: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      leading: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: cardItems[index].icon,
                                        ),
                                      ),
                                      title: Text(
                                        '\$${cardItems[index].subAmount}',
                                        style: XTheme.of(context).title3.override(

                                            fontFamily: 'Inter'),
                                        textAlign: TextAlign.end,
                                      ),
                                      subtitle: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${cardItems[index].daysLeft} days left',
                                            style: XTheme.of(context).bodyMedium,
                                          ),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 18.0),
                                      child: Text(
                                        '${cardItems[index].serviceName}',
                                        style: XTheme.of(context)
                                            .title3
                                            .override(
                                            fontFamily: 'Inter'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                  ],
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    pageSnapping: false,
                    aspectRatio: 3.6,
                    viewportFraction: 0.5,
                    padEnds: false,
                  )),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Subscriptions',
                    style: XTheme.of(context).title3,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SubscriptionList.routeName);
                    },
                    child: Text('View all'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                  )
                ],
              ),
              for (int index = 0; index < 4; index++)
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: expandedIndex == index ? 200.0 : 80.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(5))),
                    color: cardItems[index].cardColor,
                    shadowColor: XTheme.of(context).bodyText2.color,
                    elevation: 10,
                    child: InkWell(
                      onTap: () {
                        toggleCard(index);
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                cardItems[index].serviceName,
                                style: XTheme.of(context).bodyText1.override(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              subtitle: Text('${cardItems[index].planDetails}', style: XTheme.of(context).bodySmall.override(color: XTheme.of(context).primaryText, fontFamily: 'Inter'),),
                              leading: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: cardItems[index].icon,
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$${cardItems[index].subAmount}',
                                    style:
                                        XTheme.of(context).bodyText1.override(
                                            color: Colors.black,
                                            fontFamily: 'Montserrat',
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                  ),
                                  Text('${cardItems[index].subsTime}'
                                      .split(' ')[0])
                                ],
                              ),
                            ),
                            if (expandedIndex == index)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text('Payment Info   ' +
                                        cardItems[index].planDetails),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                        '\$ ${cardItems[index].subAmount}'),
                                  ),
                                ],
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(cardItems[index].planDetails),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child:
                                      Text('\$ ${cardItems[index].subAmount}'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(
        idx: 1,
      ),
    );
  }
}
