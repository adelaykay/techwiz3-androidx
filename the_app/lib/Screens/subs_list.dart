import 'package:flutter/material.dart';

import '../components/xtheme.dart';
import '../models/subscription.dart';

class SubscriptionList extends StatefulWidget {
  static const routeName = '/subs_list';

  @override
  _SubscriptionListState createState() => _SubscriptionListState();
}

class _SubscriptionListState extends State<SubscriptionList> {
  final cardItems = Subscription.subscriptions;
  int? expandedIndex;

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
    return ListView.builder(
      itemCount: cardItems.length,
      itemBuilder: (BuildContext context, int index) {
        return AnimatedContainer(
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
                      leading: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: cardItems[index].icon,
                      ),
                      trailing: Text(
                        '\$ ${cardItems[index].subAmount}',
                        style: XTheme.of(context).bodyText1.override(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            // fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    if (expandedIndex == index)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(cardItems[index].planDetails),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('\$ ${cardItems[index].subAmount}'),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
