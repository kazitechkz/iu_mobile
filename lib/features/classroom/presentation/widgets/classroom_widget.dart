import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/position/gf_toast_position.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/common/blocs/subject_dropdown/subject_dropdown_bloc.dart';
import 'package:iu/core/helpers/subject_helper.dart';
import 'package:iu/core/services/injection_main.container.dart';
import 'package:iu/features/attempt/domain/use_cases/get_attempt_by_promo_code_case.dart';
import 'package:iu/features/attempt/presentation/get_attempt_by_promo/bloc/attempt_by_promo_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/common/models/subject.dart';
import '../../domain/entities/classroom_entity.dart';
import '../../domain/parameters/room_parameters.dart';
import '../bloc/classroom_bloc.dart';

class ClassroomActionButtons extends StatefulWidget {
  const ClassroomActionButtons({super.key});

  @override
  State<ClassroomActionButtons> createState() => _ClassroomActionButtonsState();
}

class _ClassroomActionButtonsState extends State<ClassroomActionButtons> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (builder) {
                    return Dialog(
                      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                      backgroundColor: Colors.grey[900],
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 100.h,
                        child: Container(
                          constraints: const BoxConstraints(maxHeight: 60.0),
                          child: BlocProvider(
                              create: (_) => AttemptByPromoBloc(useCase: sl<GetAttemptByPromoCodeCase>()),
                              child: BlocBuilder<AttemptByPromoBloc, AttemptByPromoState>(
                                  builder: (context, state) {
                                    return FormBuilder(
                                      key: formKey,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: FormBuilderTextField(
                                              style: const TextStyle(color: Colors.white),
                                              name: 'promo',
                                              initialValue: '',
                                              decoration: const InputDecoration(
                                                prefixIcon: Icon(Icons.password, color: Colors.white,),
                                                labelText: 'Введите код',
                                                labelStyle: TextStyle(color: Colors.white),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                                  gapPadding: 2.0,
                                                ),
                                              ),
                                              validator: FormBuilderValidators.required(errorText: AppLocalizations.of(context)!.required_input_error),
                                            ),
                                          ),
                                          SizedBox(width: 5.w), // Make sure to have proper context for 5.w or replace with a standard value like 5.0
                                          FloatingActionButton(
                                            onPressed: () {
                                              if (formKey.currentState?.saveAndValidate()??false) {
                                                final formData = formKey.currentState!.value;
                                                context.read<AttemptByPromoBloc>().add(GetAttemptByPromoEvent(formData['promo'] as String));
                                                if (state is AttemptByPromoFailure) {
                                                  GFToast.showToast(
                                                      state.failureData.message,
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
                                                if (state is AttemptByPromoLoaded) {
                                                  context.goNamed(RouteConstant.passAttemptById, pathParameters: {'attemptId': state.attemptEntity.id.toString()});
                                                  Navigator.pop(context);
                                                }
                                              }
                                            },
                                            child: const Icon(Icons.send),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                              ),
                          ),
                        ),
                      ),
                    );
                  }
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstant.orangeColor,
              padding: const EdgeInsets.symmetric(
                  horizontal: 25, vertical: 15),
              textStyle: const TextStyle(fontSize: 20),
            ),
            child: const Text(
              'Сдать тест',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 10.w,),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (builder) {
                    return Dialog(
                      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                      backgroundColor: Colors.grey[900],
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                          constraints: BoxConstraints(maxHeight: 260.h),
                          child: FormBuilder(
                            key: formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  FormBuilderTextField(
                                    style: const TextStyle(color: Colors.white),
                                    name: 'promo',
                                    initialValue: '',
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.white,),
                                      labelText: 'Введите код',
                                      labelStyle: TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        gapPadding: 2.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                  BlocProvider(
                                    create: (_) => SubjectDropdownBloc()..add(SubjectDropdownLoadedEvent()),
                                    child: BlocBuilder<SubjectDropdownBloc, SubjectDropdownState>(
                                        builder: (context, state) {
                                          if (state is SubjectDropdownLoaded) {
                                            List<int> items = getSubjectIds(state.subjects, context);
                                            return FormBuilderDropdown(
                                              name: 'first',
                                              initialValue: 4,
                                              style: const TextStyle(color: Colors.white),
                                              dropdownColor: Colors.grey,
                                              decoration: const InputDecoration(
                                                  prefixIcon: Icon(Icons.history_edu_sharp, color: Colors.white),
                                                  labelText: 'Выберите предмет',
                                                  labelStyle: TextStyle(color: Colors.white),
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                                      gapPadding: 2.0)),
                                              items: items
                                                  .map((gender) =>
                                                  DropdownMenuItem(
                                                    value: gender,
                                                    child: Text((SubjectHelper.getSingleSubject(gender)).getLocalizedTitle(context)),
                                                  ))
                                                  .toList(),
                                            );
                                          }
                                          return const Center(child: CircularProgressIndicator(),);
                                        }
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                  BlocProvider(
                                    create: (_) => SubjectDropdownBloc()..add(SubjectDropdownLoadedEvent()),
                                    child: BlocBuilder<SubjectDropdownBloc, SubjectDropdownState>(
                                        builder: (context, state) {
                                          if (state is SubjectDropdownLoaded) {
                                            List<int> items = getSubjectIds(state.subjects, context);
                                            return FormBuilderDropdown(
                                              name: 'second',
                                              initialValue: 5,
                                              style: const TextStyle(color: Colors.white),
                                              dropdownColor: Colors.grey,
                                              decoration: const InputDecoration(
                                                  prefixIcon: Icon(Icons.history_edu_sharp, color: Colors.white),
                                                  labelText: 'Выберите предмет',
                                                  labelStyle: TextStyle(color: Colors.white),
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                                      gapPadding: 2.0)),
                                              items: items
                                                  .map((gender) =>
                                                  DropdownMenuItem(
                                                    value: gender,
                                                    child: Text((SubjectHelper.getSingleSubject(gender)).getLocalizedTitle(context)),
                                                  ))
                                                  .toList(),
                                            );
                                          }
                                          return const Center(child: CircularProgressIndicator(),);
                                        }
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                  ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState?.saveAndValidate() ??
                                            false) {
                                          final formData = formKey.currentState!.value;
                                          final parameter = RoomParameter(
                                            promo_code: formData['promo'] as String,
                                            subject_first: formData['first'] as int,
                                            subject_second: formData['second'] as int,
                                          );
                                          context
                                              .read<ClassroomBloc>()
                                              .add(ClassroomJoinEvent(parameter));
                                          context.read<ClassroomBloc>().add(ClassroomAllEvent());
                                          Navigator.pop(context);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorConstant.orangeColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 15),
                                        textStyle: const TextStyle(fontSize: 20),
                                      ),
                                      child: const Text(
                                        'Вступить в класс',
                                        style: TextStyle(color: Colors.white),
                                      )
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstant.orangeColor,
              padding: const EdgeInsets.symmetric(
                  horizontal: 25, vertical: 15),
              textStyle: const TextStyle(fontSize: 20),
            ),
            child: const Text(
              'Вступить в класс',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}


Widget getActionButtons(BuildContext context) {

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (builder) {
                return Dialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  backgroundColor: Colors.grey[900],
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      constraints: const BoxConstraints(maxHeight: 60.0),
                      child: FormBuilder(
                        key: formKey,
                        child: Row(
                          children: [
                            Expanded(
                              child: FormBuilderTextField(
                                style: const TextStyle(color: Colors.white),
                                name: 'promo',
                                initialValue: '',
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.white,),
                                  labelText: 'Введите код',
                                  labelStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    gapPadding: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.w), // Make sure to have proper context for 5.w or replace with a standard value like 5.0
                            FloatingActionButton(
                              onPressed: () {
                                if (formKey.currentState?.saveAndValidate()??false) {
                                  final formData = formKey.currentState!.value;

                                }
                              },
                              child: const Icon(Icons.send),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstant.orangeColor,
          padding: const EdgeInsets.symmetric(
              horizontal: 25, vertical: 15),
          textStyle: const TextStyle(fontSize: 20),
        ),
        child: const Text(
          'Сдать тест',
          style: TextStyle(color: Colors.white),
        ),
      ),
      SizedBox(width: 10.w,),
      ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (builder) {
                return BlocBuilder<SubjectDropdownBloc, SubjectDropdownState>(

                  builder: (context, state) {
                    String dropdownValue = '';
                    if (state is SubjectDropdownChanged) {
                      dropdownValue = state.selectedValue;
                    }

                    if (state is SubjectDropdownLoaded) {
                      List<String> items = getSubjectTitles(state.subjects, context);
                      return Dialog(
                        insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                        backgroundColor: Colors.grey[900],
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            constraints: BoxConstraints(maxHeight: 260.h),
                            child: FormBuilder(
                              key: formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    FormBuilderTextField(
                                      style: const TextStyle(color: Colors.white),
                                      name: 'promo',
                                      initialValue: '',
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.white,),
                                        labelText: 'Введите код',
                                        labelStyle: TextStyle(color: Colors.white),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          gapPadding: 2.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    DropdownButtonHideUnderline(
                                      child: GFDropdown(
                                        padding: const EdgeInsets.all(15),
                                        borderRadius: BorderRadius.circular(5),
                                        border: const BorderSide(
                                            color: Colors.black12, width: 1),
                                        dropdownButtonColor: Colors.white,
                                        value: dropdownValue,
                                        onChanged: (newValue) {

                                        },
                                        items: items
                                            .map((value) => DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        ))
                                            .toList(),
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    FormBuilderTextField(
                                      style: const TextStyle(color: Colors.white),
                                      name: 'promo',
                                      initialValue: '',
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.white,),
                                        labelText: 'Введите код',
                                        labelStyle: TextStyle(color: Colors.white),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          gapPadding: 2.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    ElevatedButton(
                                        onPressed: () { },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: ColorConstant.orangeColor,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25, vertical: 15),
                                          textStyle: const TextStyle(fontSize: 20),
                                        ),
                                        child: const Text(
                                          'Вступить в класс',
                                          style: TextStyle(color: Colors.white),
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                );
              }
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstant.orangeColor,
          padding: const EdgeInsets.symmetric(
              horizontal: 25, vertical: 15),
          textStyle: const TextStyle(fontSize: 20),
        ),
        child: const Text(
          'Вступить в класс',
          style: TextStyle(color: Colors.white),
        ),
      )
    ],
  );
}

Widget getRoomList(List<ClassRoomEntity> rooms, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          String title = rooms[index].classroomGroup?.getLocalizedTitle(context)??'';
          String promo = rooms[index].classroomGroup?.promoCode??'';
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      ColorConstant.darkOrangeColor,
                      ColorConstant.appBarColor,
                    ])
            ),
            child: GFListTile(
              icon: GestureDetector(
                child: const Icon(Icons.logout, color: Colors.white),
                onTap: () {
                  context.read<ClassroomBloc>().add(ClassroomExitEvent(rooms[index].id));
                  context.read<ClassroomBloc>().add(ClassroomAllEvent());
                },
              ),
              listItemTextColor: GFColors.WHITE,
              title: Text(title, style: const TextStyle(fontSize: 19, color: Colors.white),),
              subTitle: Text(promo, style: const TextStyle(fontSize: 16, color: Colors.white),),
            ),
          );
        }
    ),
  );
}

List<String> getSubjectTitles(List<LocalSubjectEntity> subjects, BuildContext context) {
  return subjects.map((subject) => subject.getLocalizedTitle(context)).toList();
}

List<int> getSubjectIds(List<LocalSubjectEntity> subjects, BuildContext context) {
  return subjects.map((subject) => subject.id).toList();
}