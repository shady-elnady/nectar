class ApiConstance {
  static const String _appBaseUrl = 'http://127.0.0.1:8000/api';

  static const tokenURL = "$_appBaseUrl/token/";
  static const refreshTokenURL = "$_appBaseUrl/token/refresh";
  static const verifyTokenURL = "$_appBaseUrl/token/verify/";
  static const signUpURL = "$_appBaseUrl/sign_up";
  static const logOutURL = "$_appBaseUrl/api-auth/ logout/";
  static const departmentsURL = "$_appBaseUrl/departments";
  static const categoriesURL = "$_appBaseUrl/categories";
  static const productsURL = "$_appBaseUrl/products";
  static const favoriteProductsURL = "$_appBaseUrl/favorite_products";
  static const profilesURL = "$_appBaseUrl/profiles";
  static const myCartsURL = "$_appBaseUrl/my_carts";
  static const myCartItemsURL = "$_appBaseUrl/my_cart_items";
  static const brandsURL = "$_appBaseUrl/brands";
}
