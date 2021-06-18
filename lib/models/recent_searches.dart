import 'package:flutter/foundation.dart';

class RecentSearch {
  final id,
      from,
      to,
      bus_company,
      date_searched,
      company_image;

  RecentSearch({
    @required this.id,
    @required this.from,
    @required this.to,
    @required this.bus_company,
    @required this.date_searched,
    @required this.company_image,
  });

  static RecentSearch fromJson(dynamic json) {
    return RecentSearch(
      id: json['id'],
      from: json['from'],
      to: json['to'],
      bus_company: json['bus_company'],
      date_searched: json['date_searched'],
      company_image: json['company_image'],
    );
  }
}

 List<RecentSearch> recentSearchLists =[
  RecentSearch(id: 1, from: "Nairobi", to: "Mombasa", bus_company: "Kenya Mpya", date_searched: "24th June 2020", company_image: "https://nairobinews.nation.co.ke/wp-content/uploads/2019/04/Kenya-Mpya-Finale.jpg"),
 ];
