import 'package:flutter/material.dart';
import 'package:project/core/extensions/double_ext.dart';
import 'package:project/core/themes/font_weight.dart';
import 'package:project/model/hotel_model.dart';
import 'package:project/view/widgets/hotel_card.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<HotelModel> hotels = [
      HotelModel(
        name: 'ASTON Jember Hotel & Conference Center',
        price: 557650,
        imageUrl:
            "https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10001738-1dd90571af09c0a13bceac9bf6185789.jpeg?tr=q-40,w-300,h-300&_src=imagekit",
      ),
      HotelModel(
        name: 'Java Lotus Hotel Jember',
        price: 456000,
        imageUrl:
            "https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20044885-258c2e71ba0710ef55d89bc31c0fa8b2.jpeg?tr=q-40,w-300,h-300&_src=imagekit",
      ),
      HotelModel(
        name: 'Hotel Dafam Fortuna Jember',
        price: 375000,
        imageUrl:
            "https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20013654-69382e697e1876b7847ba4827c59e420.jpeg?tr=q-40,w-300,h-300&_src=imagekit",
      ),
      HotelModel(
        name: 'Hotel 88 Jember By WH',
        price: 289999,
        imageUrl:
            "https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10043589-126be15814a8c89298c1db5382c544ee.jpeg?tr=q-40,w-300,h-300&_src=imagekit",
      ),
      HotelModel(
        name: 'Hotel Cendrawasih',
        price: 120000,
        imageUrl:
            "https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10013345-800x477-FIT_AND_TRIM-78ccca8ab19fd6c9db4996fa0771ce64.jpeg?tr=q-40,w-300,h-300&_src=imagekit",
      ),
      HotelModel(
        name: 'Royal Hotel n\' Lounge Jember',
        price: 361500,
        imageUrl:
            "https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10002377-4397bd09d5e0e4a3158594ec30efc372.jpeg?tr=q-40,w-300,h-300&_src=imagekit",
      ),
    ];

    return Column(
      children: [
        const Text(
          "About Us",
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FW.medium,
          ),
        ),
        20.0.height,
        const Text(
            "Hotelifoz adalah sebuah aplikasi booking hotel yang dibangun dengan teknologi terbaru dan paling inovatif. Kami terus mengembangkan dan memperbaiki layanan kami untuk memberikan pengalaman yang terbaik bagi pelanggan kami. Kami ingin menjadi partner terpercaya Anda dalam setiap perjalanan."),
        20.0.height,
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0,
            crossAxisCount: 2,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
          ),
          itemCount: hotels.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return HotelCard(item: hotels[index]);
          },
        ),
        40.0.height,
      ],
    );
  }
}
