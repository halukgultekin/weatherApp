import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp/blocs/weather/bloc/weather_bloc.dart';
import 'package:flutter_weatherapp/widgets/sehir_sec.dart';
import 'hava_durumu_resim.dart';
import 'location.dart';
import 'max_and_min_sicaklik.dart';
import 'son_guncelleme.dart';

class WeatherApp extends StatelessWidget {
  String kullanicininGirdigiSehir = 'Ankara';
  WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () async {
                kullanicininGirdigiSehir = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SehirSecWidget()));
                debugPrint('Secilen Sehir : ' + kullanicininGirdigiSehir);
                if (kullanicininGirdigiSehir != null) {
                  _weatherBloc.add(FetchWeatherEvent(sehirAdi: kullanicininGirdigiSehir));
                }
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
          child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, WeatherState state) {
          if (state is WeatherInitial) {
            return Center(
              child: Text('Sehir Seciniz'),
            );
          }
          if (state is WeatherLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is WeatherLoadedState) {
            final getirilenWeather = state.weather;
            return ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: LocationWidget(
                          secilenSehir: getirilenWeather.title),),
                      
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: SonGuncellemeWidget()),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: HavaDurumuResimWidget()),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: MaxandMinSicaklikWidget()),
                ),
              ],
            );
          }
          if (state is WeatherErrorState) {
            return Center(
              child: Text('Hata cikti'),
            );
          } 
        },
      )),
    );
  }
}
