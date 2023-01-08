import 'package:paribahan/entities/common_entity.dart';

enum FeedbackType { positive, neutral, negative }

class BusStoppage {
  final String name;

  BusStoppage({required this.name});
}

class BusRoute {
  final String routeNo;
  final List<BusStoppage> stoppages;
  BusRoute({required this.routeNo, required this.stoppages});
}

class BusTag {
  final FeedbackType feedbackType;
  final String name;

  BusTag({required this.feedbackType, required this.name});
}

class BusCardEntity {
  final int id;
  final String name;
  final double rating;
  final double rent;
  final BusRoute route;
  final List<BusTag> tagList;

  BusCardEntity(
      {required this.id,
      required this.name,
      required this.rating,
      required this.rent,
      required this.route,
      required this.tagList});
}

List<BusCardEntity> getRandomBusList() {
  final List<BusCardEntity> list = [];
  for (var i = 0; i <= 15; i++) {
    list.add(BusCardEntity(
        id: i,
        name: "Bolaka paribahan",
        rating: 3.5,
        rent: 25,
        route: BusRoute(routeNo: "Route A360", stoppages: [
          BusStoppage(name: "Jatrabari"),
          BusStoppage(name: "Mogh Bazar"),
          BusStoppage(name: "Nabisco"),
          BusStoppage(name: "Sena nibash"),
          BusStoppage(name: "Tongi")
        ]),
        tagList: [
          BusTag(feedbackType: FeedbackType.positive, name: "Affordable"),
          BusTag(feedbackType: FeedbackType.negative, name: "Non-AC"),
          BusTag(feedbackType: FeedbackType.negative, name: "Too much stoppage")
        ]));
  }

  return list;
}

final exampleBus = BusCardEntity(
    id: 1,
    name: "Bolaka paribahan",
    rating: 3.5,
    rent: 25,
    route: BusRoute(routeNo: "Route A360", stoppages: [
      BusStoppage(name: "Jatrabari"),
      BusStoppage(name: "Mogh Bazar"),
      BusStoppage(name: "Nabisco"),
      BusStoppage(name: "Sena nibash"),
      BusStoppage(name: "Tongi")
    ]),
    tagList: [
      BusTag(feedbackType: FeedbackType.negative, name: "DhuraUra"),
      BusTag(feedbackType: FeedbackType.positive, name: "Affordable"),
      BusTag(feedbackType: FeedbackType.negative, name: "Non-AC"),
      BusTag(feedbackType: FeedbackType.negative, name: "Too much stoppage"),
      BusTag(feedbackType: FeedbackType.negative, name: "Murir tin"),
      BusTag(feedbackType: FeedbackType.negative, name: "Uradhura"),
    ]);

List<RenTableRowEntity> getRandomRentChart() {
  final List<RenTableRowEntity> list = [];
  for (var i = 0; i <= 15; i++) {
    list.add(RenTableRowEntity(
        fromStation: BusStoppage(name: "Tongi"),
        toStationList: [
          BusRentInnerRowEntity(BusStoppage(name: "Uttara"), 3.3, 10.00),
          BusRentInnerRowEntity(BusStoppage(name: "Airport"), 5.3, 20.00),
          BusRentInnerRowEntity(BusStoppage(name: "Mohakhali"), 6.2, 30.00),
          BusRentInnerRowEntity(BusStoppage(name: "Khilgaon"), 7, 53.00),
          BusRentInnerRowEntity(BusStoppage(name: "Malibagh"), 9, 60.00),
          BusRentInnerRowEntity(BusStoppage(name: "Jatrabari"), 13.3, 75.00),
          BusRentInnerRowEntity(BusStoppage(name: "N.ganj"), 15.3, 110.00)
        ]));
  }

  return list;
}
