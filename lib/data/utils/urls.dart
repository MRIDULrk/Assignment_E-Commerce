class Urls{


  static const String _baseUrl ='https://ecommerce-api.codesilicon.com/api';

  static const String sliderListurl ='$_baseUrl/ListProductSlider';
  static const String categoryListurl ='$_baseUrl/CategoryList';
  static String productListByRemark(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';

  static String productListByCategory(int id) =>
      '$_baseUrl/ListProductByCategory/$id';


  static String productDetailsById(int ProductId) =>
      '$_baseUrl/ProductDetailsById/$ProductId';


  static String verifyEmail(String email) =>
      '$_baseUrl/UserLogin/$email';








}