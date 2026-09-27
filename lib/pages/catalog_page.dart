import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../generated/locale_keys.g.dart';

class CatalogPage extends StatelessWidget {
  final ValueNotifier<List<Map<String, dynamic>>> favorites;

  const CatalogPage({super.key, required this.favorites});

  // "nameKey" — ключ из LocaleKeys, используется и для отображения, и как id товара
  final List<Map<String, dynamic>> products = const [
    {"nameKey": LocaleKeys.product_headphones, "price": 15000, "icon": Icons.headphones},
    {"nameKey": LocaleKeys.product_smartwatch, "price": 32000, "icon": Icons.watch},
    {"nameKey": LocaleKeys.product_mouse, "price": 8500, "icon": Icons.mouse},
    {"nameKey": LocaleKeys.product_keyboard, "price": 24000, "icon": Icons.keyboard},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.catalog.tr()),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final item = products[index];
            final nameKey = item["nameKey"] as String;

            return ValueListenableBuilder<List<Map<String, dynamic>>>(
              valueListenable: favorites,
              builder: (context, favList, _) {
                final isFav =
                    favList.any((f) => f["nameKey"] == nameKey);

                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.cardShadow,
                        blurRadius: 6.r,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item["icon"] as IconData,
                          size: 50.r, color: AppColors.primary),
                      SizedBox(height: 12.h),
                      Text(
                        nameKey.tr(),
                        style: AppTextStyles.body(context),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        LocaleKeys.price.tr(args: [item["price"].toString()]),
                        style: AppTextStyles.caption(context)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.h),
                      IconButton(
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          size: 20.r,
                          color: AppColors.favorite,
                        ),
                        onPressed: () {
                          if (isFav) {
                            favorites.value = favList
                                .where((f) => f["nameKey"] != nameKey)
                                .toList();
                          } else {
                            favorites.value = [...favList, item];
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(LocaleKeys.add_to_fav.tr())),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}