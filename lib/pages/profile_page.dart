import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../generated/locale_keys.g.dart';

class ProfilePage extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const ProfilePage({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.profile.tr()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, size: 40.r, color: AppColors.white),
            ),
            SizedBox(height: 12.h),
            Text('Нургалиева Улпан', style: AppTextStyles.title(context)),
            SizedBox(height: 24.h),

            ListTile(
              leading: Icon(Icons.language, size: 24.r),
              title: Text(LocaleKeys.language.tr(), style: AppTextStyles.body(context)),
              trailing: DropdownButton<Locale>(
                value: context.locale,
                onChanged: (Locale? newLocale) {
                  if (newLocale != null) {
                    context.setLocale(newLocale);
                  }
                },
                items: const [
                  DropdownMenuItem(value: Locale('ru'), child: Text('Русский')),
                  DropdownMenuItem(value: Locale('en'), child: Text('English')),
                ],
              ),
            ),
            Divider(height: 1.h),

            ValueListenableBuilder<ThemeMode>(
              valueListenable: themeNotifier,
              builder: (context, currentMode, child) {
                return SwitchListTile(
                  secondary: Icon(Icons.dark_mode, size: 24.r),
                  title: Text(LocaleKeys.dark_theme.tr(), style: AppTextStyles.body(context)),
                  value: currentMode == ThemeMode.dark,
                  onChanged: (bool value) {
                    themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
                  },
                );
              },
            ),
            Divider(height: 1.h),

            SizedBox(height: 20.h),
            Text(LocaleKeys.app_info.tr(), style: AppTextStyles.caption(context)),
            Text(LocaleKeys.version.tr(), style: AppTextStyles.caption(context)),
          ],
        ),
      ),
    );
  }
}