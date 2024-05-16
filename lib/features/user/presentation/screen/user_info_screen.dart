import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/features/user/presentation/bloc/change/change_user_info_bloc.dart';
import 'package:iu/features/user/presentation/bloc/user_info_bloc.dart';

import '../../domain/parameters/change_profile_parameters.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserInfoBloc>().add(const GetInfoEvent());
  }

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () => context.goNamed(RouteConstant.profileScreenName),
        ),
        title: const Text('Редактировать'),
      ),
      body: BlocConsumer<UserInfoBloc, UserInfoState>(
        listener: (context, state) {
          if (state is GetInfoError) {
            context.read<UserInfoBloc>().add(const GetInfoEvent());
          }
        },
        builder: (context, state) {
          if (state is GetInfoLoaded) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: FormBuilder(
                key: _formKey,
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
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                gapPadding: 2.0)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      FormBuilderTextField(
                        name: 'phone',
                        initialValue: state.meInfo.phone ?? '',
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone_android),
                            labelText: 'Номер телефона',
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                gapPadding: 2.0)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      FormBuilderDateTimePicker(
                        name: 'birth_date',
                        inputType: InputType.date,
                        initialValue: state.meInfo.birthDate != null
                            ? DateTime.parse(state.meInfo.birthDate!)
                            : null,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.date_range_outlined),
                            labelText: 'Дата рождения',
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
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
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                gapPadding: 2.0)),
                        items: [1, 2]
                            .map((gender) =>
                            DropdownMenuItem(
                              value: gender.toString(),
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
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
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
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                gapPadding: 2.0)),
                        obscureText: true,
                      ),
                      SizedBox(height: 20.h),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            final formData = _formKey.currentState!.value;
                            final parameter = ChangeProfileParameter(
                              name: formData['name'] as String,
                              password: formData['password'] as String,
                              gender: (formData['gender'] != '' && formData['gender'] != null) ? formData['gender'] as int : null,
                              birth_date: formData['birth_date'].toString(),
                              phone: formData['phone'] as String,
                            );
                            context
                                .read<ChangeUserInfoBloc>()
                                .add(ChangeEvent(parameter));
                            // Handle form submission
                          } else {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Text('Validation error');
                              },
                            );
                          }
                        },
                        child: BlocConsumer<ChangeUserInfoBloc, ChangeUserInfoState>(
                          builder: (context, state) {
                            if (state is ChangeUserInfoLoading) {
                              return const Center(child: GFLoader(type: GFLoaderType.ios));
                            }
                            return Text('Обновить');
                          },
                          listener: (BuildContext context, ChangeUserInfoState state) {
                            if (state is ChangeUserInfoLoaded) {
                              print(state.result);
                              if(state.result) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                        title: Text('LALALALA'),
                                      );
                                    }
                                );
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
          return const Center(child: GFLoader(type: GFLoaderType.ios));
        },
      ),
    );
  }
}
