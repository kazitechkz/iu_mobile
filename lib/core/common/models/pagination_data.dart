class PaginationData<T>{
  final int currentPage;
  final T data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<PaginationLink> links;
  final String nextPageUrl;
  final String path;
  final int perPage;
  final String prevPageUrl;
  final int to;
  final int total;

  PaginationData(
      {
        required this.currentPage,
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
        required this.total
      });
  PaginationData.fromMap(Map<String, dynamic> json):
        currentPage = json["current_page"] as int,
        data = json["data"],
        firstPageUrl = json["first_page_url"] as String,
        from = json["from"] as int,
        lastPage = json["last_pages"] as int,
        lastPageUrl = json["last_page_url"] as String,
        links = PaginationLink.fromMapList(json["links"]),
        nextPageUrl = json["next_page_url"] as String,
        path = json["path"] as String,
        perPage = json["per_page"] as int,
        prevPageUrl = json["prev_page_url"] as String,
        to = json["to"] as int,
        total = json["total"] as int;
}

class PaginationLink {
  final String url;
  final String label;
  final bool active;

  PaginationLink({required this.url, required this.label, required this.active});


  PaginationLink.fromMap(Map<String, dynamic> json)
      : url = json['url'] as String,
        label = json['label'] as String,
        active = json['active'] as bool;

  static List<PaginationLink> fromMapList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => PaginationLink.fromMap(json)).toList();
  }
  
}
