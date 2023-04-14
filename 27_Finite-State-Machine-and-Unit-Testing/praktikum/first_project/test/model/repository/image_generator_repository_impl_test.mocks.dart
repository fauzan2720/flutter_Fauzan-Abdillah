// Mocks generated by Mockito 5.4.0 from annotations
// in first_project/test/model/repository/image_generator_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:first_project/model/repository/image_generator_repository_impl.dart'
    as _i4;
import 'package:first_project/model/service/api_service.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeApiService_0 extends _i1.SmartFake implements _i2.ApiService {
  _FakeApiService_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ImageGeneratorRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockImageGeneratorRepositoryImpl extends _i1.Mock
    implements _i4.ImageGeneratorRepositoryImpl {
  MockImageGeneratorRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ApiService get apiService => (super.noSuchMethod(
        Invocation.getter(#apiService),
        returnValue: _FakeApiService_0(
          this,
          Invocation.getter(#apiService),
        ),
      ) as _i2.ApiService);
  @override
  String get baseUrl => (super.noSuchMethod(
        Invocation.getter(#baseUrl),
        returnValue: '',
      ) as String);
  @override
  _i5.Future<_i3.Either<String, String>> generateAvatar(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #generateAvatar,
          [name],
        ),
        returnValue: _i5.Future<_i3.Either<String, String>>.value(
            _FakeEither_1<String, String>(
          this,
          Invocation.method(
            #generateAvatar,
            [name],
          ),
        )),
      ) as _i5.Future<_i3.Either<String, String>>);
}
