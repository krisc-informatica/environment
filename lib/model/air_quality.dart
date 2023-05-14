/*
"stations": [
  {
    "CO": 1.453,
    "NO2": 25.291,
    "OZONE": 8.032,
    "PM10": 52.24,
    "PM25": 21.943,
    "SO2": 1.898,
    "city": "Bangalore",
    "countryCode": "IN",
    "division": "Bangalore",
    "lat": 11.98625,
    "lng": 77.550478,
    "placeName": "Race course road",
    "postalCode": "560020",
    "state": "Karnataka",
    "updatedAt": "2021-05-29T13:00:00.000Z",
    "AQI": 72,
    "aqiInfo": {
        "pollutant": "PM2.5",
        "concentration": 21.943,
        "category": "Moderate"
    }
  }
 */

class AirQuality {
  final double co;
  final double no2;
  final double ozone;
  final double pm10;
  final double pm25;
  final double so2;
  final int aqi;

  AirQuality(
    this.co,
    this.no2,
    this.ozone,
    this.pm10,
    this.pm25,
    this.so2,
    this.aqi,
  );

  AirQuality.fromJson(Map<String, dynamic> json)
      : co = json['CO'],
        no2 = json['NO2'],
        ozone = json['OZONE'],
        pm10 = json['PM10'],
        pm25 = json['PM25'],
        so2 = json['SO2'],
        aqi = json['AQI'];

  @override
  String toString() =>
      'AirQuality - CO: $co, NO2: $no2, OZONE: $ozone, PM10: $pm10, PM25: $pm25, SO2: $so2, AQI: $aqi';
}
