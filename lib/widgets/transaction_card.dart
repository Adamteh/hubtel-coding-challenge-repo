import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionCard extends StatelessWidget {
  final String time;
  final String name;
  final String number;
  final String amount;
  final String subtext;
  final String? subtext1;

  final bool mtnMomo;
  final bool success;
  final bool star;

  const TransactionCard({
    super.key,
    required this.time,
    required this.name,
    required this.number,
    required this.amount,
    required this.subtext,
    this.subtext1,
    this.mtnMomo = true,
    this.success = true,
    this.star = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE6EAED)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF9CABB8),
            ),
          ),
          const SizedBox(height: 11),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  mtnMomo ? "assets/mtn_momo.png" : "assets/absa.png",
                  width: 39,
                  height: 39,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(name),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: success
                                    ? const Color(0xFFDBF7E0)
                                    : const Color(0xFFFDB0AC),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(13),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    success
                                        ? "assets/success.svg"
                                        : "assets/failed.svg",
                                    width: 11,
                                    height: 11,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    success ? "Successful" : "Failed",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: success
                                          ? const Color(0xFF70E083)
                                          : const Color(0xFF99231D),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            number,
                            style: const TextStyle(
                              color: Color(0xFF9EADBA),
                            ),
                          ),
                          Text(
                            amount,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          //Line
          const Divider(color: Color(0xFFE6EAED), thickness: 1),
          const SizedBox(height: 16),

          //Bottom
          Row(
            mainAxisAlignment: subtext1 != null
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/person.svg",
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    subtext,
                    style: const TextStyle(fontSize: 12),
                  ),
                  if (subtext1 != null)
                    Container(
                      width: 4,
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        color: Color(0xFF9CABB8),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                  if (subtext1 != null)
                    Text(
                      subtext1!,
                      style: const TextStyle(fontSize: 12),
                    ),
                ],
              ),
              if (star)
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SvgPicture.asset(
                    "assets/favorite.svg",
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
