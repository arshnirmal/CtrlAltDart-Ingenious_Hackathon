import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final String _name = "Arsh";
  final String _gender = "M";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hi, $_name",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                CircleAvatar(
                  onForegroundImageError: null,
                  radius: 25,
                  backgroundImage: NetworkImage(
                    _gender == "M"
                        ? "https://cdn-icons-png.flaticon.com/512/2202/2202112.png"
                        : _gender == "F"
                            ? "https://cdn-icons-png.flaticon.com/512/201/201634.png"
                            : "",
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(20),
            child: _buildStaggeredGrid(context),
          ),
        ],
      ),
    );
  }

  Widget _buildStaggeredGrid(BuildContext context) {
    List<String> hospitalIcon = [
      "https://cdn-icons-png.flaticon.com/512/2749/2749678.png",
      "https://cdn-icons-png.flaticon.com/512/619/619051.png",
      "https://cdn-icons-png.flaticon.com/512/2499/2499831.png",
      "https://cdn-icons-png.flaticon.com/512/4320/4320371.png",
      "https://cdn-icons-png.flaticon.com/512/3209/3209074.png",
    ];
    return MasonryGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 18,
      itemCount: hospitalIcon.length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
            ),
          ],
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1.0,
          ),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.2),
            ],
            stops: const [0.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: hospitalIcon[index],
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Hospital $index",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
