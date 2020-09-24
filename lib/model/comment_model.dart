class CommentsModel {
  int id;
  String createdAt;
  int createdAtI;
  String type;
  String author;
  String text;
  int parentId;
  int storyId;
  List<Children> children;

  CommentsModel(
      {this.id,
      this.createdAt,
      this.createdAtI,
      this.type,
      this.author,
      this.text,
      this.parentId,
      this.storyId,
      this.children});

  CommentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    createdAtI = json['created_at_i'];
    type = json['type'];
    author = json['author'];
    text = json['text'];
    parentId = json['parent_id'];
    storyId = json['story_id'];
    if (json['children'] != null) {
      children = new List<Children>();
      json['children'].forEach((v) {
        children.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['created_at_i'] = this.createdAtI;
    data['type'] = this.type;
    data['author'] = this.author;
    data['text'] = this.text;
    data['parent_id'] = this.parentId;
    data['story_id'] = this.storyId;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Children {
  int id;
  String createdAt;
  int createdAtI;
  String type;
  String author;
  String text;
  int parentId;
  int storyId;
  List<Children> children;

  Children(
      {this.id,
      this.createdAt,
      this.createdAtI,
      this.type,
      this.author,
      this.text,
      this.parentId,
      this.storyId,
      this.children});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    createdAtI = json['created_at_i'];
    type = json['type'];
    author = json['author'];
    text = json['text'];
    parentId = json['parent_id'];
    storyId = json['story_id'];
    if (json['children'] != null) {
      children = new List<Children>();
      json['children'].forEach((v) {
        children.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['created_at_i'] = this.createdAtI;
    data['type'] = this.type;
    data['author'] = this.author;
    data['text'] = this.text;
    data['parent_id'] = this.parentId;
    data['story_id'] = this.storyId;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
