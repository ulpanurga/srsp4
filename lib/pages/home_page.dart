import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../generated/locale_keys.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home.tr()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.welcome.tr(),
              style: AppTextStyles.title(context),
            ),
            SizedBox(height: 16.h),
            Text(
              LocaleKeys.special_offers.tr(),
              style: AppTextStyles.subtitle(context),
            ),
            SizedBox(height: 12.h),

            _buildPromoCard(
              context: context,
              title: LocaleKeys.banner_1.tr(),
              icon: Icons.local_offer,
              color: Colors.deepOrangeAccent,
            ),
            SizedBox(height: 12.h),

            _buildPromoCard(
              context: context,
              title: LocaleKeys.banner_2.tr(),
              icon: Icons.checkroom,
              color: Colors.indigoAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      height: 120.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Icon(icon, size: 48.r, color: AppColors.white),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.subtitle(context)
                  .copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}