import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../generated/locale_keys.g.dart';

class FavoritesPage extends StatelessWidget {
  final ValueNotifier<List<Map<String, dynamic>>> favorites;

  const FavoritesPage({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.favorites.tr()),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: favorites,
        builder: (context, favList, _) {
          if (favList.isEmpty) {
            return Center(
              child: Text(
                LocaleKeys.empty_fav.tr(),
                style: AppTextStyles.body(context),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: favList.length,
            itemBuilder: (context, index) {
              final item = favList[index];
              final nameKey = item["nameKey"] as String?;

              return Container(
                margin: EdgeInsets.only(bottom: 12.h),
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      (item["icon"] as IconData?) ?? Icons.favorite,
                      size: 36.r,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Text(
                        nameKey != null ? nameKey.tr() : '',
                        style: AppTextStyles.body(context),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete_outline,
                          size: 22.r, color: Colors.red),
                      onPressed: () {
                        favorites.value = [...favList]..removeAt(index);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}