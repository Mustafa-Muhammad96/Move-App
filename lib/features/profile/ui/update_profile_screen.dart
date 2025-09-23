import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/widgets/default_elevated_button.dart';
import 'package:movie_app/core/widgets/default_text_form_field.dart';
import 'package:movie_app/features/reset-password/logic/reset_password_cubit.dart';
import 'package:movie_app/features/reset-password/ui/reset_password_screen.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  bool isAvatarPickerOpen = false;

  String? selectedAvatar = "assets/avatar/avatar9.png";

  final TextEditingController nameController = TextEditingController(
    text: "hussein shafeek",
  );

  final TextEditingController phoneController = TextEditingController(
    text: "01200000000",
  );

  List<String> avatars = [
    "assets/avatar/avatar2.png",
    "assets/avatar/avatar3.png",
    "assets/avatar/avatar4.png",
    "assets/avatar/avatar5.png",
    "assets/avatar/avatar6.png",
    "assets/avatar/avatar7.png",
    "assets/avatar/avatar8.png",
    "assets/avatar/avatar9.png",
    "assets/avatar/avatar10.png",
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    TextTheme text = Theme.of(context).textTheme;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          loc.pickAvatar,
          style: text.titleMedium!.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.normal,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isAvatarPickerOpen
          ? SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Avatar الحالي
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAvatarPickerOpen = !isAvatarPickerOpen;
                      });
                    },
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: selectedAvatar != null
                          ? AssetImage(selectedAvatar!)
                          : null,
                      child: selectedAvatar == null
                          ? const Icon(
                              Icons.person,
                              size: 60,
                              color: AppColors.gray,
                            )
                          : null,
                    ),
                  ),

                  SizedBox(height: height * 0.04),

                  /// Name
                  DefaultTextFormField(
                    hintText: loc.userName,
                    controller: nameController,
                    iconName: 'profile',
                  ),

                  SizedBox(height: height * 0.02),

                  /// Phone
                  DefaultTextFormField(
                    hintText: loc.phone,
                    controller: phoneController,
                    iconName: 'phone',
                  ),

                  SizedBox(height: height * 0.012),

                  /// Reset Password
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white, // النص أبيض
                        overlayColor:
                            Colors.white24, // ✅ لون الضغط (خفيف أبيض شفاف)
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider(
                              create: (context) => ResetPasswordCubit(),
                              child: const ResetPasswordScreen(),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        loc.resetPassword,
                        style: text.labelLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white, // 💡 يخليه شبه "لينك"
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  /// Avatar List
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF282A28),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: avatars.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemBuilder: (context, index) {
                        final isSelected = selectedAvatar == avatars[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAvatar = avatars[index];
                              isAvatarPickerOpen = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.primary),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(avatars[index]),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  /// Delete Account
                  DefaultElevatedButton(
                    label: loc.deleteAccount,
                    backgroundColor: AppColors.red,
                    onPressed: () {},
                  ),

                  SizedBox(height: height * 0.0215),

                  /// Update Data
                  DefaultElevatedButton(
                    label: loc.updateData,
                    backgroundColor: AppColors.primary,
                    onPressed: () {},
                  ),

                  SizedBox(height: height * 0.037),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 30,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAvatarPickerOpen = !isAvatarPickerOpen;
                        });
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: selectedAvatar != null
                            ? AssetImage(selectedAvatar!)
                            : null,
                        child: selectedAvatar == null
                            ? const Icon(
                                Icons.person,
                                size: 60,
                                color: AppColors.gray,
                              )
                            : null,
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    DefaultTextFormField(
                      hintText: loc.userName,
                      controller: nameController,
                      iconName: 'profile',
                    ),
                    SizedBox(height: height * 0.02156),
                    DefaultTextFormField(
                      hintText: loc.phone,
                      controller: phoneController,
                      iconName: 'phone',
                    ),
                    SizedBox(height: height * 0.03),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white, // النص أبيض
                          overlayColor:
                              Colors.white24, // ✅ لون الضغط (خفيف أبيض شفاف)
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                create: (context) => ResetPasswordCubit(),
                                child: const ResetPasswordScreen(),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          loc.resetPassword,
                          style: text.labelLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                Colors.white, // 💡 يخليه شبه "لينك"
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: !isAvatarPickerOpen
          ? Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultElevatedButton(
                    label: loc.deleteAccount,
                    backgroundColor: AppColors.red,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 12),
                  DefaultElevatedButton(
                    label: loc.updateData,
                    backgroundColor: AppColors.primary,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
