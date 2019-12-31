/*

class WeatherResponse {

  final String name;



  WeatherResponse({this.name});

  factory WeatherResponse.fromJson(Map<String, dynamic> usersjson)=> WeatherResponse(

      name: usersjson["name"],

  );
}
*/




class WeatherResponse {

  String name;
  String email;
  String phone;



  WeatherResponse(
      {
        this.name,
        this.email,
        this.phone,

      });

  WeatherResponse.fromJson(Map<String, dynamic> json) {

    name = json['name'];
    email = json['email'];
    phone = json['phone'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;

    return data;
  }
}

