void main() {
  var varaible = 10;
  varaible = 20;
  // varaible = "temp";

  Object variable2;
  variable2 = 10;
  variable2 = 50.5;
  variable2 = "temp";

  const pi = 3.14;
  final monthCount;
  //----------------------------------------------------------------

  // ! collections

  List<String> names = ["Ahmad", " Abd", "Noor", "Mhd"];
  print(names);
  print(names.elementAt(2));
  print(names.elementAt(3));

  print(names[1]);
  print(names.length);
  print(names.first);
  print(names.last);

  for (var name in names) {
    print(name);
  }
  print("#############################");
  for (var i = 0; i < names.length; i++) {
    if (i != 0) {
      print(names[i]);
    }
  }

  Map<String, dynamic> user = {
    "name": "Samer",
    "phone": "09365241155",
    "birthDate": "20/5/2000",
    "address": null,
  };

  print("=============================================================");
  print(user.keys.elementAt(3));
  print(user.values);
  print(user.values.elementAt(2));
  print("=============================================================");

  print(user["name"]);
  print(user[10]);
  print(user[20.5]);
  print(user[2]);

  Map<String, dynamic> player = {
    "name": "Messi",
    "birthDate": "1/1/1980",
    "score": 100,
    "T-shirtNumber": 10,
    "address": {
      "country": "US",
      "city": "NY",
      "street": "1200 Street",
      "buildingNumber": 10,
    },
    "teams": ["Bar", "NYCity"],
  };
  print(player["address"]["buildingNumber"]);
  print(player["birthDate"]);
  print(player["teams"][1]);
  print(player["teams"].elementAt(0));

  List<Map<String, dynamic>> players = [
    {
      "name": "Messi",
      "T-shirtNumber": 10,
      "address": {"country": "US", "city": "NY"},
      "teams": ["Bar", "NYCity"],
    },
    {
      "name": "CR",
      "T-shirtNumber": 7,
      "address": {"country": "SA", "city": "Alrayid"},
      "teams": ["MC", "Real Maderid", "Alnasser"],
    },
    {
      "name": "Benzim",
      "T-shirtNumber": 9,
      "address": {"country": "SA", "city": "Jeddah"},
      "teams": ["Lyon", "Real Madrid", "Elitthad"],
    },
    {
      "name": "Benzim",
      "T-shirtNumber": 9,
      "address": {"country": "SA", "city": "Jeddah"},
      "teams": ["Lyon", "Real Madrid", "Elitthad"],
    },
  ];

  var products = {
    "products": [
      {
        "id": 1,
        "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        "price": 109.95,
        "description":
            "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
        "rating": {"rate": 3.9, "count": 120},
      },
      {
        "id": 2,
        "title": "Mens Casual Premium Slim Fit T-Shirts ",
        "price": 22.3,
        "description":
            "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
        "category": "men's clothing",
        "image":
            "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png",
        "rating": {"rate": 4.1, "count": 259},
      },
    ],
  };

  Set<String> daysOfWeek = {"Sat", "Sun", " Mon", "Sat"};

  print(daysOfWeek.elementAt(1));

  if (pi > 4) {
    print("pi is not greater than 4");
  } else {
    print("pi is 3.14");
  }

  if (players.length <= 2) {
    print("user is less than or equal 2");
  } else if (players.length == 3) {
    print("user is equal 3");
  } else {
    print("unknown");
  }

  for (int i = 0; i < players.length; i++) {
    print("index = $i");
    print(players[i]["name"]);
  }

  for (var player in players) {
    print(player[0]);
  }
}
