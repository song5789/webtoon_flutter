class WebtoonModel {
  final String title, thumb, id;

  /*named constructor Map 타입의 데이터를 받아 
  클래스의 프로퍼티를 '키'에 해당하는 값으로 초기화함.*/
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
