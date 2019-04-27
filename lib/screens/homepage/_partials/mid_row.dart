import 'package:flutter/material.dart';
import 'package:tailor_made/constants/mk_style.dart';
import 'package:tailor_made/models/stats.dart';
import 'package:tailor_made/screens/gallery/gallery.dart';
import 'package:tailor_made/screens/homepage/_partials/helpers.dart';
import 'package:tailor_made/screens/payments/payments.dart';
import 'package:tailor_made/utils/mk_money.dart';
import 'package:tailor_made/utils/mk_navigate.dart';

class MidRowWidget extends StatelessWidget {
  const MidRowWidget({
    Key key,
    @required this.stats,
  }) : super(key: key);

  final StatsModel stats;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: const Border(bottom: const MkBorderSide()),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                border: const Border(
                  right: const MkBorderSide(),
                ),
              ),
              child: TMGridTile(
                color: Colors.redAccent,
                icon: Icons.attach_money,
                title: "Payments",
                subTitle: "${MkMoney(stats.payments.total).format} Total",
                onPressed: () => MkNavigate(context, const PaymentsPage()),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: TMGridTile(
                color: Colors.blueAccent,
                icon: Icons.image,
                title: "Gallery",
                subTitle: "${stats.gallery.total} Photos",
                onPressed: () => MkNavigate(context, const GalleryPage()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}