import 'package:fetch_data_bloc_rxdart/bloc/weather_bloc.dart';
import 'package:fetch_data_bloc_rxdart/model/weather_response_model.dart';
import 'package:flutter/material.dart';



class WeatherScreen extends StatefulWidget {
  @override
  WeatherScreenState createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    weatherBloc.fetchLondonWeather();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Fetch data using Rx Dart")),
      ),
      body: StreamBuilder(
          stream: weatherBloc.weather,
          builder: (context, AsyncSnapshot<List<WeatherResponse>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,c){
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Text(
                          snapshot.data[c].name,
                          style:
                          TextStyle(color: Color.fromRGBO(0, 123, 174, 100), fontSize: 15.0),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          snapshot.data[c].email,
                          style:
                          TextStyle(color: Color.fromRGBO(0, 123, 174, 100), fontSize: 15.0),
                          textAlign: TextAlign.center,
                        ),Text(
                          snapshot.data[c].phone.toString(),
                          style:
                          TextStyle(color: Color.fromRGBO(0, 123, 174, 100), fontSize: 15.0),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }



}
