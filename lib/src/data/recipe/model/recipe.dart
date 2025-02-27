class Ingredient {
  final String name;
  final String ea;

  Ingredient({required this.name, required this.ea});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(name: json['name'], ea: json['ea']);
  }
  Map<String, dynamic> toJson() => {'name': name, 'ea': ea};
}

class Steps {
  final String text;
  final String imageUrl;

  Steps({required this.text, required this.imageUrl});
  factory Steps.fromJson(Map<String, dynamic> json) {
    return Steps(text: json['text'], imageUrl: json['imageUrl']);
  }

  Map<String, dynamic> toJson() => {'text': text, 'imageUrl': imageUrl};
}

class Recipe {
  final String id;
  final String name;
  final String description;
  final String amount;
  final String cookTime;
  final String imageUrl;
  final List<Ingredient> ingredient;
  final List<Steps> steps;

  Recipe(
      {required this.id,
      required this.name,
      required this.description,
      required this.amount,
      required this.cookTime,
      required this.imageUrl,
      required this.ingredient,
      required this.steps});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    var ingredientList = json['ingredient'] as List;
    var stepsList = json['steps'] as List;

    return Recipe(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        amount: json['amount'],
        cookTime: json['cookTime'],
        imageUrl: json['imageUrl'],
        ingredient:
            ingredientList.map((item) => Ingredient.fromJson(item)).toList(),
        steps: stepsList.map((item) => Steps.fromJson(item)).toList());
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "amount": amount,
        "cook_time": cookTime,
        "image_url": imageUrl,
        "ingredient": ingredient.map((item) => item.toJson()).toList(),
        "steps": steps.map((item) => item.toJson()).toList()
      };
}
