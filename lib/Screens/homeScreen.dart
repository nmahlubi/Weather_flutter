import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/weatherProvider.dart';
import '../widgets/fadeIn.dart';
import '../widgets/locationError.dart';
import '../widgets/mainWeather.dart';
import '../widgets/requestError.dart';
import '../widgets/sevenDayForecast.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';

  HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    _isLoading = true;
    final weatherData = Provider.of<WeatherProvider>(context, listen: false);
    weatherData.getWeatherData();
    _isLoading = false;
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<WeatherProvider>(context, listen: false)
        .getWeatherData(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Consumer<WeatherProvider>(
            builder: (context, weatherProv, _) {
              if (weatherProv.isLocationError) {
                return LocationError();
              }
              if (weatherProv.isRequestError) {
                return RequestError();
              }
              return Column(
                children: [
                  _isLoading || weatherProv.isLoading
                      ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: themeContext.primaryColor,
                        color: Colors.white,
                      ),
                    ),
                  )
                      : Expanded(
                    child: PageView(
                      children: [
                        RefreshIndicator(
                          onRefresh: () async => _refreshData(context),
                          child:
                          LayoutBuilder(
                            builder: (context, constraints) => SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: constraints.maxHeight * .4,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/karl-magnuson-I5GCrapVFdQ-unsplash.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child:  FadeIn(
                                      curve: Curves.easeIn,
                                      duration: const Duration(milliseconds: 250),
                                      child: MainWeather(),
                                    ),
                                  ),
                                  Container(
                                    height: constraints.maxHeight, // will get by column
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    child:  FadeIn(
                                      curve: Curves.easeIn,
                                      duration: Duration(milliseconds: 250),
                                      child: SevenDayForecast(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),


    );
  }
}
