import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController(viewportFraction: 0.6);

  double pageOffSet = 0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        pageOffSet = pageController.page!;
      });
    
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      height: 300,
                      child: Image.network(
                        'https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                        fit: BoxFit.cover,
                        alignment: Alignment(-pageOffSet.abs() + index, 0),
                      ),
                    )),
               
              ],
            ),
          );
        });
  }
}
