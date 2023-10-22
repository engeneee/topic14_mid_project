class City {
  final String description;
  final String placeId;
  final String mainText;
  final String secondaryText;  
 


  City({
    required this.description,
    required this.placeId,
    required this.mainText,
    required this.secondaryText,


  });

  factory City.fromJson(Map<String, dynamic> json) {
    final structuredFormatting = json['structured_formatting'];
    return City(
      description: json['description'],
      placeId: json['place_id'],
      mainText: structuredFormatting['main_text'],
      secondaryText: structuredFormatting['secondary_text'],

      
    );
  }


 @override
  String toString() => ''' 
    Description: $description
    Place ID: $placeId
    City: $mainText
    Country: $secondaryText
    Types: $secondaryText


    ''';
}

class CityDetails {
  final String formatted_address;
 


  CityDetails({
    required this.formatted_address,


  });
  factory CityDetails.fromJson(Map<String, dynamic> json) {
  final result = json['result'];
  return CityDetails(
    formatted_address: result['formatted_address'] ?? '',
  );
}

//adr_address

 @override
  String toString() => ''' 
    Formatted address: $formatted_address
    ''';
}

