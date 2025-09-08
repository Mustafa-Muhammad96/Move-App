class ItemModel {
  String id;
  String name;

  ItemModel({
    required this.id,
    required this.name
  });

  static List<ItemModel> items=[
    ItemModel(id: "", name: "Action"),
    ItemModel(id: "", name: "Adventure"),
    ItemModel(id: "", name: "Animation"),
    ItemModel(id: "", name: "Horror"),
    ItemModel(id: "", name: "Romantic"),
  ];
}