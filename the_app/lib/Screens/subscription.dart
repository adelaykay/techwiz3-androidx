import 'package:StreamMaster/components/bottom_nav.dart';
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

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: XTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('${user?.displayName}'),
        leading: CircleAvatar(
          // foregroundImage: NetworkImage('${user?.photoURL}'),
          backgroundImage:
              NetworkImage('https://loremflickr.com/g/150/150/profile'),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
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
                    );
                  });
            },
            child: CircleAvatar(
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: XTheme.of(context).primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  leading: Column(
                    children: [
                      Text(
                        'Balance',
                        style: XTheme.of(context).bodyText2,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '\$180.60',
                        style: XTheme.of(context).title1,
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
                        backgroundColor: Colors.transparent,
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
                              child: ListTile(
                                horizontalTitleGap: 20,
                                minVerticalPadding: 10,
                                tileColor: Colors.white,
                                isThreeLine: true,
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
                                      color: Colors.black, fontFamily: 'Inter'),
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
                                    Text(
                                      '${cardItems[index].serviceName}',
                                      style: XTheme.of(context).title3.override(
                                          color: Colors.black54,
                                          fontFamily: 'Inter'),
                                      textAlign: TextAlign.end,
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
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 99,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(SubscriptionList.routeName);
                    },
                    child: Card(
                      color: XTheme.of(context).primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Card(
                                borderOnForeground: false,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    side: BorderSide(color: Colors.black)),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.orangeAccent),
                                    child: Icon(SimpleIcons.netflix))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Text(
                                  'Netflix',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Jun 24, 14:00 pm',
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Text(
                                  '\$24.00',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'per month',
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 99,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(SubscriptionList.routeName);
                    },
                    child: Card(
                      color: XTheme.of(context).primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Card(
                                borderOnForeground: false,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    side: BorderSide(color: Colors.black)),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        color: XTheme.of(context).primary),
                                    child:
                                        Icon(SimpleIcons.amazon))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Text(
                                  'Prime Video',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Jun 24, 14:00 pm',
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Text(
                                  '\$24.00',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'per month',
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 99,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(SubscriptionList.routeName);
                    },
                    child: Card(
                      color: XTheme.of(context).primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Card(
                                borderOnForeground: false,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    side: BorderSide(color: Colors.black)),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        color: XTheme.of(context).primary),
                                    child:
                                        Icon(SimpleIcons.hulu))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Text(
                                  'Deezer',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Mar 19, 06:00 am',
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Text(
                                  '\$5.00',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'per month',
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
