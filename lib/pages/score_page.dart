// screen shows best travel destination

import 'package:flutter/material.dart';
import './landing_page.dart';

class ScorePage extends StatelessWidget {
  final List<int> score;

  ScorePage(this.score) {
    determineCompatibility();
  }

  // calculate compatibility by
  String determineCompatibility() {
    final int cityCount = 25;
    final int questionCount = 10;
    int mostCompatibleRating = 101;
    int mostCompatibleCity = 0;

    Map cityRatings = {"Macau, China": [7, 10, 9, 4, 8, 10, 10, 10, 10, 3],
                        "Bangkok, Thailand": [3, 8, 5, 5, 7, 10, 10, 7, 10, 5],
                        "London, United Kingdom": [9, 10, 7, 7, 10, 7, 4, 6, 10, 3],
                        "Hong Kong, China": [3, 10, 4, 6, 9, 10, 9, 9, 10, 8],
                        "Kuala Lumpur, Malaysia": [4, 8, 10, 4, 6, 10, 10, 5, 10, 6],
                        "New York City, United States of America": [6, 10, 9, 3, 8, 8, 3, 7, 10, 2],
                        "Christchurch, New Zealand": [3, 5, 6, 10, 5, 7, 6, 8, 5, 10],
                        "Sydney, Australia": [2, 7, 3, 7, 6, 4, 8, 8, 7, 7],
                        "Istanbul, Turkey": [9, 4, 5, 3, 7, 9, 8, 8, 7, 8],
                        "Jerusalem, Israel": [10, 2, 10, 3, 10, 9, 8, 9, 6, 8],
                        "Rome, Italy": [10, 4, 4, 4, 10, 5, 7, 7, 9, 6],
                        "Paris, France": [9, 6, 3, 3, 10, 4, 5, 7, 9, 2],
                        "Mecca, Saudi Arabia": [8, 5, 3, 3, 7, 7, 10, 9, 5, 5],
                        "Taipei, Taiwan": [5, 9, 2, 7, 4, 9, 8, 10, 8, 8],
                        "Shanghai, China": [3, 10, 3, 4, 3, 10, 5, 8, 8, 5],
                        "Las Vegas, United States of America": [1, 10, 5, 6, 1, 2, 10, 5, 10, 6],
                        "Miami, United States of America": [3, 10, 8, 5, 2, 4, 9, 4, 10, 2],
                        "Budapest, Hungary": [10, 8, 4, 4, 7, 5, 3, 6, 8, 7],
                        "Cape Town, South Africa": [4, 5, 3, 6, 2, 4, 7, 1, 4, 8],
                        "Cairo, Egypt": [10, 5, 6, 2, 10, 7, 9, 8, 4, 4],
                        "Reykjavik, Iceland": [4, 4, 1, 10, 3, 2, 2, 10, 5, 10],
                        "Tokyo, Japan": [5, 10, 2, 5, 5, 7, 4, 10, 9, 7],
                        "Tehran, Iran": [10, 7, 9, 6, 8, 9, 5, 9, 4, 9],
                        "Rio de Janeiro, Brazil": [3, 4, 7, 4, 3, 10, 9, 2, 8, 5],
                        "Mexico City, Mexico": [3, 6, 5, 5, 5, 10, 9, 3, 7, 7]};
/*
// Chinese version
    Map cityRatings = {"澳门": [7, 10, 9, 4, 8, 10, 10, 10, 10, 3],
      "曼谷": [3, 8, 5, 5, 7, 10, 10, 7, 10, 5],
      "伦敦": [9, 10, 7, 7, 10, 7, 4, 6, 10, 3],
      "香港": [3, 10, 4, 6, 9, 10, 9, 9, 10, 8],
      "吉隆坡": [4, 8, 10, 4, 6, 10, 10, 5, 10, 6],
      "纽约市": [6, 10, 9, 3, 8, 8, 3, 7, 10, 2],
      "克赖斯特彻奇": [3, 5, 6, 10, 5, 7, 6, 8, 5, 10],
      "悉尼": [2, 7, 3, 7, 6, 4, 8, 8, 7, 7],
      "伊斯坦布尔": [9, 4, 5, 3, 7, 9, 8, 8, 7, 8],
      "耶路撒冷": [10, 2, 10, 3, 10, 9, 8, 9, 6, 8],
      "罗马": [10, 4, 4, 4, 10, 5, 7, 7, 9, 6],
      "巴黎": [9, 6, 3, 3, 10, 4, 5, 7, 9, 2],
      "麦加": [8, 5, 3, 3, 7, 7, 10, 9, 5, 5],
      "台北": [5, 9, 2, 7, 4, 9, 8, 10, 8, 8],
      "上海": [3, 10, 3, 4, 3, 10, 5, 8, 8, 5],
      "拉斯维加斯": [1, 10, 5, 6, 1, 2, 10, 5, 10, 6],
      "迈阿密": [3, 10, 8, 5, 2, 4, 9, 4, 10, 2],
      "布达佩斯": [10, 8, 4, 4, 7, 5, 3, 6, 8, 7],
      "开普敦": [4, 5, 3, 6, 2, 4, 7, 1, 4, 8],
      "开罗": [10, 5, 6, 2, 10, 7, 9, 8, 4, 4],
      "雷克雅未克": [4, 4, 1, 10, 3, 2, 2, 10, 5, 10],
      "东京": [5, 10, 2, 5, 5, 7, 4, 10, 9, 7],
      "德黑兰": [10, 7, 9, 6, 8, 9, 5, 9, 4, 9],
      "里约热内卢": [3, 4, 7, 4, 3, 10, 9, 2, 8, 5],
      "墨西哥城": [3, 6, 5, 5, 5, 10, 9, 3, 7, 7]};
*/
    List<String> cityNames = new List(cityCount);
    List<List<int>> ratings = new List(cityCount);

    {
      int i = 0;
      for (var city in cityRatings.keys) {
        cityNames[i] = city;
        i++;
      }
    }

    {
      int i = 0;
      for (var ratingsList in cityRatings.values) {
        ratings[i] = ratingsList;
        i++;
      }
    }

    List<int> compatibility = new List(25);
    for (int i = 0; i < cityCount; i++) {
      compatibility[i] = 0;
    }

    for (int i = 0; i < cityCount; i++) {
      for (int j = 0; j < questionCount; j++) {
        compatibility[i] += (score[j] - ratings[i][j]).abs();
      }
    }

    for (int i = 0; i < cityCount; i++) {
      if (compatibility[i] < mostCompatibleRating) {
        mostCompatibleRating = compatibility[i];
        mostCompatibleCity = i;
      }
    }

    return cityNames[mostCompatibleCity];
  }

  /*
  // Chinese version
  {"澳门": [7, 10, 9, 4, 8, 10, 10, 10, 10, 3],
      "曼谷": [3, 8, 5, 5, 7, 10, 10, 7, 10, 5],
      "伦敦": [9, 10, 7, 7, 10, 7, 4, 6, 10, 3],
      "香港": [3, 10, 4, 6, 9, 10, 9, 9, 10, 8],
      "吉隆坡": [4, 8, 10, 4, 6, 10, 10, 5, 10, 6],
      "纽约市": [6, 10, 9, 3, 8, 8, 3, 7, 10, 2],
      "克赖斯特彻奇": [3, 5, 6, 10, 5, 7, 6, 8, 5, 10],
      "悉尼": [2, 7, 3, 7, 6, 4, 8, 8, 7, 7],
      "伊斯坦布尔": [9, 4, 5, 3, 7, 9, 8, 8, 7, 8],
      "耶路撒冷": [10, 2, 10, 3, 10, 9, 8, 9, 6, 8],
      "罗马": [10, 4, 4, 4, 10, 5, 7, 7, 9, 6],
      "巴黎": [9, 6, 3, 3, 10, 4, 5, 7, 9, 2],
      "麦加": [8, 5, 3, 3, 7, 7, 10, 9, 5, 5],
      "台北": [5, 9, 2, 7, 4, 9, 8, 10, 8, 8],
      "上海": [3, 10, 3, 4, 3, 10, 5, 8, 8, 5],
      "拉斯维加斯": [1, 10, 5, 6, 1, 2, 10, 5, 10, 6],
      "迈阿密": [3, 10, 8, 5, 2, 4, 9, 4, 10, 2],
      "布达佩斯": [10, 8, 4, 4, 7, 5, 3, 6, 8, 7],
      "开普敦": [4, 5, 3, 6, 2, 4, 7, 1, 4, 8],
      "开罗": [10, 5, 6, 2, 10, 7, 9, 8, 4, 4],
      "雷克雅未克": [4, 4, 1, 10, 3, 2, 2, 10, 5, 10],
      "东京": [5, 10, 2, 5, 5, 7, 4, 10, 9, 7],
      "德黑兰": [10, 7, 9, 6, 8, 9, 5, 9, 4, 9],
      "里约热内卢": [3, 4, 7, 4, 3, 10, 9, 2, 8, 5],
      "墨西哥城": [3, 6, 5, 5, 5, 10, 9, 3, 7, 7]};
   */


  String getCityPic(String mostCompatible) {
    Map cityPics = {"Macau, China": ['http://i.imgur.com/Kxxkl.jpg', '1600 1067', 'http://www.kowloon.climatemps.com/kowloon-climate-graph.gif'],
      "Bangkok, Thailand": ['http://i.imgur.com/Iw6zgk2.jpg', '1080 1350', 'http://www.bangkok.climatemps.com/bangkok-climate-graph.gif'],
      "London, United Kingdom": ['http://i.imgur.com/NATKgC8.jpg', '1100 733', 'http://www.london.climatemps.com/london-climate-graph.gif'],
      "Hong Kong, China": ['http://i.imgur.com/MTtyvH6.jpg', '1400 939', 'http://www.kowloon.climatemps.com/kowloon-climate-graph.gif'],
      "Kuala Lumpur, Malaysia": ['https://c1.staticflickr.com/9/8334/28494626084_4cde1d3fc6_h.jpg', '1600 1068', 'http://www.kuala-lumpur.climatemps.com/kuala-lumpur-climate-graph.gif'],
      "New York City, United States of America": ['http://i.imgur.com/uaLnKh1.jpg', '1366 768', 'http://www.new-york.climatemps.com/new-york-climate-graph.gif'],
      "Christchurch, New Zealand": ['https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/ChristChurch_Cathedral_in_summer.jpg/1280px-ChristChurch_Cathedral_in_summer.jpg', '1025 753', 'http://www.christchurch.climatemps.com/christchurch-climate-graph.gif'],
      "Sydney, Australia": ['http://farm3.staticflickr.com/2849/9758954285_6f7e2482f3_b.jpg', '1024 683', 'http://www.sydney-aero.climatemps.com/sydney-aero-climate-graph.gif'],
      "Istanbul, Turkey": ['https://farm3.staticflickr.com/2950/15214108687_18148b5f1a_b.jpg', '1024 678', 'http://www.istanbul.climatemps.com/istanbul-climate-graph.gif'],
      "Jerusalem, Israel": ['http://25.media.tumblr.com/17a9c887d0f0e406dbc68ec038bd00bd/tumblr_mv3fcgTuRx1s7f3fyo1_1280.jpg', '900 655', 'http://www.jerusalem.climatemps.com/jerusalem-climate-graph.gif'],
      "Rome, Italy": ['http://i.imgur.com/hAZaF.jpg', '720 540', 'http://www.rome.climatemps.com/rome-climate-graph.gif'],
      "Paris, France": ['http://farm6.staticflickr.com/5547/11269506663_9e8a77eed8_h.jpg', '1600 986', 'http://www.paris.climatemps.com/paris-climate-graph.gif'],
      "Mecca, Saudi Arabia": ['http://i.imgur.com/iClGNkG.jpg', '1119 768', 'http://www.jeddah.climatemps.com/jeddah-climate-graph.gif'],
      "Taipei, Taiwan": ['http://i.imgur.com/rGXc7.jpg', '960 960', 'http://www.taiwan.climatemps.com/taiwan-climate-graph.gif'],
      "Shanghai, China": ['http://i.imgur.com/SxuWXt0.jpg', '1280 853', 'http://www.shanghai.climatemps.com/shanghai-climate-graph.gif'],
      "Las Vegas, United States of America": ['http://i.imgur.com/mTCDvGs.jpg', '979 733', 'http://www.las-vegas.climatemps.com/las-vegas-climate-graph.gif'],
      "Miami, United States of America": ['http://miamioclock.com/wp-content/uploads/2015/09/miami-florida-usa-street-sky.jpg', '1365 768', 'http://www.miami.climatemps.com/miami-climate-graph.gif'],
      "Budapest, Hungary": ['http://i.imgur.com/OABfgku.jpg', '880 586', 'http://www.budapest.climatemps.com/budapest-climate-graph.gif'],
      "Cape Town, South Africa": ['http://i.imgur.com/o6osRPf.jpg', '1024 593', 'http://www.cape-town.climatemps.com/cape-town-climate-graph.gif'],
      "Cairo, Egypt": ['http://i.imgur.com/XovuFtm.jpg', '1024 652', 'http://www.cairo.climatemps.com/cairo-climate-graph.gif'],
      "Reykjavik, Iceland": ['https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Reykjavik_rooftops.jpg/800px-Reykjavik_rooftops.jpg', '800 600', 'http://www.reykjavik.climatemps.com/reykjavik-climate-graph.gif'],
      "Tokyo, Japan": ['https://i.imgur.com/1hMk4mu.jpg', '1600 580', 'http://www.tokyo.climatemps.com/tokyo-climate-graph.gif'],
      "Tehran, Iran": ['http://i.imgur.com/vBWU8dt.jpg', '960 623', 'http://www.tehran.climatemps.com/tehran-climate-graph.gif'],
      "Rio de Janeiro, Brazil": ['http://i.imgur.com/H8sWn0l.jpg', '1400 932', 'http://www.rio-de-janeiro.climatemps.com/rio-de-janeiro-climate-graph.gif'],
      "Mexico City, Mexico": ['http://i.imgur.com/090IIsw.jpg', '1024 768', 'http://www.mexico-city.climatemps.com/mexico-city-climate-graph.gif']};
    return cityPics[mostCompatible][0];
  /*
  // Chinese version
    String getCityPic(String mostCompatible) {
      Map cityPics = {"澳门": ['http://i.imgur.com/Kxxkl.jpg', '1600 1067', 'http://www.kowloon.climatemps.com/kowloon-climate-graph.gif'],
        "曼谷": ['http://i.imgur.com/Iw6zgk2.jpg', '1080 1350', 'http://www.bangkok.climatemps.com/bangkok-climate-graph.gif'],
        "伦敦": ['http://i.imgur.com/NATKgC8.jpg', '1100 733', 'http://www.london.climatemps.com/london-climate-graph.gif'],
        "香港": ['http://i.imgur.com/MTtyvH6.jpg', '1400 939', 'http://www.kowloon.climatemps.com/kowloon-climate-graph.gif'],
        "吉隆坡": ['https://c1.staticflickr.com/9/8334/28494626084_4cde1d3fc6_h.jpg', '1600 1068', 'http://www.kuala-lumpur.climatemps.com/kuala-lumpur-climate-graph.gif'],
        "纽约市": ['http://i.imgur.com/uaLnKh1.jpg', '1366 768', 'http://www.new-york.climatemps.com/new-york-climate-graph.gif'],
        "克赖斯特彻奇": ['http://www.royalbusiness.ac.nz/wp-content/uploads/chch5.jpg', '1025 753', 'http://www.christchurch.climatemps.com/christchurch-climate-graph.gif'],
        "悉尼": ['http://farm3.staticflickr.com/2849/9758954285_6f7e2482f3_b.jpg', '1024 683', 'http://www.sydney-aero.climatemps.com/sydney-aero-climate-graph.gif'],
        "伊斯坦布尔": ['https://farm3.staticflickr.com/2950/15214108687_18148b5f1a_b.jpg', '1024 678', 'http://www.istanbul.climatemps.com/istanbul-climate-graph.gif'],
        "耶路撒冷": ['http://25.media.tumblr.com/17a9c887d0f0e406dbc68ec038bd00bd/tumblr_mv3fcgTuRx1s7f3fyo1_1280.jpg', '900 655', 'http://www.jerusalem.climatemps.com/jerusalem-climate-graph.gif'],
        "罗马": ['http://i.imgur.com/hAZaF.jpg', '720 540', 'http://www.rome.climatemps.com/rome-climate-graph.gif'],
        "巴黎": ['http://farm6.staticflickr.com/5547/11269506663_9e8a77eed8_h.jpg', '1600 986', 'http://www.paris.climatemps.com/paris-climate-graph.gif'],
        "麦加": ['http://i.imgur.com/iClGNkG.jpg', '1119 768', 'http://www.jeddah.climatemps.com/jeddah-climate-graph.gif'],
        "台北": ['http://i.imgur.com/rGXc7.jpg', '960 960', 'http://www.taiwan.climatemps.com/taiwan-climate-graph.gif'],
        "上海": ['http://i.imgur.com/SxuWXt0.jpg', '1280 853', 'http://www.shanghai.climatemps.com/shanghai-climate-graph.gif'],
        "拉斯维加斯": ['http://i.imgur.com/mTCDvGs.jpg', '979 733', 'http://www.las-vegas.climatemps.com/las-vegas-climate-graph.gif'],
        "迈阿密": ['http://miamioclock.com/wp-content/uploads/2015/09/miami-florida-usa-street-sky.jpg', '1365 768', 'http://www.miami.climatemps.com/miami-climate-graph.gif'],
        "布达佩斯": ['http://i.imgur.com/OABfgku.jpg', '880 586', 'http://www.budapest.climatemps.com/budapest-climate-graph.gif'],
        "开普敦": ['http://i.imgur.com/o6osRPf.jpg', '1024 593', 'http://www.cape-town.climatemps.com/cape-town-climate-graph.gif'],
        "开罗": ['http://i.imgur.com/XovuFtm.jpg', '1024 652', 'http://www.cairo.climatemps.com/cairo-climate-graph.gif'],
        "雷克雅未克": ['https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Reykjavik_rooftops.jpg/800px-Reykjavik_rooftops.jpg', '800 600', 'http://www.reykjavik.climatemps.com/reykjavik-climate-graph.gif'],
        "东京": ['https://i.imgur.com/1hMk4mu.jpg', '1600 580', 'http://www.tokyo.climatemps.com/tokyo-climate-graph.gif'],
        "德黑兰": ['http://i.imgur.com/vBWU8dt.jpg', '960 623', 'http://www.tehran.climatemps.com/tehran-climate-graph.gif'],
        "里约热内卢": ['http://i.imgur.com/H8sWn0l.jpg', '1400 932', 'http://www.rio-de-janeiro.climatemps.com/rio-de-janeiro-climate-graph.gif'],
        "墨西哥城": ['http://i.imgur.com/090IIsw.jpg', '1024 768', 'http://www.mexico-city.climatemps.com/mexico-city-climate-graph.gif']};
    return cityPics[mostCompatible][0];
  */
  }

  // the background image changes fit when phone changes orientation
  BoxFit returnFit(context) {
    if (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)
      return BoxFit.fitHeight;
    else {
      return BoxFit.fitWidth;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: NetworkImage(getCityPic(determineCompatibility())),
            fit: returnFit(context),
          ),
        ),
        child: new Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Center(
                  child: Material(
                    color: Colors.transparent,
                    child: new Text(determineCompatibility(), textAlign: TextAlign.center, style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0)),
                  )
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              new Material(
                color: Colors.transparent,
                child: IconButton(
                    icon: new Icon(Icons.replay),
                    color: Colors.white,
                    iconSize: MediaQuery.of(context).size.height * 0.2,
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), (Route route) => route == null)
                )
              )
            ]
        )
    );
  }
}