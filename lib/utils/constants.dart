// https://newsapi.org/

import '../data/model/category_model.dart';

const api_key = "8ce8a65495544de6976cc5de23fe3fca";
const base_url = "https://newsapi.org/v2/";

const path_search = "everything";
const path_topHeadlines = "top-headlines";

List<CategoryModel> categories = [
  CategoryModel(imgAsset: "assets/images/img_business.png", title: "business"),
  CategoryModel(imgAsset: "assets/images/img_entertainment.png", title: "entertainment"),
  CategoryModel(imgAsset: "assets/images/img_health.png", title: "health"),
  CategoryModel(imgAsset: "assets/images/img_science.png", title: "science"),
  CategoryModel(imgAsset: "assets/images/img_sport.png", title: "sports"),
  CategoryModel(imgAsset: "assets/images/img_technology.png", title: "technology"),
];
