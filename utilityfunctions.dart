import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:adhan/adhan.dart';


class MyLocation {
  static getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }
}

class Date {
  static Map getDate() {
    String date=DateFormat('EEEE, d MMM, yyyy').format(DateTime.now());
    List dividedDate = date.split(',');
    print(dividedDate);
    return {"day":dividedDate[0]+"," , "month" : dividedDate[1]+"," , "year" :dividedDate[2]};
  }
}
class PRAYTIME
{
  get() {
    final myCoordinates = Coordinates(
        23.9088, 89.1220); // Replace with your own location lat, lng.
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    print("---Today's Prayer Times in Your Local Timezone(${prayerTimes.fajr
        .timeZoneName})---");
    print(DateFormat.jm().format(prayerTimes.fajr));
    print(DateFormat.jm().format(prayerTimes.sunrise));
    print(DateFormat.jm().format(prayerTimes.dhuhr));
    print(DateFormat.jm().format(prayerTimes.asr));
    print(DateFormat.jm().format(prayerTimes.maghrib));
    print(DateFormat.jm().format(prayerTimes.isha));
  }

}
