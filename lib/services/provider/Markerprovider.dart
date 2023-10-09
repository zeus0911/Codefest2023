import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

class MarkerProvider extends ChangeNotifier {
  LatLng _amarkerLatLng =
      const LatLng(27.7172, 85.3240); // Initial marker position

  LatLng get amarkerLatLng => _amarkerLatLng;

  void aupdateMarkerLatLng(LatLng anewLatLng) {
    _amarkerLatLng = anewLatLng;
    notifyListeners();
  }

  LatLng _bmarkerLatLng =
      const LatLng(27.7172, 85.3240); // Initial marker position

  LatLng get bmarkerLatLng => _bmarkerLatLng;

  void bupdateMarkerLatLng(LatLng bnewLatLng) {
    _bmarkerLatLng = bnewLatLng;
    notifyListeners();
  }

  LatLng _cmarkerLatLng =
      const LatLng(27.7172, 85.3240); // Initial marker position

  LatLng get cmarkerLatLng => _cmarkerLatLng;

  void cupdateMarkerLatLng(LatLng cnewLatLng) {
    _cmarkerLatLng = cnewLatLng;
    notifyListeners();
  }

  LatLng _dmarkerLatLng =
  const LatLng(27.7172, 85.3240); // Initial marker position

  LatLng get dmarkerLatLng => _dmarkerLatLng;

  void dupdateMarkerLatLng(LatLng dnewLatLng) {
    _dmarkerLatLng = dnewLatLng;
    notifyListeners();
  }

  LatLng _emarkerLatLng =
  const LatLng(27.7172, 85.3240); // Initial marker position

  LatLng get emarkerLatLng => _emarkerLatLng;

  void eupdateMarkerLatLng(LatLng enewLatLng) {
    _emarkerLatLng = enewLatLng;
    notifyListeners();
  }
}
