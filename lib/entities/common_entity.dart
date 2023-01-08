import 'package:paribahan/entities/bus_card_entity.dart';

enum BusDetailsTabItems {
  route,
  rentChart,
  reviews;
}

double percentOf(num percent, num of) {
  return ((percent / 100) * of);
}

class BusRentInnerRowEntity {
  final BusStoppage toStation;
  final double distance;
  final double rent;

  BusRentInnerRowEntity(this.toStation, this.distance, this.rent);
}

class RenTableRowEntity {
  final BusStoppage fromStation;
  final List<BusRentInnerRowEntity> toStationList;
  RenTableRowEntity({required this.fromStation, required this.toStationList});
}
