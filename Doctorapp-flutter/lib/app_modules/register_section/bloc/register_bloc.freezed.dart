// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name, String email, String age,
            String phoneno, String password)
        userRegister,
    required TResult Function(
            String name,
            String phonenumber,
            String specialization,
            String email,
            String qualification,
            String age,
            String phoneno,
            String experience,
            String status,
            File image,
            String doctorfee,
            String password)
        doctorRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String email, String age, String phoneno,
            String password)?
        userRegister,
    TResult? Function(
            String name,
            String phonenumber,
            String specialization,
            String email,
            String qualification,
            String age,
            String phoneno,
            String experience,
            String status,
            File image,
            String doctorfee,
            String password)?
        doctorRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String email, String age, String phoneno,
            String password)?
        userRegister,
    TResult Function(
            String name,
            String phonenumber,
            String specialization,
            String email,
            String qualification,
            String age,
            String phoneno,
            String experience,
            String status,
            File image,
            String doctorfee,
            String password)?
        doctorRegister,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UserRegister value) userRegister,
    required TResult Function(_DoctorRegister value) doctorRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UserRegister value)? userRegister,
    TResult? Function(_DoctorRegister value)? doctorRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UserRegister value)? userRegister,
    TResult Function(_DoctorRegister value)? doctorRegister,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'RegisterEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name, String email, String age,
            String phoneno, String password)
        userRegister,
    required TResult Function(
            String name,
            String phonenumber,
            String specialization,
            String email,
            String qualification,
            String age,
            String phoneno,
            String experience,
            String status,
            File image,
            String doctorfee,
            String password)
        doctorRegister,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String email, String age, String phoneno,
            String password)?
        userRegister,
    TResult? Function(
            String name,
            String phonenumber,
            String specialization,
            String email,
            String qualification,
            String age,
            String phoneno,
            String experience,
            String status,
            File image,
            String doctorfee,
            String password)?
        doctorRegister,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String email, String age, String phoneno,
            String password)?
        userRegister,
    TResult Function(
            String name,
            String phonenumber,
            String specialization,
            String email,
            String qualification,
            String age,
            String phoneno,
            String experience,
            String status,
            File image,
            String doctorfee,
            String password)?
        doctorRegister,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UserRegister value) userRegister,
    required TResult Function(_DoctorRegister value) doctorRegister,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UserRegister value)? userRegister,
    TResult? Function(_DoctorRegister value)? doctorRegister,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UserRegister value)? userRegister,
    TResult Function(_DoctorRegister value)? doctorRegister,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements RegisterEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$UserRegisterImplCopyWith<$Res> {
  factory _$$UserRegisterImplCopyWith(
          _$UserRegisterImpl value, $Res Function(_$UserRegisterImpl) then) =
      __$$UserRegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String name, String email, String age, String phoneno, String password});
}

/// @nodoc
class __$$UserRegisterImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$UserRegisterImpl>
    implements _$$UserRegisterImplCopyWith<$Res> {
  __$$UserRegisterImplCopyWithImpl(
      _$UserRegisterImpl _value, $Res Function(_$UserRegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? age = null,
    Object? phoneno = null,
    Object? password = null,
  }) {
    return _then(_$UserRegisterImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      phoneno: null == phoneno
          ? _value.phoneno
          : phoneno // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserRegisterImpl implements _UserRegister {
  const _$UserRegisterImpl(
      {required this.name,
      required this.email,
      required this.age,
      required this.phoneno,
      required this.password});

  @override
  final String name;
  @override
  final String email;
  @override
  final String age;
  @override
  final String phoneno;
  @override
  final String password;

  @override
  String toString() {
    return 'RegisterEvent.userRegister(name: $name, email: $email, age: $age, phoneno: $phoneno, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegisterImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.phoneno, phoneno) || other.phoneno == phoneno) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, age, phoneno, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegisterImplCopyWith<_$UserRegisterImpl> get copyWith =>
      __$$UserRegisterImplCopyWithImpl<_$UserRegisterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name, String email, String age,
            String phoneno, String password)
        userRegister,
    required TResult Function(
            String name,
            String phonenumber,
            String specialization,
            String email,
            String qualification,
            String age,
            String phoneno,
            String experience,
            String status,
            File image,
            String doctorfee,
            String password)
        doctorRegister,
  }) {
    return userRegister(name, email, age, phoneno, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String email, String age, String phoneno,
            String password)?
        userRegister,
    TResult? Function(
            String name,
            String phonenumber,
            String specialization,
            String email,
            String qualification,
            String age,
            String phoneno,
            String experience,
            String status,
            File image,
            String doctorfee,
            String password)?
        doctorRegister,
  }) {
    return userRegister?.call(name, email, age, phoneno, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String email, String age, String phoneno,
            String password)?
        userRegister,
    TResult Function(
            String name,
            String phonenumber,
            String specialization,
            String email,
            String qualification,
            String age,
            String phoneno,
            String experience,
            String status,
            File image,
            String doctorfee,
            String password)?
        doctorRegister,
    required TResult orElse(),
  }) {
    if (userRegister != null) {
      return userRegister(name, email, age, phoneno, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UserRegister value) userRegister,
    required TResult Function(_DoctorRegister value) doctorRegister,
  }) {
    return userRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UserRegister value)? userRegister,
    TResult? Function(_DoctorRegister value)? doctorRegister,
  }) {
    return userRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UserRegister value)? userRegister,
    TResult Function(_DoctorRegister value)? doctorRegister,
    required TResult orElse(),
  }) {
    if (userRegister != null) {
      return userRegister(this);
    }
    return orElse();
  }
}

abstract class _UserRegister implements RegisterEvent {
  const factory _UserRegister(
      {required final String name,
      required final String email,
      required final String age,
      required final String phoneno,
      required final String password}) = _$UserRegisterImpl;

  String get name;
  String get email;
  String get age;
  String get phoneno;
  String get password;
  @JsonKey(ignore: true)
  _$$UserRegisterImplCopyWith<_$UserRegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DoctorRegisterImplCopyWith<$Res> {
  factory _$$DoctorRegisterImplCopyWith(_$DoctorRegisterImpl value,
          $Res Function(_$DoctorRegisterImpl) then) =
      __$$DoctorRegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String name,
      String phonenumber,
      String specialization,
      String email,
      String qualification,
      String age,
      String phoneno,
      String experience,
      String status,
      File image,
      String doctorfee,
      String password});
}

/// @nodoc
class __$$DoctorRegisterImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$DoctorRegisterImpl>
    implements _$$DoctorRegisterImplCopyWith<$Res> {
  __$$DoctorRegisterImplCopyWithImpl(
      _$DoctorRegisterImpl _value, $Res Function(_$DoctorRegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phonenumber = null,
    Object? specialization = null,
    Object? email = null,
    Object? qualification = null,
    Object? age = null,
    Object? phoneno = null,
    Object? experience = null,
    Object? status = null,
    Object? image = null,
    Object? doctorfee = null,
    Object? password = null,
  }) {
    return _then(_$DoctorRegisterImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phonenumber: null == phonenumber
          ? _value.phonenumber
          : phonenumber // ignore: cast_nullable_to_non_nullable
              as String,
      specialization: null == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      qualification: null == qualification
          ? _value.qualification
          : qualification // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      phoneno: null == phoneno
          ? _value.phoneno
          : phoneno // ignore: cast_nullable_to_non_nullable
              as String,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File,
      doctorfee: null == doctorfee
          ? _value.doctorfee
          : doctorfee // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DoctorRegisterImpl implements _DoctorRegister {
  const _$DoctorRegisterImpl(
      {required this.name,
      required this.phonenumber,
      required this.specialization,
      required this.email,
      required this.qualification,
      required this.age,
      required this.phoneno,
      required this.experience,
      required this.status,
      required this.image,
      required this.doctorfee,
      required this.password});

  @override
  final String name;
  @override
  final String phonenumber;
  @override
  final String specialization;
  @override
  final String email;
  @override
  final String qualification;
  @override
  final String age;
  @override
  final String phoneno;
  @override
  final String experience;
  @override
  final String status;
  @override
  final File image;
  @override
  final String doctorfee;
  @override
  final String password;

  @override
  String toString() {
    return 'RegisterEvent.doctorRegister(name: $name, phonenumber: $phonenumber, specialization: $specialization, email: $email, qualification: $qualification, age: $age, phoneno: $phoneno, experience: $experience, status: $status, image: $image, doctorfee: $doctorfee, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorRegisterImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phonenumber, phonenumber) ||
                other.phonenumber == phonenumber) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.qualification, qualification) ||
                other.qualification == qualification) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.phoneno, phoneno) || other.phoneno == phoneno) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.doctorfee, doctorfee) ||
                other.doctorfee == doctorfee) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      phonenumber,
      specialization,
      email,
      qualification,
      age,
      phoneno,
      experience,
      status,
      image,
      doctorfee,
      password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorRegisterImplCopyWith<_$DoctorRegisterImpl> get copyWith =>
      __$$DoctorRegisterImplCopyWithImpl<_$DoctorRegisterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name, String email, String age,
            String phoneno, String password)
        userRegister,
    required TResult Function(
            String name,
            String phonenumber,
            String specialization,
            String email,
            String qualification,
            String age,
            String phoneno,
            String experience,
            String status,
            File image,
            String doctorfee,
            String password)
        doctorRegister,
  }) {
    return doctorRegister(
        name,
        phonenumber,
        specialization,
        email,
        qualification,
        age,
        phoneno,
        experience,
        status,
        image,
        doctorfee,
        password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String email, String age, String phoneno,
            String password)?
        userRegister,
    TResult? Function(
            String name,
            String phonenumber,
            String specialization,
            String email,
            String qualification,
            String age,
            String phoneno,
            String experience,
            String status,
            File image,
            String doctorfee,
            String password)?
        doctorRegister,
  }) {
    return doctorRegister?.call(
        name,
        phonenumber,
        specialization,
        email,
        qualification,
        age,
        phoneno,
        experience,
        status,
        image,
        doctorfee,
        password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String email, String age, String phoneno,
            String password)?
        userRegister,
    TResult Function(
            String name,
            String phonenumber,
            String specialization,
            String email,
            String qualification,
            String age,
            String phoneno,
            String experience,
            String status,
            File image,
            String doctorfee,
            String password)?
        doctorRegister,
    required TResult orElse(),
  }) {
    if (doctorRegister != null) {
      return doctorRegister(
          name,
          phonenumber,
          specialization,
          email,
          qualification,
          age,
          phoneno,
          experience,
          status,
          image,
          doctorfee,
          password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UserRegister value) userRegister,
    required TResult Function(_DoctorRegister value) doctorRegister,
  }) {
    return doctorRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UserRegister value)? userRegister,
    TResult? Function(_DoctorRegister value)? doctorRegister,
  }) {
    return doctorRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UserRegister value)? userRegister,
    TResult Function(_DoctorRegister value)? doctorRegister,
    required TResult orElse(),
  }) {
    if (doctorRegister != null) {
      return doctorRegister(this);
    }
    return orElse();
  }
}

abstract class _DoctorRegister implements RegisterEvent {
  const factory _DoctorRegister(
      {required final String name,
      required final String phonenumber,
      required final String specialization,
      required final String email,
      required final String qualification,
      required final String age,
      required final String phoneno,
      required final String experience,
      required final String status,
      required final File image,
      required final String doctorfee,
      required final String password}) = _$DoctorRegisterImpl;

  String get name;
  String get phonenumber;
  String get specialization;
  String get email;
  String get qualification;
  String get age;
  String get phoneno;
  String get experience;
  String get status;
  File get image;
  String get doctorfee;
  String get password;
  @JsonKey(ignore: true)
  _$$DoctorRegisterImplCopyWith<_$DoctorRegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loding,
    required TResult Function(String error) error,
    required TResult Function(UserRegisterModel response) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(UserRegisterModel response)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(UserRegisterModel response)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loding,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loding,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loding,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RegisterState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loding,
    required TResult Function(String error) error,
    required TResult Function(UserRegisterModel response) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(UserRegisterModel response)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(UserRegisterModel response)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loding,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loding,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loding,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RegisterState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LodingImplCopyWith<$Res> {
  factory _$$LodingImplCopyWith(
          _$LodingImpl value, $Res Function(_$LodingImpl) then) =
      __$$LodingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LodingImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$LodingImpl>
    implements _$$LodingImplCopyWith<$Res> {
  __$$LodingImplCopyWithImpl(
      _$LodingImpl _value, $Res Function(_$LodingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LodingImpl implements _Loding {
  const _$LodingImpl();

  @override
  String toString() {
    return 'RegisterState.loding()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LodingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loding,
    required TResult Function(String error) error,
    required TResult Function(UserRegisterModel response) success,
  }) {
    return loding();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(UserRegisterModel response)? success,
  }) {
    return loding?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(UserRegisterModel response)? success,
    required TResult orElse(),
  }) {
    if (loding != null) {
      return loding();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loding,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return loding(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loding,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return loding?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loding,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loding != null) {
      return loding(this);
    }
    return orElse();
  }
}

abstract class _Loding implements RegisterState {
  const factory _Loding() = _$LodingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'RegisterState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loding,
    required TResult Function(String error) error,
    required TResult Function(UserRegisterModel response) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(UserRegisterModel response)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(UserRegisterModel response)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loding,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loding,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loding,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements RegisterState {
  const factory _Error({required final String error}) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserRegisterModel response});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$SuccessImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as UserRegisterModel,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.response});

  @override
  final UserRegisterModel response;

  @override
  String toString() {
    return 'RegisterState.success(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loding,
    required TResult Function(String error) error,
    required TResult Function(UserRegisterModel response) success,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(UserRegisterModel response)? success,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(UserRegisterModel response)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loding,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loding,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loding,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements RegisterState {
  const factory _Success({required final UserRegisterModel response}) =
      _$SuccessImpl;

  UserRegisterModel get response;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
