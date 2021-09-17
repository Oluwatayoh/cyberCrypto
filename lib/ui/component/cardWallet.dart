
  import 'package:cyberCrypto/ui/component/card.dart';
import 'package:flutter/material.dart';

Widget cardWalletBalance(BuildContext context,
      {String? total, totalCrypto, double? precent}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: card(
        width: MediaQuery.of(context).size.width - 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: Material(
                    // color: Colors.black87,
                    child: InkWell(
                      splashColor: Colors.red, // inkwell color
                      child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(
                            Icons.account_balance_wallet,
                            // color: Colors.white,
                            size: 25.0,
                          )),
                      onTap: () {},
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text('Total Wallet Balance',
                      style: TextStyle(fontFamily: "Nunito-Medium")),
                ),
                Row(
                  children: [
                    Text('USD', style: TextStyle(fontFamily: "Nunito-Medium")),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                )
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$total',
                  style: TextStyle(
                    fontFamily: "Nunito-Bold",
                    fontSize: 40,
                    // color: Colors.black87
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                      color: precent! >= 0 ? Colors.green : Colors.pink,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Text(
                    precent >= 0 ? '+ $precent %' : '$precent %',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 15,
                      fontFamily: "Nunito-Bold",
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              '$totalCrypto',
              style: TextStyle(
                fontFamily: "Nunito-Bold",
                fontSize: 22,
                // color: Colors.black38
              ),
            ),
            // Center(
            //   child: Icon(
            //     Icons.keyboard_arrow_down,
            //     size: 30,
            //     //  color:
            //     // Colors.black45
            //   ),
            // )
          ],
        ),
      ),
    );
  }
