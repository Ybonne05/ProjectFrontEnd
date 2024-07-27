class AddOns{
  final int nata;
  final int coffeeJelly;
  final int pearl;
  final int cheeseCake;
  final int grassJelly;

  AddOns({
    required this.nata,
    required this.coffeeJelly,
    required this.pearl,
    required this.cheeseCake,
    required this.grassJelly,});

  factory AddOns.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
      'nata' : int nata,
      'coffeeJelly' : int coffeeJelly,
      'pearl' : int pearl,
      'cheeseCake' :  int cheeseCake,
      'grassJelly' : int grassJelly,
      } =>
          AddOns(
            nata : nata,
            coffeeJelly: coffeeJelly,
            pearl: pearl,
            cheeseCake: cheeseCake,
            grassJelly: grassJelly,
          ),
      _ => throw const FormatException('Failed to load addOns')
    };
  }
}