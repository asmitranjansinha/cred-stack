class StackItemModel {
  final OpenState? openState;
  final ClosedState? closedState;
  final String? ctaText;

  StackItemModel({this.openState, this.closedState, this.ctaText});

  factory StackItemModel.fromJson(Map<String, dynamic> json) {
    return StackItemModel(
      openState: json['open_state'] != null
          ? OpenState.fromJson(json['open_state'])
          : null,
      closedState: json['closed_state'] != null
          ? ClosedState.fromJson(json['closed_state'])
          : null,
      ctaText: json['cta_text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'open_state': openState?.toJson(),
      'closed_state': closedState?.toJson(),
      'cta_text': ctaText,
    };
  }
}

class OpenState {
  final OpenBody? body;

  OpenState({this.body});

  factory OpenState.fromJson(Map<String, dynamic> json) {
    return OpenState(
      body: json['body'] != null ? OpenBody.fromJson(json['body']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'body': body?.toJson(),
    };
  }
}

class OpenBody {
  final String? title;
  final String? subtitle;
  final CardData? card;
  final List<ItemData>? items;
  final String? footer;

  OpenBody({this.title, this.subtitle, this.card, this.items, this.footer});

  factory OpenBody.fromJson(Map<String, dynamic> json) {
    return OpenBody(
      title: json['title'],
      subtitle: json['subtitle'],
      card: json['card'] != null ? CardData.fromJson(json['card']) : null,
      items: json['items'] != null
          ? (json['items'] as List)
              .map((item) => ItemData.fromJson(item))
              .toList()
          : null,
      footer: json['footer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'card': card?.toJson(),
      'items': items?.map((item) => item.toJson()).toList(),
      'footer': footer,
    };
  }
}

class CardData {
  final String? header;
  final String? description;
  final int? maxRange;
  final int? minRange;

  CardData({this.header, this.description, this.maxRange, this.minRange});

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      header: json['header'],
      description: json['description'],
      maxRange: json['max_range'],
      minRange: json['min_range'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'header': header,
      'description': description,
      'max_range': maxRange,
      'min_range': minRange,
    };
  }
}

class ItemData {
  final String? emi;
  final String? duration;
  final String? title;
  final dynamic subtitle;
  final String? tag;
  final String? icon;

  ItemData(
      {this.emi,
      this.duration,
      this.title,
      this.subtitle,
      this.tag,
      this.icon});

  factory ItemData.fromJson(Map<String, dynamic> json) {
    return ItemData(
      emi: json['emi'],
      duration: json['duration'],
      title: json['title'],
      subtitle: json['subtitle'],
      tag: json['tag'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'emi': emi,
      'duration': duration,
      'title': title,
      'subtitle': subtitle,
      'tag': tag,
      'icon': icon,
    };
  }
}

class ClosedState {
  final Map<String, String>? body;

  ClosedState({this.body});

  factory ClosedState.fromJson(Map<String, dynamic> json) {
    return ClosedState(
      body:
          json['body'] != null ? Map<String, String>.from(json['body']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'body': body,
    };
  }
}
