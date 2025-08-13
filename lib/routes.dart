import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_app/views/splash/splash.dart';
import 'package:go_router/go_router.dart';

import 'core/utils/route_logger.dart';



GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  observers: [RouteLogger()],
  navigatorKey: navigatorKey,
  routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => globalStore.checkIntroSeen
    //       ? globalStore.loginSkipped
    //           ? const HomePage()
    //           : globalStore.isLoggedIn
    //               ? const HomePage()
    //               : const LoginScreen()
    //       : const IntroScreen(),
    // ),
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    // GoRoute(
    //   path: '/intro',
    //   name: 'intro',
    //   builder: (context, state) => const IntroScreen(),
    // ),
    // GoRoute(
    //   path: '/login',
    //   name: 'login',
    //   builder: (context, state) => const LoginScreen(),
    //   routes: [
    //     GoRoute(
    //       path: 'otp',
    //       name: 'otp',
    //       builder: (context, state) =>
    //           OTPScreen(mobNumber: state.uri.queryParameters['mob']!),
    //       routes: [
    //         GoRoute(
    //           path: 'registration',
    //           name: 'registration',
    //           builder: (context, state) => RegistrationScreen(
    //               mobNumber: state.uri.queryParameters['mob']!),
    //           routes: [
    //             GoRoute(
    //               path: 'reg_photo',
    //               name: 'reg_photo',
    //               builder: (context, state) {
    //                 final registrationStore = (state.extra
    //                     as Map<String, dynamic>)['store'] as RegistrationStore;
    //                 return RegistrationPhoto(store: registrationStore);
    //               },
    //               routes: [
    //                 GoRoute(
    //                   path: 'reg_referral',
    //                   name: 'reg_referral',
    //                   builder: (context, state) {
    //                     final registrationStore =
    //                         (state.extra as Map<String, dynamic>)['store']
    //                             as RegistrationStore;
    //                     return RegistrationReferral(store: registrationStore);
    //                   },
    //                 ),
    //                 GoRoute(
    //                   path: 'location_map',
    //                   name: 'location_map',
    //                   builder: (context, state) {
    //                     return LocationAccessScreen();
    //                   },
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
    // GoRoute(
    //   path: '/home',
    //   name: 'home',
    //   builder: (context, state) {
    //     final serviceId =
    //         int.tryParse(state.uri.queryParameters['serviceId'] ?? '');
    //     return HomePage(serviceId: serviceId);
    //   },
    //   routes: [
    //     GoRoute(
    //       path: 'vhelp',
    //       name: 'vhelp',
    //       builder: (context, state) => const VHelpScreen(),
    //     ),
    //     GoRoute(
    //       path: 'profile_nav',
    //       name: 'profile_nav',
    //       builder: (context, state) {
    //         final loginUser = (state.extra as Map<String, dynamic>)['loginUser']
    //             as LogginedCustomerController;
    //         return ProfileTab(logginedCustomerController: loginUser);
    //       },
    //     ),
    //     // GoRoute(
    //     //   path: 'notification',
    //     //   name: 'notification',
    //     //   builder: (context, state) => const NotificationScreen(),
    //     // ),
    //     GoRoute(
    //       path: 'my_account',
    //       name: 'my_account',
    //       builder: (context, state) {
    //         final loginUser = (state.extra as Map<String, dynamic>)['loginUser']
    //             as LogginedCustomerController;
    //         return MyAccountScreen(
    //           logginedCustomerController: loginUser,
    //         );
    //       },
    //     ),
    //     GoRoute(
    //       path: 'web_view',
    //       name: 'web_view',
    //       builder: (context, state) => WebViewScreen(
    //         url: state.uri.queryParameters['url']!,
    //         title: state.uri.queryParameters['title']!,
    //       ),
    //     ),
    //
    //     GoRoute(
    //         path: 'main_search',
    //         name: 'main_search',
    //         builder: (context, state) {
    //           final firstSix = (state.extra as Map<String, dynamic>)['firstSix']
    //               as GetFirstSixController;
    //           final pageController = (state.extra
    //               as Map<String, dynamic>)['pageController'] as PageController;
    //           final banner = (state.extra as Map<String, dynamic>)['getBanner']
    //               as GetBannerController;
    //           return MainSearchScreen(
    //             firstSixController: firstSix,
    //             pageController: pageController,
    //             getBannerController: banner,
    //           );
    //         }),
    //     GoRoute(
    //       path: 'top_offers',
    //       name: 'top_offers',
    //       builder: (context, state) {
    //         final items = state.extra as List<Child>;
    //         return TopOffersScreen(
    //           items: items,
    //         );
    //       },
    //     ),
    //     GoRoute(
    //       path: 'popular_cuisines',
    //       name: 'popular_cuisines',
    //       builder: (context, state) {
    //         final cuisinesData =
    //             (state.extra as Map<String, dynamic>)['cuisinesData']
    //                 as HomeSettingsController;
    //         return PopularCuisineScreen(popularCuisineData: cuisinesData);
    //       },
    //     ),
    //     GoRoute(
    //         path: 'trending',
    //         name: 'trending',
    //         builder: (context, state) {
    //           final trendingData =
    //               (state.extra as Map<String, dynamic>)['trendingData']
    //                   as HomeSettingsController;
    //           return TrendingScreen(
    //             title: state.uri.queryParameters['title'] ?? '',
    //             trendingData: trendingData,
    //           );
    //         }),
    //     GoRoute(
    //         path: 'trending_service',
    //         name: 'trending_service',
    //         builder: (context, state) {
    //           final trendingData =
    //               (state.extra as Map<String, dynamic>)['trendingData']
    //                   as HomeSettingsController;
    //           return TrendingServiceScreen(
    //             title: state.uri.queryParameters['title'] ?? '',
    //             trendingData: trendingData,
    //           );
    //         }),
    //     GoRoute(
    //         path: 'best_offer',
    //         name: 'best_offer',
    //         builder: (context, state) {
    //           final bestOfferData =
    //               (state.extra as Map<String, dynamic>)['bestOfferData']
    //                   as HomeSettingsController;
    //           return BestOfferScreen(
    //             title: state.uri.queryParameters['title'] ?? '',
    //             bestOfferData: bestOfferData,
    //           );
    //         }),
    //     GoRoute(
    //       path: 'settings',
    //       name: 'settings',
    //       builder: (context, state) => const SettingsScreen(),
    //     ),
    //     GoRoute(
    //         path: 'map_screen',
    //         name: 'map_screen',
    //         builder: (context, state) {
    //           final logined =
    //               (state.extra as Map<String, dynamic>)['Login-Controller']
    //                   as LogginedCustomerController;
    //
    //           return MapScreen(
    //             logginedCustomerController: logined,
    //           );
    //         }),
    //     GoRoute(
    //       path: 'investment',
    //       name: 'investment',
    //       builder: (context, state) => const InvestmentScreen(),
    //       routes: [
    //         GoRoute(
    //             path: 'invest_detailed',
    //             name: 'invest_detailed',
    //             builder: (context, state) {
    //               final investmentModel =
    //                   (state.extra as Map<String, dynamic>)['investmentModel']
    //                       as InvestmentModel;
    //
    //               return InvestmentDetailScreen(
    //                 investmentModel: investmentModel,
    //               );
    //             }),
    //       ],
    //     ),
    //     GoRoute(
    //       path: 'refer',
    //       name: 'refer',
    //       builder: (context, state) => ReferEarnScreen(
    //         referalCode: state.uri.queryParameters['referal'],
    //       ),
    //     ),
    //     GoRoute(
    //       path: 'faq_screen',
    //       name: 'faq_screen',
    //       builder: (context, state) {
    //         // VoidCallback onTap = state.extra as VoidCallback;
    //         return const FaqScreen();
    //       },
    //     ),
    //     GoRoute(
    //       path: 'wallet',
    //       name: 'wallet',
    //       builder: (context, state) => const WalletScreen(),
    //       routes: [
    //         GoRoute(
    //           path: 'transactions',
    //           name: 'transactions',
    //           builder: (context, state) => const TransactionHistoryScreen(),
    //         ),
    //       ],
    //     ),
    //     GoRoute(
    //       path: 'food_history',
    //       name: 'food_history',
    //       builder: (context, state) => const FoodHistoryScreen(),
    //     ),
    //     GoRoute(
    //       path: 'supermarket_history',
    //       name: 'supermarket_history',
    //       builder: (context, state) => const SupermarketHistoryScreen(),
    //     ),
    //     GoRoute(
    //       path: 'rental_history',
    //       name: 'rental_history',
    //       builder: (context, state) => const RentalHistoryScreen(),
    //     ),
    //     GoRoute(
    //       path: 'event_history',
    //       name: 'event_history',
    //       builder: (context, state) => const EventHistoryScreen(),
    //     ),
    //     GoRoute(
    //         path: 'home_service_history',
    //         name: 'home_service_history',
    //         builder: (context, state) {
    //           return HomeServiceHistoryScreen(
    //               serviceId: int.parse(state.uri.queryParameters['serviceId']!),
    //               orderId: int.parse(state.uri.queryParameters['orderId']!));
    //         }),
    //     GoRoute(
    //       path: 'maid_history',
    //       name: 'maid_history',
    //       builder: (context, state) => const MaidHistoryScreen(),
    //     ),
    //     GoRoute(
    //         path: 'coupons',
    //         name: 'coupons',
    //         builder: (context, state) {
    //           bool isAddressMaid =
    //               state.uri.queryParameters['maidaddress'] == 'true';
    //           return CouponsScreen(
    //             isMaid: isAddressMaid,
    //               id: int.parse(state.uri.queryParameters['id']!),
    //               code: state.uri.queryParameters['cCode']);
    //         }),
    //     GoRoute(
    //         path: 'discount_pop',
    //         name: 'discount_pop',
    //         builder: (context, state) {
    //           // final couponget = (state.extra as Map<String, dynamic>)['couponGet'] as GetCouponController;
    //           return DiscountPopup();
    //         }),
    //     GoRoute(
    //       path: 'review_success',
    //       name: 'review_success',
    //       builder: (context, state) {
    //         // VoidCallback onTap = state.extra as VoidCallback;
    //         return ReviewSuccessScreen();
    //       },
    //     ),
    //     GoRoute(
    //       path: 'restaurant_flow',
    //       name: 'restaurant_flow',
    //       builder: (context, state) => const RestaurantFlow(),
    //       routes: [
    //         GoRoute(
    //           path: 'selected_type',
    //           name: 'selected_type',
    //           builder: (context, state) {
    //             final store = (state.extra as Map<String, dynamic>)['store']
    //                 as RHomepageStore;
    //             return SelectedType(
    //               homeStore: store,
    //             );
    //           },
    //         ),
    //         GoRoute(
    //           path: 'r_search',
    //           name: 'r_search',
    //           builder: (context, state) => const RestaurantSearchScreen(),
    //         ),
    //         GoRoute(
    //             path: 'r_view_all',
    //             name: 'r_view_all',
    //             builder: (context, state) {
    //               final newAddedList =
    //                   (state.extra as Map<String, dynamic>)['newadded']
    //                       as HomeSettingsController;
    //
    //               return HomeViewAll(
    //                 NewlyAddeded: newAddedList,
    //                 title: state.uri.queryParameters['title'] ?? '',
    //               );
    //             }),
    //         GoRoute(
    //           path: 'r_detailed',
    //           name: 'r_detailed',
    //           builder: (context, state) => RestaurantDetailedScreen(
    //               storeId: int.parse(state.uri.queryParameters['r_id']!)),
    //           routes: [
    //             GoRoute(
    //               path: 'search_store',
    //               name: 'search_store',
    //               builder: (context, state) => SearchStore(
    //                 name: state.uri.queryParameters['name'] ?? '',
    //                 searchText: state.uri.queryParameters['search_text'] ?? '',
    //               ),
    //             ),
    //             GoRoute(
    //               path: 'r_billing_screen',
    //               name: 'r_billing_screen',
    //               builder: (context, state) {
    //                 return const RBillingScreen();
    //               },
    //               routes: [
    //                 GoRoute(
    //                   path: 'r_payment_screen',
    //                   name: 'r_payment_screen',
    //                   builder: (context, state) {
    //                     return const RPaymentScreen();
    //                   },
    //                   routes: [
    //                     GoRoute(
    //                       path: 'r_order_placing',
    //                       name: 'r_order_placing',
    //                       builder: (context, state) {
    //                         return const ROrderPlacingScreen();
    //                       },
    //                       routes: [
    //                         GoRoute(
    //                           path: 'r_order_placed',
    //                           name: 'r_order_placed',
    //                           builder: (context, state) {
    //                             return const ROrderPlacedScreen();
    //                           },
    //                           routes: [
    //                             GoRoute(
    //                               path: 'r_track_order',
    //                               name: 'r_track_order',
    //                               builder: (context, state) {
    //                                 return const RTrackOrderScreen();
    //                               },
    //                               routes: [
    //                                 GoRoute(
    //                                   path: 'r_post_order_review',
    //                                   name: 'r_post_order_review',
    //                                   builder: (context, state) {
    //                                     return const RPostReviewScreen();
    //                                   },
    //                                 ),
    //                               ],
    //                             ),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //         GoRoute(
    //           path: 'address_list',
    //           name: 'address_list',
    //           builder: (context, state) {
    //             bool isAddressMaid =
    //                 state.uri.queryParameters['maidaddress'] == 'true';
    //             return AddressListScreen(
    //               isAddressMaid: isAddressMaid,
    //             );
    //           },
    //         ),
    //         GoRoute(
    //           path: 'edit_address',
    //           name: 'edit_address',
    //           builder: (context, state) {
    //             final addressModel = state.extra as GetAddressModel;
    //             bool isAddressMaid =
    //                 state.uri.queryParameters['maidaddress'] == 'true';
    //             return EditAddressScreen(
    //               isAddressMaid: isAddressMaid,
    //               addressModel: addressModel,
    //             );
    //           },
    //         ),
    //         GoRoute(
    //           path: 'reschedule_screen',
    //           name: 'reschedule_screen',
    //           builder: (context, state) {
    //             return RescheduleScreen(
    //                 orderId: state.uri.queryParameters['IdOrder'] ?? '',
    //                 slug: state.uri.queryParameters['slug'] ?? '');
    //           },
    //         ),
    //         GoRoute(
    //           path: 'add_address',
    //           name: 'add_address',
    //           builder: (context, state) {
    //             bool isAddressMaid =
    //                 state.uri.queryParameters['maidaddress'] == 'true';
    //             return AddAddressScreen(isAddressMaid: isAddressMaid);
    //           },
    //         ),
    //       ],
    //     ),
    //     GoRoute(
    //       path: 'supermarket_flow',
    //       name: 'supermarket_flow',
    //       builder: (context, state) => const SupermarketFlow(),
    //       routes: [
    //         GoRoute(
    //           path: 'category_search',
    //           name: 'category_search',
    //           builder: (context, state) => CategorySearch(
    //             name: state.uri.queryParameters['name'] ?? '',
    //           ),
    //         ),
    //         GoRoute(
    //           path: 's_search',
    //           name: 's_search',
    //           builder: (context, state) => const SupermarketSearchScreen(),
    //         ),
    //         GoRoute(
    //           path: 'supermarket_view_all',
    //           name: 'supermarket_view_all',
    //           builder: (context, state) => SupermarketViewAll(
    //               title: state.uri.queryParameters['title'] ?? ''),
    //         ),
    //         GoRoute(
    //           path: 'supermarket_product_view_all',
    //           name: 'supermarket_product_view_all',
    //           builder: (context, state) => SupermarketProductsViewAll(
    //               title: state.uri.queryParameters['title'] ?? ''),
    //         ),
    //         GoRoute(
    //           path: 's_detailed',
    //           name: 's_detailed',
    //           builder: (context, state) => SupermarketDetailedScreen(
    //             storeId: int.parse(state.uri.queryParameters['s_id']!),
    //           ),
    //           routes: [
    //             GoRoute(
    //               path: 's_all_categories',
    //               name: 's_all_categories',
    //               builder: (context, state) => const AllCategoriesScreen(),
    //             ),
    //             GoRoute(
    //               path: 's_sub_category',
    //               name: 's_sub_category',
    //               builder: (context, state) => SubCategoryScreen(
    //                   id: int.parse(state.uri.queryParameters['id']!)),
    //             ),
    //           ],
    //         ),
    //         GoRoute(
    //           path: 'product_details',
    //           name: 'product_details',
    //           builder: (context, state) => ProductDetailsScreen(
    //             productId: int.parse(state.uri.queryParameters['id']!),
    //             storeId: int.parse(state.uri.queryParameters['s_id']!),
    //           ),
    //           routes: [
    //             GoRoute(
    //               path: 's_billing_screen',
    //               name: 's_billing_screen',
    //               builder: (context, state) {
    //                 return const SBillingScreen();
    //               },
    //               routes: [
    //                 GoRoute(
    //                   path: 's_date_slot',
    //                   name: 's_date_slot',
    //                   builder: (context, state) {
    //                     return const SDateAndSlot();
    //                   },
    //                 ),
    //                 GoRoute(
    //                   path: 's_payment_screen',
    //                   name: 's_payment_screen',
    //                   builder: (context, state) {
    //                     return const SPaymentScreen();
    //                   },
    //                   routes: [
    //                     GoRoute(
    //                       path: 's_order_placing',
    //                       name: 's_order_placing',
    //                       builder: (context, state) {
    //                         return const SOrderPlacingScreen();
    //                       },
    //                       routes: [
    //                         GoRoute(
    //                           path: 's_order_placed',
    //                           name: 's_order_placed',
    //                           builder: (context, state) {
    //                             return const SOrderPlacedScreen();
    //                           },
    //                           routes: [
    //                             GoRoute(
    //                               path: 's_track_order',
    //                               name: 's_track_order',
    //                               builder: (context, state) {
    //                                 return const STrackOrderScreen();
    //                               },
    //                               routes: [
    //                                 GoRoute(
    //                                   path: 's_post_order_review',
    //                                   name: 's_post_order_review',
    //                                   builder: (context, state) {
    //                                     return const SPostReviewScreen();
    //                                   },
    //                                 ),
    //                               ],
    //                             ),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     GoRoute(
    //       path: 'home_service_flow',
    //       name: 'home_service_flow',
    //       builder: (context, state) {
    //         // final pageController = (state.extra as Map<String, dynamic>)['pageController'] as PageController;
    //         final banner = (state.extra as Map<String, dynamic>)['getBanner']
    //             as GetBannerController;
    //         return HomeServiceHomepage(
    //           title: (state.extra as Map<String, dynamic>?)?['title'],
    //           getBannerController: banner,
    //           slug: (state.extra as Map<String, dynamic>?)?['slug'],
    //           catid: (state.extra as Map<String, dynamic>?)?['id'],
    //         );
    //       },
    //       routes: [
    //         GoRoute(
    //           path: 'web_view_billing',
    //           name: 'web_view_billing',
    //           builder: (context, state) {
    //             // Use null-aware operators to provide default values if parameters are null
    //             bool cod =
    //                 (state.uri.queryParameters['pay_now_cod'] ?? 'false') ==
    //                     'true';
    //             // Safe check for nullable parameters
    //             String paymentUrl =
    //                 state.uri.queryParameters['paymenturl'] ?? '';
    //             String? orderIdStr = state.uri.queryParameters['orderId'];
    //             String? serviceIdStr = state.uri.queryParameters['serviceId'];
    //             String? orderNumber = state.uri.queryParameters['orderNo'];
    //             int orderId =
    //                 orderIdStr != null ? int.tryParse(orderIdStr) ?? 0 : 0;
    //             int serviceId =
    //                 serviceIdStr != null ? int.tryParse(serviceIdStr) ?? 0 : 0;
    //             bool isMaid = state
    //                 .uri.queryParameters['isMaid']
    //                 ?.toLowerCase() ==
    //                 'true';
    //             return WebViewBilling(
    //               orderNo: orderNumber,
    //               isMaid: isMaid,
    //               url: paymentUrl,
    //               payNow: cod,
    //               orderId: orderId,
    //               serviceId: serviceId,
    //             );
    //           },
    //         ),
    //         GoRoute(
    //             path: 'h_search',
    //             name: 'h_search',
    //             builder: (context, state) {
    //               // final int serviceId = (state.extra as Map<String, dynamic>)['service_id'];
    //
    //               return HomeserviceSearch();
    //             }),
    //         GoRoute(
    //             path: 'h_new_search',
    //             name: 'h_new_search',
    //             builder: (context, state) {
    //               final int serviceId =
    //                   (state.extra as Map<String, dynamic>)['service_id'];
    //               final banners =
    //                   (state.extra as Map<String, dynamic>)['banners']
    //                       as GetBannerController;
    //
    //               return Hsearch(
    //                 serviceId: serviceId,
    //                 getBannerController: banners,
    //               );
    //             }),
    //         GoRoute(
    //             path: 'h_view_all',
    //             name: 'h_view_all',
    //             builder: (context, state) {
    //               final newAddedList =
    //                   (state.extra as Map<String, dynamic>)['newadded']
    //                       as HomeSettingsController;
    //
    //               return HomeViewAll(
    //                   NewlyAddeded: newAddedList,
    //                   title: state.uri.queryParameters['title'] ?? '');
    //             }),
    //         GoRoute(
    //             path: 'most_view_all',
    //             name: 'most_view_all',
    //             builder: (context, state) {
    //               final mostBookedServicesData = (state.extra
    //                       as Map<String, dynamic>)['mostBookedServicesData']
    //                   as HomeSettingsController;
    //               return MostBookedView(
    //                 title: state.uri.queryParameters['title'] ?? '',
    //                 data: mostBookedServicesData,
    //               );
    //             }),
    //         GoRoute(
    //             path: 'h_service_view_all',
    //             name: 'h_service_view_all',
    //             builder: (context, state) {
    //               final newlyAddedServicesData =
    //                   (state.extra as Map<String, dynamic>)['data']
    //                       as HomeSettingsController;
    //               return HomeServiceViewAll(
    //                 title: state.uri.queryParameters['title'] ?? '',
    //                 data: newlyAddedServicesData,
    //               );
    //             }),
    //         GoRoute(
    //             path: 'h_most_booked_service_view_all',
    //             name: 'h_most_booked_service_view_all',
    //             builder: (context, state) {
    //               final mostBookedServicesData =
    //                   (state.extra as Map<String, dynamic>)['data']
    //                       as HomeSettingsController;
    //               return MostBookedServicesViewAll(
    //                 title: state.uri.queryParameters['title'] ?? '',
    //                 data: mostBookedServicesData,
    //               );
    //             }),
    //         GoRoute(
    //             path: 'h_deep_cleaning_view_all',
    //             name: 'h_deep_cleaning_view_all',
    //             builder: (context, state) {
    //               final deepCleaningData =
    //                   (state.extra as Map<String, dynamic>)['data']
    //                       as HomeSettingsController;
    //               return DeepCleaningViewAll(
    //                 title: state.uri.queryParameters['title'] ?? '',
    //                 data: deepCleaningData,
    //               );
    //             }),
    //         GoRoute(
    //             path: 'h_health_care_view_all',
    //             name: 'h_health_care_view_all',
    //             builder: (context, state) {
    //               final healthCareData =
    //                   (state.extra as Map<String, dynamic>)['data']
    //                       as HomeSettingsController;
    //               return HealthCareViewAll(
    //                 title: state.uri.queryParameters['title'] ?? '',
    //                 data: healthCareData,
    //               );
    //             }),
    //         GoRoute(
    //             path: 'h_other_services_view_all',
    //             name: 'h_other_services_view_all',
    //             builder: (context, state) {
    //               final otherServicesData =
    //                   (state.extra as Map<String, dynamic>)['data']
    //                       as HomeSettingsController;
    //               return OtherServicesViewAll(
    //                 title: state.uri.queryParameters['title'] ?? '',
    //                 data: otherServicesData,
    //               );
    //             }),
    //         GoRoute(
    //             path: 'h_pet_care_view_all',
    //             name: 'h_pet_care_view_all',
    //             builder: (context, state) {
    //               final petCareData =
    //                   (state.extra as Map<String, dynamic>)['data']
    //                       as HomeSettingsController;
    //               return PetCareViewAll(
    //                 title: state.uri.queryParameters['title'] ?? '',
    //                 data: petCareData,
    //               );
    //             }),
    //         GoRoute(
    //             path: 'h_beauty_services_view_all',
    //             name: 'h_beauty_services_view_all',
    //             builder: (context, state) {
    //               final beautyServicesData =
    //                   (state.extra as Map<String, dynamic>)['data']
    //                       as HomeSettingsController;
    //               return BeautyServicesViewAll(
    //                 title: state.uri.queryParameters['title'] ?? '',
    //                 data: beautyServicesData,
    //               );
    //             }),
    //         GoRoute(
    //           path: 'h_categories',
    //           name: 'h_categories',
    //           builder: (context, state) {
    //             return HomeServiceCategoriesScreen(
    //               slug: state.uri.queryParameters['slug']!,
    //               title: state.uri.queryParameters['title']!,
    //               imgUrl: state.uri.queryParameters['imgUrl']!,
    //               id: int.parse(state.uri.queryParameters['id']!),
    //             );
    //           },
    //           routes: [
    //             GoRoute(
    //               path: 'home_detailed',
    //               name: 'home_detailed',
    //               builder: (context, state) {
    //                 final params = (state.extra
    //                     as Map<String, dynamic>)['params'] as HomeServiceParams;
    //
    //                 return HomeserviceDetailed(
    //                   params: params,
    //                   titles: state.uri.queryParameters['titles']!,
    //                   selectedSubCategoryId:
    //                       int.parse(state.uri.queryParameters['id']!),
    //                 );
    //               },
    //               routes: [
    //                 GoRoute(
    //                   path: 'h_select_date',
    //                   name: 'h_select_date',
    //                   builder: (context, state) {
    //                     return HomeServiceDateTime(
    //                       categoryId:
    //                           (state.extra as Map<String, dynamic>?)?['catid'],
    //                     );
    //                   },
    //                   routes: [
    //                     GoRoute(
    //                       path: 'h_billing',
    //                       name: 'h_billing',
    //                       builder: (context, state) {
    //                         return HomeServiceBilling();
    //                       },
    //                       routes: [
    //                         GoRoute(
    //                           path: 'home_service_payment',
    //                           name: 'home_service_payment',
    //                           builder: (context, state) {
    //                             return HomsServicePaymentScreen();
    //                           },
    //                           routes: [
    //                             GoRoute(
    //                               path: 'home_service_order_placing',
    //                               name: 'home_service_order_placing',
    //                               builder: (context, state) {
    //                                 return HomeServiceOrderPlacing(
    //                                   order: state.uri
    //                                       .queryParameters['order-place-no']!,
    //                                   transaction: state.uri.queryParameters[
    //                                       'order-place-transaction']!,
    //                                 );
    //                               },
    //                               routes: [
    //                                 GoRoute(
    //                                   path: 'home_service_order_placed',
    //                                   name: 'home_service_order_placed',
    //                                   builder: (context, state) {
    //                                     return HomeServiceOrderPlacedScreen(
    //                                       orderId: state.uri.queryParameters[
    //                                           'order-place-no']!,
    //                                       transaction:
    //                                           state.uri.queryParameters[
    //                                               'order-place-transaction']!,
    //                                       serviceCode: state.uri
    //                                           .queryParameters['serviceCode']!,
    //                                       // transactionModel: (state.extra
    //                                       // as Map)['transactionModel']
    //                                       // as TransactionModel,
    //                                       // serviceCode: (state.extra
    //                                       // as Map)['serviceCode'] as String,
    //                                     );
    //                                   },
    //                                   routes: [
    //                                     GoRoute(
    //                                       path:
    //                                           'home_service_post_order_review',
    //                                       name:
    //                                           'home_service_post_order_review',
    //                                       builder: (context, state) {
    //                                         return HomeServicePostReviewScreen(
    //                                             orderId:
    //                                                 state.uri.queryParameters[
    //                                                         'orderId'] ??
    //                                                     '',
    //                                             slug: state.uri.queryParameters[
    //                                                     'slug'] ??
    //                                                 '');
    //                                       },
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     GoRoute(
    //       path: 'maid_flow',
    //       name: 'maid_flow',
    //       builder: (context, state) {
    //         final banner = (state.extra as Map<String, dynamic>)['getBanner']
    //             as GetBannerController;
    //         return MaidHomePage(
    //           getBannerController: banner,
    //           slug: (state.extra as Map<String, dynamic>?)?['slug'],
    //           id: (state.extra as Map<String, dynamic>?)?['id'],
    //         );
    //       },
    //       routes: [
    //         GoRoute(
    //           path: 'maid_service_order_placed',
    //           name: 'maid_service_order_placed',
    //           builder: (context, state) {
    //             return MaidOrderPlacedScreen(
    //               orderId: state.uri.queryParameters['order-place-no']!,
    //               transaction:
    //                   state.uri.queryParameters['order-place-transaction']!,
    //
    //             );
    //           },
    //         ),
    //         GoRoute(
    //           path: 'maid_service_details',
    //           name: 'maid_service_details',
    //           builder: (context, state) => MaidServiceDetails(
    //             data: (state.extra as Map<String, dynamic>?)?['data'],
    //             bannerUrl: state.uri.queryParameters['imgUrl'] ?? '',
    //             slug: state.uri.queryParameters['slug'] ?? '',
    //           ),
    //           routes: [
    //             GoRoute(
    //               path: 'maid_date_time',
    //               name: 'maid_date_time',
    //               builder: (context, state) => MaidDateTimeScreen(
    //                 slug: state.uri.queryParameters['slug'] ?? '',
    //               ),
    //               routes: [
    //                 GoRoute(
    //                     path: 'maid_order_history_detailed',
    //                     name: 'maid_order_history_detailed',
    //                     builder: (context, state) {
    //                       return MaidServiceHistoryScreen(
    //                           serviceId: int.parse(state.uri.queryParameters['serviceId']!),
    //                           orderId: state.uri.queryParameters['orderNumber']??"");
    //                     }),
    //                 GoRoute(
    //                   path: 'maid_bill_details',
    //                   name: 'maid_bill_details',
    //                   builder: (context, state) => const MaidBillDetails(),
    //                   routes: [
    //                     GoRoute(
    //                       path: 'maid_service_payment',
    //                       name: 'maid_service_payment',
    //                       builder: (context, state) {
    //                         bool isAddressMaid = state
    //                                 .uri.queryParameters['isMaid']
    //                                 ?.toLowerCase() ==
    //                             'true';
    //                         return HomsServicePaymentScreen(
    //                             isMaid: isAddressMaid);
    //                       },
    //                       routes: [
    //                         GoRoute(
    //                           path: 'maid_order_placing',
    //                           name: 'maid_order_placing',
    //                           builder: (context, state) {
    //                             return  MaidOrderPlacing(order: state.uri
    //                                 .queryParameters['order-place-no']!,transaction: state.uri.queryParameters[
    //                             'order-place-transaction']!,);
    //                           },
    //                           routes: [
    //                             // GoRoute(
    //                             //   path: 'maid_order_placed',
    //                             //   name: 'maid_order_placed',
    //                             //   builder: (context, state) {
    //                             //     return  MaidOrderPlacedScreen( orderId: state.uri.queryParameters[
    //                             //     'order-place-no']!,
    //                             //       transaction:
    //                             //       state.uri.queryParameters[
    //                             //       'order-place-transaction']!,);
    //                             //   },
    //                             // ),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     GoRoute(
    //       path: 'rental_flow',
    //       name: 'rental_flow',
    //       builder: (context, state) {
    //         return const RentalHomePage();
    //       },
    //       routes: [
    //         GoRoute(
    //           path: 'rental_brands',
    //           name: 'rental_brands',
    //           builder: (context, state) => const RentBrandViewAll(),
    //         ),
    //         GoRoute(
    //           path: 'rental_filter',
    //           name: 'rental_filter',
    //           builder: (context, state) => const RentalFilterScreen(),
    //         ),
    //         GoRoute(
    //           path: 'rental_category_detailed',
    //           name: 'rental_category_detailed',
    //           builder: (context, state) {
    //             return RentalCategoryDetailed(
    //               category: state.uri.queryParameters['category']!,
    //             );
    //           },
    //           routes: [
    //             GoRoute(
    //               path: 'rental_v_detailed',
    //               name: 'rental_v_detailed',
    //               builder: (context, state) => const VehicleDetailedScreen(),
    //               routes: [
    //                 GoRoute(
    //                   path: 'rental_date_slot',
    //                   name: 'rental_date_slot',
    //                   builder: (context, state) => const RentalDateSlot(),
    //                   routes: [
    //                     GoRoute(
    //                       path: 'rental_driver_information',
    //                       name: 'rental_driver_information',
    //                       builder: (context, state) =>
    //                           const RentalDriverInformation(),
    //                       routes: [
    //                         GoRoute(
    //                           path: 'rental_additional_driver',
    //                           name: 'rental_additional_driver',
    //                           builder: (context, state) =>
    //                               const AdditionalDriverScreen(),
    //                         ),
    //                         GoRoute(
    //                           path: 'rental_pickup',
    //                           name: 'rental_pickup',
    //                           builder: (context, state) => const RentalPickup(),
    //                         ),
    //                         GoRoute(
    //                           path: 'rental_dropoff',
    //                           name: 'rental_dropoff',
    //                           builder: (context, state) =>
    //                               const RentalDropOff(),
    //                         ),
    //                         GoRoute(
    //                           path: 'rental_insurance',
    //                           name: 'rental_insurance',
    //                           builder: (context, state) =>
    //                               const RentalInsurance(),
    //                         ),
    //                         GoRoute(
    //                           path: 'rental_payment',
    //                           name: 'rental_payment',
    //                           builder: (context, state) =>
    //                               const RentalPaymentScreen(),
    //                           routes: [
    //                             GoRoute(
    //                               path: 'rental_order_placing',
    //                               name: 'rental_order_placing',
    //                               builder: (context, state) =>
    //                                   const RentalOrderPlacingScreen(),
    //                               routes: [
    //                                 GoRoute(
    //                                   path: 'rental_order_placed',
    //                                   name: 'rental_order_placed',
    //                                   builder: (context, state) =>
    //                                       const RentalOrderPlacedScreen(),
    //                                 ),
    //                               ],
    //                             ),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     GoRoute(
    //       path: 'event_flow',
    //       name: 'event_flow',
    //       builder: (context, state) => const EventFlowScreen(),
    //       routes: [
    //         GoRoute(
    //           path: 'event_discover',
    //           name: 'event_discover',
    //           builder: (context, state) => const EventDiscoverAll(),
    //           routes: [
    //             GoRoute(
    //               path: 'event_lsting',
    //               name: 'event_lsting',
    //               builder: (context, state) => const EventListing(),
    //             ),
    //             GoRoute(
    //               path: 'attraction_listing',
    //               name: 'attraction_listing',
    //               builder: (context, state) => const AttractionListing(),
    //             ),
    //             GoRoute(
    //               path: 'event_detailed',
    //               name: 'event_detailed',
    //               builder: (context, state) => const EventDetailed(),
    //             ),
    //             GoRoute(
    //               path: 'attraction_detailed',
    //               name: 'attraction_detailed',
    //               builder: (context, state) => const AttractionDetailed(),
    //             ),
    //             GoRoute(
    //               path: 'event_ticket',
    //               name: 'event_ticket',
    //               builder: (context, state) =>
    //                   const EventTicketSelectionScreen(),
    //             ),
    //             GoRoute(
    //               path: 'attraction_ticket',
    //               name: 'attraction_ticket',
    //               builder: (context, state) =>
    //                   const AttractionTicketSelectionScreen(),
    //             ),
    //             //
    //             GoRoute(
    //               path: 'event_payment',
    //               name: 'event_payment',
    //               builder: (context, state) => const EventPaymentScreen(),
    //             ),
    //             GoRoute(
    //               path: 'event_order_placing',
    //               name: 'event_order_placing',
    //               builder: (context, state) => const EventOrderPlacingScreen(),
    //             ),
    //             GoRoute(
    //               path: 'event_order_placed',
    //               name: 'event_order_placed',
    //               builder: (context, state) => const EventOrderPlacedScreen(),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  ],
);
