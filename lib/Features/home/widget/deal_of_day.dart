import 'package:flutter/material.dart';

class DealOfDayWidget extends StatelessWidget {
  const DealOfDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deal of the day',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Image.network(
          'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mbp-spacegray-select-202206_GEO_TH_LANG_TH?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1654014006419',
          height: 200,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 10),
          alignment: Alignment.topLeft,
          child: const Text(
            "\$999.0",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          alignment: Alignment.topLeft,
          child: const Text(
            "Rivaan",
            maxLines: 2,
            style: TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Image.network(
                'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mbp-spacegray-select-202206_GEO_TH_LANG_TH?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1654014006419',
                fit: BoxFit.fitHeight,
                height: 100,
              ),
              Image.network(
                'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mbp-spacegray-select-202206_GEO_TH_LANG_TH?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1654014006419',
                fit: BoxFit.fitHeight,
                height: 100,
              ),
              Image.network(
                'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mbp-spacegray-select-202206_GEO_TH_LANG_TH?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1654014006419',
                fit: BoxFit.fitHeight,
                height: 100,
              ),
              Image.network(
                'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mbp-spacegray-select-202206_GEO_TH_LANG_TH?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1654014006419',
                fit: BoxFit.fitHeight,
                height: 100,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            "See all Deals",
            style: TextStyle(color: Colors.cyan[800]),
          ),
        )
      ],
    );
  }
}
