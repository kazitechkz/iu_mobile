class PaginationData<T> {
  final int? currentPage;
  late T data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<PaginationLink> links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  PaginationData(
      {required this.currentPage,
      required this.data,
      required this.firstPageUrl,
      required this.from,
      required this.lastPage,
      required this.lastPageUrl,
      required this.links,
      required this.nextPageUrl,
      required this.path,
      required this.perPage,
      required this.prevPageUrl,
      required this.to,
      required this.total});
  PaginationData.fromMap(Map<String, dynamic> json)
      : currentPage =
            json["current_page"] != null ? json["current_page"] as int : 0,
        data = json["data"],
        firstPageUrl = json["first_page_url"],
        from = json["from"] != null ? json["from"] as int : 0,
        lastPage = json["last_page"] != null ? json["last_page"] as int : 0,
        lastPageUrl = json["last_page_url"] as String?,
        links = json["links"] != null
            ? PaginationLink.fromMapList(
                json["links"].cast<Map<String, dynamic>>())
            : [],
        nextPageUrl = json["next_page_url"] as String?,
        path = json["path"] as String?,
        perPage = json["per_page"] != null ? json["per_page"] as int : 0,
        prevPageUrl = json["prev_page_url"] as String?,
        to = json["to"] != null ? json["to"] as int : 0,
        total = json["total"] != null ? json["total"] as int : 0;
  factory PaginationData.fromJson(Map<String, dynamic> json) {
    return PaginationData<T>.fromMap(json);
  }
  PaginationData<T> copyWith({
    required T data,
    required PaginationData other,
  }) {
    return PaginationData<T>(
      currentPage: other.currentPage ?? this.currentPage,
      data: data ?? this.data,
      firstPageUrl: other.firstPageUrl ?? this.firstPageUrl,
      from: other.from ?? this.from,
      lastPage: other.lastPage ?? this.lastPage,
      lastPageUrl: other.lastPageUrl ?? this.lastPageUrl,
      links: other.links ?? this.links,
      nextPageUrl: other.nextPageUrl ?? this.nextPageUrl,
      path: other.path ?? this.path,
      perPage: other.perPage ?? this.perPage,
      prevPageUrl: other.prevPageUrl ?? this.prevPageUrl,
      to: other.to ?? this.to,
      total: other.total ?? this.total,
    );
  }

  factory PaginationData.fromType(PaginationData paginationData, T data) {
    return PaginationData<T>(
        currentPage: paginationData.currentPage,
        data: data,
        firstPageUrl: paginationData.firstPageUrl,
        from: paginationData.from,
        lastPage: paginationData.lastPage,
        lastPageUrl: paginationData.lastPageUrl,
        links: paginationData.links,
        nextPageUrl: paginationData.nextPageUrl,
        path: paginationData.path,
        perPage: paginationData.perPage,
        prevPageUrl: paginationData.prevPageUrl,
        to: paginationData.to,
        total: paginationData.total);
  }
}

class PaginationLink {
  final String? url;
  final String? label;
  final bool? active;

  PaginationLink(
      {required this.url, required this.label, required this.active});

  PaginationLink.fromMap(Map<String, dynamic> json)
      : url = json['url'] as String?,
        label = json['label'] as String?,
        active = json['active'] as bool?;

  static List<PaginationLink> fromMapList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => PaginationLink.fromMap(json)).toList();
  }
}
