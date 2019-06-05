// returns picture based on current question number
class QuestionPic {
  final int _questionNum;
  final List<String> _pics = ["https://www.ancient.eu/uploads/images/display-400.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Beijingskyscraperpic5_crop_rotate_lighten.jpg/250px-Beijingskyscraperpic5_crop_rotate_lighten.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/6/60/Chinatown-little-italy-manhattan-2004.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Kayaking_in_Alaska_P1010034.JPG/1280px-Kayaking_in_Alaska_P1010034.JPG",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Aerial_view_of_Lincoln_Memorial_-_east_side_EDIT.jpeg/800px-Aerial_view_of_Lincoln_Memorial_-_east_side_EDIT.jpeg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Street_food_Yasothon.jpg/1920px-Street_food_Yasothon.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/2/26/MumbaiClimate.jpg",
  "http://cdn3.chartsbin.com/chartimages/l_39717_b077e4fda907d411ea38755fa7be90f0",
  "http://www.arabianbusiness.com/sites/default/files/styles/full_img/public/images/2016/04/03/rosay%2Bcavalli%2Bclub.jpg",
  "https://backroads-web.s3.amazonaws.com/images/trips/2018/slideshow/WSLI-scotland-walking-hiking-tour-6.jpg"];

  QuestionPic(this._questionNum);

  String getPicLink() {
    return _pics[_questionNum - 1];
  }
}

