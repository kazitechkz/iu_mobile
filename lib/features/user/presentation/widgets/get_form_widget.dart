import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/position/gf_toast_position.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:iu/features/user/presentation/bloc/user_info_bloc.dart';

import '../../domain/parameters/change_profile_parameters.dart';
import '../bloc/change/change_user_info_bloc.dart';

Widget getUserForm(BuildContext context, GetInfoLoaded state) {
  final _phoneController = MaskedTextController(mask: '+7 (000) 000-0000');
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  _phoneController.text = _formatPhoneNumber(state.meInfo.phone??'');
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: FormBuilder(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'name',
              initialValue: state.meInfo.name,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle_outlined),
                  labelText: 'Имя',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gapPadding: 2.0)),
            ),
            SizedBox(
              height: 10.h,
            ),
            FormBuilderTextField(
              controller: _phoneController,
              name: 'phone',
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone_android),
                  labelText: 'Номер телефона',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gapPadding: 2.0)),
            ),
            SizedBox(
              height: 10.h,
            ),
            FormBuilderDateTimePicker(
              name: 'date',
              inputType: InputType.date,
              initialValue: state.meInfo.birthDate != null
                  ? DateTime.parse(state.meInfo.birthDate!)
                  : null,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.date_range_outlined),
                  labelText: 'Дата рождения',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gapPadding: 2.0)),
              format: DateFormat('yyyy-MM-dd'),
            ),
            SizedBox(
              height: 10.h,
            ),
            FormBuilderDropdown(
              name: 'gender',
              initialValue: state.meInfo.gender?.id,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.male_outlined),
                  labelText: 'Пол',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gapPadding: 2.0)),
              items: [1, 2]
                  .map((gender) =>
                  DropdownMenuItem(
                    value: gender,
                    child: Text(
                        gender == 1 ? 'мужской' : 'женский'),
                  ))
                  .toList(),
            ),
            SizedBox(
              height: 10.h,
            ),
            FormBuilderTextField(
              readOnly: true,
              name: 'email',
              initialValue: state.meInfo.email,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: 'Почта',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gapPadding: 2.0)),
            ),
            SizedBox(
              height: 10.h,
            ),
            FormBuilderTextField(
              name: 'password',
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: 'Пароль',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gapPadding: 2.0)),
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'Поле обязательно для заполнения'),
                FormBuilderValidators.minLength(4, errorText: 'Поле password должно быть не короче 4 символов'),
              ]),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.saveAndValidate() ??
                    false) {
                  final formData = formKey.currentState!.value;
                  final parameter = ChangeProfileParameter(
                    name: formData['name'] as String,
                    password: formData['password'] as String,
                    gender: (formData['gender'] != '' && formData['gender'] != null) ? formData['gender'] as int : null,
                    birthDate: formData['date'].toString(),
                    phone: formData['phone'] as String,
                  );
                  print(parameter.birthDate);
                  context
                      .read<ChangeUserInfoBloc>()
                      .add(ChangeEvent(parameter));
                  // Handle form submission
                }
              },
              child: BlocConsumer<ChangeUserInfoBloc, ChangeUserInfoState>(
                builder: (context, state) {
                  if (state is ChangeUserInfoLoading) {
                    return const Center(child: GFLoader(type: GFLoaderType.ios));
                  }

                  return const Text('Обновить');
                },
                listener: (BuildContext context, ChangeUserInfoState state) {
                  if (state is ChangeUserInfoLoaded) {
                    if(state.result) {
                      GFToast.showToast(
                          'Успешно обновлено',
                          context,
                          toastPosition: GFToastPosition.BOTTOM,
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.black
                      );
                    }
                  }
                  if (state is ChangeUserInfoError) {
                    if (state.failureData.statusCode == 400) {
                      final errors = state.failureData.errors?.errors;
                      if (errors != null) {
                        int delay = 0;
                        errors.forEach((key, value) {
                          for (var errorMessage in value) {
                            Future.delayed(Duration(seconds: delay), () {
                              GFToast.showToast(
                                  errorMessage,
                                  context,
                                  toastPosition: GFToastPosition.BOTTOM,
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  backgroundColor: Colors.black
                              );
                            });
                            delay += 2;
                          }
                        });
                      }
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

String _formatPhoneNumber(String phoneNumber) {
  phoneNumber = phoneNumber.replaceAll(' ', '').replaceAll('(', '').replaceAll(')', '').replaceAll('-', '');
  if (phoneNumber.startsWith('+7')) {
    phoneNumber = phoneNumber.substring(2);
  }
  return '+7 (${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6, 10)}';
}