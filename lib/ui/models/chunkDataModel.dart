class BigDataModel {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  String? dateAdded;
  List<String>? tags;
  
  int? cmcRank;
  String? lastUpdated;
  Quote? quote;
  Platform? platform;

  BigDataModel(
      {this.id,
      this.name,
      this.symbol,
      this.slug,
      this.dateAdded,
      this.tags,
      this.cmcRank,
      this.lastUpdated,
      this.platform,
      this.quote});

  BigDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    dateAdded = json['date_added'];
    tags = json['tags'].cast<String>();
    cmcRank = json['cmc_rank'];
    lastUpdated = json['last_updated'];
    quote = json['quote'] != null ? new Quote.fromJson(json['quote']) : null;
    platform = json['platform'] != null
        ? new Platform.fromJson(json['platform'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['slug'] = this.slug;
    data['date_added'] = this.dateAdded;
    data['tags'] = this.tags;
    data['cmc_rank'] = this.cmcRank;
    data['last_updated'] = this.lastUpdated;
    if (this.platform != null) {
      data['platform'] = this.platform!.toJson();
    }
    if (this.quote != null) {
      data['quote'] = this.quote!.toJson();
    }
    return data;
  }
}

class Quote {
  USD? uSD;

  Quote({this.uSD});

  Quote.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? new USD.fromJson(json['USD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uSD != null) {
      data['USD'] = this.uSD!.toJson();
    }
    return data;
  }
}

class USD {
  double? price;
  double? volume24h;
  double? percentChange1h;
  double? percentChange24h;
  double? percentChange7d;
  double? percentChange30d;
  double? percentChange60d;
  double? percentChange90d;
  double? marketCap;
  double? marketCapDominance;
  double? fullyDilutedMarketCap;
  String? lastUpdated;

  USD(
      {this.price,
      this.volume24h,
      this.percentChange1h,
      this.percentChange24h,
      this.percentChange7d,
      this.percentChange30d,
      this.percentChange60d,
      this.percentChange90d,
      this.marketCap,
      this.marketCapDominance,
      this.fullyDilutedMarketCap,
      this.lastUpdated});

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
    percentChange30d = json['percent_change_30d'];
    percentChange60d = json['percent_change_60d'];
    percentChange90d = json['percent_change_90d'];
    marketCap = json['market_cap'];
    marketCapDominance = json['market_cap_dominance'];
    fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['volume_24h'] = this.volume24h;
    data['percent_change_1h'] = this.percentChange1h;
    data['percent_change_24h'] = this.percentChange24h;
    data['percent_change_7d'] = this.percentChange7d;
    data['percent_change_30d'] = this.percentChange30d;
    data['percent_change_60d'] = this.percentChange60d;
    data['percent_change_90d'] = this.percentChange90d;
    data['market_cap'] = this.marketCap;
    data['market_cap_dominance'] = this.marketCapDominance;
    data['fully_diluted_market_cap'] = this.fullyDilutedMarketCap;
    data['last_updated'] = this.lastUpdated;
    return data;
  }
}

class Platform {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  String? tokenAddress;

  Platform({this.id, this.name, this.symbol, this.slug, this.tokenAddress});

  Platform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    tokenAddress = json['token_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['slug'] = this.slug;
    data['token_address'] = this.tokenAddress;
    return data;
  }
}
