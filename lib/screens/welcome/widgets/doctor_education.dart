import 'package:find_doctor/screens/profile_photo_card.dart';
import 'package:find_doctor/shared/textFieldApp.dart';
import 'package:flutter/material.dart';

class DoctorEducation extends StatelessWidget {
  DoctorEducation({Key? key}) : super(key: key);
  final TextEditingController _specialization = TextEditingController();
  final TextEditingController _notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8.0,
        ),
        TeriaqTextField(
          height: 200,
          maxLines: null,
          expands: true,
          label: 'experience',
          hint: 'write about yourself and your experience',
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter your Specialization';
            }
            return null;
          },
          controller: _notes,
        ),
        const SizedBox(
          height: 8.0,
        ),
        ProfilePhotoCard(
          title: 'Upload your certification',
          title2: "uploaded sucessfully, want change?",
          showIcon: false,
        ),
      ],
    );
  }
}
