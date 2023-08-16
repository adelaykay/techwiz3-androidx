import 'package:StreamMaster/models/payment_info.dart';
import 'package:flutter/material.dart';

import '../components/xtheme.dart';
import '../models/subscription.dart';

class SubscriptionList extends StatefulWidget {
  static const routeName = '/subs_list';

  @override
  _SubscriptionListState createState() => _SubscriptionListState();
}

class _SubscriptionListState extends State<SubscriptionList> {
  final List<PaymentInfo> payment = PaymentInfoGenerator.generateRandomPaymentInfoList(3);
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
    return Scaffold(
      backgroundColor: XTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Subscriptions'),
        // centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
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
                            subtitle: Text('${cardItems[index].planDetails}'),
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
                                  style: XTheme.of(context).bodyText1.override(
                                      color: Colors.black,
                                      fontFamily: 'Montserrat',
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text('${cardItems[index].subsTime}'.split(' ')[0])
                              ],
                            ),
                          ),
                          if (expandedIndex == index)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text('Payment Info   ' + cardItems[index].planDetails),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text('\$ ${cardItems[index].subAmount}'),
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
          ),
        ),
      ),
    );
  }
}
