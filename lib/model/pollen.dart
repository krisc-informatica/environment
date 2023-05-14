class Pollen {
  Map<String, dynamic> count;
  Map<String, dynamic> risk;
  Map<String, dynamic> species;

  Pollen(this.count, this.risk, this.species);

  Pollen.fromJson(Map<String, dynamic> json)
      : count = json['Count'],
        risk = json['Risk'],
        species = json['Species'];

  @override
  String toString() =>
      "Pollen - Grass: ${count['grass_pollen']} ${risk['grass_pollen']}, Tree: ${count['tree_pollen']} ${risk['tree_pollen']}";
}
/*
{
    "message": "success",
    "lat": 51.1729552,
    "lng": 5.57886,
    "data": [
        {
            "Count": {
                "grass_pollen": 20,
                "tree_pollen": 118,
                "weed_pollen": 8
            },
            "Risk": {
                "grass_pollen": "Low",
                "tree_pollen": "Moderate",
                "weed_pollen": "Low"
            },
            "Species": {
                "Grass": {
                    "Grass / Poaceae": 20
                },
                "Others": 1,
                "Tree": {
                    "Alder": 0,
                    "Birch": 27,
                    "Cypress": 0,
                    "Elm": 0,
                    "Hazel": 0,
                    "Oak": 42,
                    "Pine": 37,
                    "Plane": 11,
                    "Poplar / Cottonwood": 0
                },
                "Weed": {
                    "Chenopod": 0,
                    "Mugwort": 0,
                    "Nettle": 8,
                    "Ragweed": 0
                }
            },
            "updatedAt": "2022-05-18T08:35:56.000Z"
        }
    ]
}
*/