import 'package:flutter/material.dart';

import 'package:movie_app/core/theme/app_colors.dart';

import 'package:movie_app/core/utils/default_elevated_button.dart';

import 'package:movie_app/core/utils/default_text_form_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  bool isAvatarPickerOpen = false;

  String? selectedAvatar = "assets/avatar/avatar9.png";

  final TextEditingController nameController =
      TextEditingController(text: "hussein shafeek");

  final TextEditingController phoneController =
      TextEditingController(text: "01200000000");

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
    TextTheme text = Theme.of(context).textTheme;

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        title: Text(
          "Pick Avatar",
          style: text.titleMedium!.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.normal,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isAvatarPickerOpen
          ? SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
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
                          ? const Icon(Icons.person,
                              size: 60, color: AppColors.gray)
                          : null,
                    ),
                  ),

                  SizedBox(height: height * 0.04),

                  /// Name

                  DefaultTextFormField(
                    hintText: "User Name",
                    controller: nameController,
                    iconName: 'profile',
                  ),

                  SizedBox(height: height * 0.02),

                  /// Phone

                  DefaultTextFormField(
                    hintText: "Phone",
                    controller: phoneController,
                    iconName: 'phone',
                  ),

                  SizedBox(height: height * 0.012),

                  /// Reset Password

                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Reset Password",
                        style: text.labelLarge!
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),

                  /// Avatar List

                  SizedBox(height: height * 0.02),

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
                              border: Border.all(
                                color: AppColors.primary,
                              ),
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
                    label: "Delete Account",
                    backgroundColor: AppColors.red,
                    onPressed: () {},
                  ),

                  SizedBox(height: height * 0.0215),

                  /// Update Data

                  DefaultElevatedButton(
                    label: "Update Data",
                    backgroundColor: AppColors.primary,
                    onPressed: () {},
                  ),

                  SizedBox(height: height * 0.037),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 30),
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
                                ? const Icon(Icons.person,
                                    size: 60, color: AppColors.gray)
                                : null,
                          ),
                        ),

                        SizedBox(height: height * 0.04),

                        DefaultTextFormField(
                          hintText: "User Name",
                          controller: nameController,
                          iconName: 'profile',
                        ),

                        SizedBox(height: height * 0.02156),

                        /// Phone

                        DefaultTextFormField(
                          hintText: "Phone",
                          controller: phoneController,
                          iconName: 'phone',
                        ),

                        SizedBox(height: height * 0.03),

                        /// Reset Password

                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Reset Password",
                              style: text.labelLarge!
                                  .copyWith(fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      DefaultElevatedButton(
                        label: "Delete Account",
                        backgroundColor: AppColors.red,
                        onPressed: () {},
                      ),
                      SizedBox(height: height * 0.0215),
                      DefaultElevatedButton(
                        label: "Update Data",
                        backgroundColor: AppColors.primary,
                        onPressed: () {},
                      ),
                      SizedBox(height: height * 0.037),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
