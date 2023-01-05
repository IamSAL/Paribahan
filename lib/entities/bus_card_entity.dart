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
