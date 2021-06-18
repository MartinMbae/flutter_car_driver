

class AvailableBooking {
  final int id,
      available_seats,
      price,
      left_seats,
      space_seats,
      right_seats,
      seat_rows;
  final double ratings;
  final String bookedSeats, description;
  final String from, to, bus_company, bus_class, date, time, company_image;

  AvailableBooking({
    required this.id,
    required this.from,
    required this.to,
    required this.ratings,
    required this.bus_company,
    required this.price,
    required this.bus_class,
    required this.date,
    required this.time,
    required this.description,
    required this.bookedSeats,
    required this.available_seats,
    required this.company_image,
    required this.left_seats,
    required this.space_seats,
    required this.right_seats,
    required this.seat_rows,
  });

  static AvailableBooking fromJson(dynamic json) {
    return AvailableBooking(
      id: json['id'],
      from: json['from'],
      to: json['to'],
      bus_company: json['bus_company'],
      price: json['price'],
      bus_class: json['class'],
      ratings: json['ratings'],
      date: json['date'],
      time: json['time'],
      available_seats: json['available_seats'],
      company_image: json['company_image'],
      left_seats: json['left_seats'],
      space_seats: json['space_seats'],
      right_seats: json['right_seats'],
      seat_rows: json['seat_rows'],
      bookedSeats: json['bookedSeats'],
      description: json['description'],
    );
  }
}

List<AvailableBooking> availableBookingList = [
  AvailableBooking(
    id: 1,
    from: "Nairobi",
    to: "Mombasa",
    date: '2nd March',
    time: "9:00PM",
    ratings: 2.3,
    available_seats: 2,
    bus_company: "Kenya Mpya",
    price: 500,
    left_seats: 2,
    space_seats: 2,
    right_seats: 2,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    seat_rows: 12,
    bookedSeats: "1,2,5,7,32,45,9",
    bus_class: 'Normal Class',
    company_image:
        "https://nairobinews.nation.co.ke/wp-content/uploads/2019/04/Kenya-Mpya-Finale.jpg",
  ),
  AvailableBooking(
    id: 1,
    from: "Nairobi",
    to: "Mombasa",
    date: '3rd March',
    time: "9:00PM",
    ratings: 2.3,
    available_seats: 2,
    bus_company: "Kenya Mpya",
    price: 500,
    left_seats: 2,
    space_seats: 2,
    right_seats: 2,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    seat_rows: 12,
    bookedSeats: "1,2,3,4,7,6,33,44,23",
    bus_class: 'Normal Class',
    company_image:
        "https://nairobinews.nation.co.ke/wp-content/uploads/2019/04/Kenya-Mpya-Finale.jpg",
  ),
];
