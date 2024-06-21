// To parse this JSON data, do
//
//     final homeContentsModel = homeContentsModelFromJson(jsonString);

import 'dart:convert';

HomeContentsModel homeContentsModelFromJson(String str) => HomeContentsModel.fromJson(json.decode(str));

String homeContentsModelToJson(HomeContentsModel data) => json.encode(data.toJson());

class HomeContentsModel {
    List<Package> packages;
    Blogs news;
    Blogs blogs;

    HomeContentsModel({
        required this.packages,
        required this.news,
        required this.blogs,
    });

    factory HomeContentsModel.fromJson(Map<String, dynamic> json) => HomeContentsModel(
        packages: List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),
        news: Blogs.fromJson(json["news"]),
        blogs: Blogs.fromJson(json["blogs"]),
    );

    Map<String, dynamic> toJson() => {
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
        "news": news.toJson(),
        "blogs": blogs.toJson(),
    };
}

class Blogs {
    String currentPage;
    List<Datum> data;
    String firstPageUrl;
    String from;
    String lastPage;
    String lastPageUrl;
    List<Link> links;
    String nextPageUrl;
    String path;
    String perPage;
    dynamic prevPageUrl;
    String to;
    String total;

    Blogs({
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
        required this.total,
    });

    factory Blogs.fromJson(Map<String, dynamic> json) => Blogs(
        currentPage: json["current_page"].toString(),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"].toString(),
        from: json["from"].toString(),
        lastPage: json["last_page"].toString(),
        lastPageUrl: json["last_page_url"].toString(),
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"].toString(),
        path: json["path"].toString(),
        perPage: json["per_page"].toString(),
        prevPageUrl: json["prev_page_url"].toString(),
        to: json["to"].toString(),
        total: json["total"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    String id;
    String newsId;
    String langId;
    String title;
    String slug;
    String summarytext;
    String mediaUrl;

    Datum({
        required this.id,
        required this.newsId,
        required this.langId,
        required this.title,
        required this.slug,
        required this.summarytext,
        required this.mediaUrl,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"].toString(),
        newsId: json["news_id"].toString(),
        langId: json["lang_id"].toString(),
        title: json["title"].toString(),
        slug: json["slug"].toString(),
        summarytext: json["summarytext"].toString(),
        mediaUrl: json["media_url"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "news_id": newsId,
        "lang_id": langId,
        "title": title,
        "slug": slug,
        "summarytext": summarytext,
        "media_url": mediaUrl,
    };
}

class Link {
    String? url;
    String label;
    bool active;

    Link({
        required this.url,
        required this.label,
        required this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"].toString(),
        label: json["label"].toString(),
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}

class Package {
    String packgeId;
    String title;
    String description;
    String price;
    String monthlyPrice;
    String annuallyPrice;

    Package({
        required this.packgeId,
        required this.title,
        required this.description,
        required this.price,
        required this.monthlyPrice,
        required this.annuallyPrice,
    });

    factory Package.fromJson(Map<String, dynamic> json) => Package(
        packgeId: json["packge_id"].toString(),
        title: json["title"].toString(),
        description: json["description"].toString(),
        price: json["price"].toString(),
        monthlyPrice: json["monthly_price"].toString(),
        annuallyPrice: json["annually_price"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "packge_id": packgeId,
        "title": title,
        "description": description,
        "price": price,
        "monthly_price": monthlyPrice,
        "annually_price": annuallyPrice,
    };
}
