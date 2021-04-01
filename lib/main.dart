import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Roboto"),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int totalPage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
  _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage("assets/images/one.jpg", "INDIA Gate",  "The India Gate (formerly known as the All India War Memorial) is a war memorial located astride the Rajpath, on the eastern edge of the ceremonial axis of ...", 1),
          makePage("assets/images/two.jpg", "GOLDEN GATE Bridge", "Golden Gate Bridge is a suspension bridge across the place the where San Francisco Bay opens into the Pacific Ocean, so-called Golden Gate (hence the name). It connects San Francisco with Marin County and it is 2737 meters long and 227 meters high. Some 45 million of vehicles cross Golden Gate Bridge in a year.", 2),
          makePage("assets/images/three.jpg", "PARIS Eiffel Tower", "The Eiffel Tower is a wrought iron tower that stands 1,063 ft (324 m) tall. It was designed for the Exposition Universelle, a world fair held in Paris in 1889. It is currently the most famous symbol of Paris.", 3),
          makePage("assets/images/four.jpg", "DUBAI Burj Khalifa", "Burj Khalifa (Arabic: برج خليفة‎, Khalifa Tower) is an extremely tall skyscraper in Dubai, United Arab Emirates named after Khalifa bin Zayed Al Nahyan, and is the tallest building ever built, at 828 metres (2,717 feet). Before the building opened, it was called Burj Dubai. The building is 162 stories high.", 4),
        ],
      ),
    );
  }

  Widget makePage(image, String title, String description, int page) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
            0.3,
            0.9
          ], colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.2),
          ]),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(page.toString(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                  Text('/' + totalPage.toString(), style: TextStyle(color: Colors.white, fontSize: 15),)
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Icon(Icons.star, color: Colors.grey, size: 15,),
                      ),
                      Text('4.0',style: TextStyle(color: Colors.white70),),
                      Text('(2300)',style: TextStyle(color: Colors.white38, fontSize: 12),)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                   Padding(
                       padding: const EdgeInsets.only(right: 50),
                      child: Text(description,style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.8, fontSize: 15),),
                   ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("READ MORE", style:  TextStyle(color: Colors.white),),
                  SizedBox(height: 30,),
                ],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
