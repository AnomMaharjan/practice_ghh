import 'package:get/get.dart';

import 'package:get_hay/app/modules/All_CatergoryList/bindings/all_catergory_list_binding.dart';
import 'package:get_hay/app/modules/All_CatergoryList/views/all_catergory_list_view.dart';
import 'package:get_hay/app/modules/CartPage/bindings/cart_page_binding.dart';
import 'package:get_hay/app/modules/CartPage/views/cart_page_view.dart';
import 'package:get_hay/app/modules/CategoryForm/bindings/category_form_binding.dart';
import 'package:get_hay/app/modules/CategoryForm/views/category_form_view.dart';
import 'package:get_hay/app/modules/Category_Item_List/bindings/category_item_list_binding.dart';
import 'package:get_hay/app/modules/Category_Item_List/views/category_item_list_view.dart';
import 'package:get_hay/app/modules/CreateCategory/bindings/create_category_binding.dart';
import 'package:get_hay/app/modules/CreateCategory/views/create_category_view.dart';
import 'package:get_hay/app/modules/CreateSpecies/bindings/create_species_binding.dart';
import 'package:get_hay/app/modules/CreateSpecies/views/create_species_view.dart';
import 'package:get_hay/app/modules/Drawer/bindings/drawer_binding.dart';
import 'package:get_hay/app/modules/Drawer/views/drawer_view.dart';
import 'package:get_hay/app/modules/MyProducts/bindings/my_products_binding.dart';
import 'package:get_hay/app/modules/MyProducts/views/my_products_view.dart';
import 'package:get_hay/app/modules/Popular_CategoryList/bindings/popular_category_list_binding.dart';
import 'package:get_hay/app/modules/Popular_CategoryList/views/popular_category_list_view.dart';
import 'package:get_hay/app/modules/Species/bindings/species_binding.dart';
import 'package:get_hay/app/modules/Species/views/species_view.dart';
import 'package:get_hay/app/modules/SpeciesForm/bindings/species_form_binding.dart';
import 'package:get_hay/app/modules/SpeciesForm/views/species_form_view.dart';
import 'package:get_hay/app/modules/Stock_CategoryList/bindings/stock_category_list_binding.dart';
import 'package:get_hay/app/modules/Stock_CategoryList/views/stock_category_list_view.dart';
import 'package:get_hay/app/modules/Wishlist/bindings/wishlist_binding.dart';
import 'package:get_hay/app/modules/Wishlist/views/wishlist_view.dart';
import 'package:get_hay/app/modules/add_product_seller/bindings/add_product_seller_binding.dart';
import 'package:get_hay/app/modules/add_product_seller/views/add_product_seller_view.dart';
import 'package:get_hay/app/modules/categories/bindings/categories_binding.dart';
import 'package:get_hay/app/modules/categories/views/categories_view.dart';
import 'package:get_hay/app/modules/filter/bindings/filter_binding.dart';
import 'package:get_hay/app/modules/filter/views/filter_view.dart';
import 'package:get_hay/app/modules/home/bindings/home_binding.dart';
import 'package:get_hay/app/modules/home/views/home_view.dart';
import 'package:get_hay/app/modules/login/bindings/login_binding.dart';
import 'package:get_hay/app/modules/login/views/login_view.dart';
import 'package:get_hay/app/modules/map_picker/bindings/map_picker_binding.dart';
import 'package:get_hay/app/modules/map_picker/views/map_picker_view.dart';
import 'package:get_hay/app/modules/my_productions_cut/bindings/my_productions_cut_binding.dart';
import 'package:get_hay/app/modules/my_productions_cut/views/my_productions_cut_view.dart';
import 'package:get_hay/app/modules/orderPage/bindings/order_page_binding.dart';
import 'package:get_hay/app/modules/orderPage/views/order_page_view.dart';
import 'package:get_hay/app/modules/product_details/bindings/product_details_binding.dart';
import 'package:get_hay/app/modules/product_details/views/product_details_view.dart';
import 'package:get_hay/app/modules/profile/bindings/profile_binding.dart';
import 'package:get_hay/app/modules/profile/views/profile_view.dart';
import 'package:get_hay/app/modules/profile_edit/bindings/profile_edit_binding.dart';
import 'package:get_hay/app/modules/profile_edit/views/profile_edit_view.dart';
import 'package:get_hay/app/modules/received_order/bindings/received_order_binding.dart';
import 'package:get_hay/app/modules/received_order/views/received_order_view.dart';
import 'package:get_hay/app/modules/search_page/bindings/search_page_binding.dart';
import 'package:get_hay/app/modules/search_page/views/search_page_view.dart';
import 'package:get_hay/app/modules/sellerDrawer/bindings/seller_drawer_binding.dart';
import 'package:get_hay/app/modules/sellerDrawer/views/seller_drawer_view.dart';
import 'package:get_hay/app/modules/seller_dashboard/bindings/seller_dashboard_binding.dart';
import 'package:get_hay/app/modules/seller_dashboard/views/seller_dashboard_view.dart';
import 'package:get_hay/app/modules/seller_home/bindings/seller_home_binding.dart';
import 'package:get_hay/app/modules/seller_home/views/seller_home_view.dart';
import 'package:get_hay/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:get_hay/app/modules/sign_up/views/sign_up_view.dart';
import 'package:get_hay/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:get_hay/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:get_hay/app/modules/stripe_payment/bindings/stripe_payment_binding.dart';
import 'package:get_hay/app/modules/stripe_payment/views/stripe_payment_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DRAWER,
      page: () => DrawerView(),
      binding: DrawerBinding(),
    ),
    GetPage(
      name: _Paths.FILTER,
      page: () => FilterView(),
      binding: FilterBinding(),
    ),
    GetPage(
      name: _Paths.DRAWER,
      page: () => DrawerView(),
      binding: DrawerBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY_ITEM_LIST,
      page: () => CategoryItemListView(),
      binding: CategoryItemListBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.DRAWER,
      page: () => DrawerView(),
      binding: DrawerBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY_ITEM_LIST,
      page: () => CategoryItemListView(),
      binding: CategoryItemListBinding(),
    ),
    GetPage(
      name: _Paths.ALL_CATERGORY_LIST,
      page: () => AllCatergoryListView(),
      binding: AllCatergoryListBinding(),
    ),
    GetPage(
      name: _Paths.SELLER_DASHBOARD,
      page: () => SellerDashboardView(),
      binding: SellerDashboardBinding(),
    ),
    GetPage(
      name: _Paths.SELLER_HOME,
      page: () => SellerHomeView(),
      binding: SellerHomeBinding(),
    ),
    GetPage(
      name: _Paths.POPULAR_CATEGORY_LIST,
      page: () => PopularCategoryListView(),
      binding: PopularCategoryListBinding(),
    ),
    GetPage(
      name: _Paths.STOCK_CATEGORY_LIST,
      page: () => StockCategoryListView(),
      binding: StockCategoryListBinding(),
    ),
    GetPage(
      name: _Paths.CART_PAGE,
      page: () => CartPageView(),
      binding: CartPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_EDIT,
      page: () => ProfileEditView(),
      binding: ProfileEditBinding(),
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => WishlistView(),
      binding: WishlistBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT_SELLER,
      page: () => AddProductSellerView(),
      binding: AddProductSellerBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_PAGE,
      page: () => OrderPageView(),
      binding: OrderPageBinding(),
    ),
    GetPage(
      name: _Paths.MY_PRODUCTS,
      page: () => MyProductsView(),
      binding: MyProductsBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.RECEIVED_ORDER,
      page: () => ReceivedOrderView(),
      binding: ReceivedOrderBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_CATEGORY,
      page: () => CreateCategoryView(),
      binding: CreateCategoryBinding(),
    ),
    GetPage(
      name: _Paths.SELLER_DRAWER,
      page: () => SellerDrawerView(),
      binding: SellerDrawerBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY_FORM,
      page: () => CategoryFormView(),
      binding: CategoryFormBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_SPECIES,
      page: () => CreateSpeciesView(),
      binding: CreateSpeciesBinding(),
    ),
    GetPage(
      name: _Paths.SPECIES_FORM,
      page: () => SpeciesFormView(),
      binding: SpeciesFormBinding(),
    ),
    GetPage(
      name: _Paths.SPECIES,
      page: () => SpeciesView(),
      binding: SpeciesBinding(),
    ),
    GetPage(
      name: _Paths.MY_PRODUCTIONS_CUT,
      page: () => MyProductionsCutView(),
      binding: MyProductionsCutBinding(),
    ),
    GetPage(
      name: _Paths.STRIPE_PAYMENT,
      page: () => StripePaymentView(),
      binding: StripePaymentBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PAGE,
      page: () => SearchPageView(),
      binding: SearchPageBinding(),
    ),
    GetPage(
      name: _Paths.MAP_PICKER,
      page: () => MapPickerView(),
      binding: MapPickerBinding(),
    ),
  ];
}
