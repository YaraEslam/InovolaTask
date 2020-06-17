class Item {
  int id;
  String title;
  List<String> img;
  String interest;
  int price;
  String date;
  String address;
  String trainerName;
  String trainerImg;
  String trainerInfo;
  String occasionDetail;
  String latitude;
  String longitude;
  bool isLiked;
  bool isSold;
  bool isPrivateEvent;
  bool hiddenCashPayment;
  int specialForm;
  String questionnaire;
  String questExplanation;

  Item(
      {this.id,
      this.title,
      this.img,
      this.interest,
      this.price,
      this.date,
      this.address,
      this.trainerName,
      this.trainerImg,
      this.trainerInfo,
      this.occasionDetail,
      this.latitude,
      this.longitude,
      this.isLiked,
      this.isSold,
      this.isPrivateEvent,
      this.hiddenCashPayment,
      this.specialForm,
      this.questionnaire,
      this.questExplanation});

  Item.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        interest = map['interest'],
        price = map['price'],
        date = map['date'],
        address = map['address'],
        trainerName = map['trainerName'],
        trainerImg = map['trainerImg'],
        trainerInfo = map['trainerInfo'],
        occasionDetail = map['occasionDetail'],
        latitude = map['latitude'],
        longitude = map['longitude'],
        isLiked = map['isLiked'],
        isSold = map['isSold'],
        img = parseImgs(map['img']),
        isPrivateEvent = map['isPrivateEvent'],
        hiddenCashPayment = map['hiddenCashPayment'],
        specialForm = map['specialForm'],
        questionnaire = map['questionnaire'],
        questExplanation = map['questExplanation'];

  static List<String> parseImgs(imgsJson) {
    List<String> imgsList = new List<String>.from(imgsJson);
    return imgsList;
  }
}
