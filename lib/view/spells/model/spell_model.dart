import '../../../core/base/model/base_model.dart';

class Spell extends BaseModel {
  String? id;
  String? name;
  String? description;

  Spell({
    this.id,
    this.name,
    this.description,
  });

  @override
  Spell fromJson(Map<String, dynamic> json) {
    return Spell(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  @override
  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
