// Mocks generated by Mockito 5.1.0 from annotations
// in tv_shows/test/shows_provider_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:image_picker/image_picker.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tv_shows/models/register_info.dart' as _i6;
import 'package:tv_shows/models/review.dart' as _i3;
import 'package:tv_shows/models/show.dart' as _i8;
import 'package:tv_shows/models/sign_in_info.dart' as _i7;
import 'package:tv_shows/models/user.dart' as _i2;
import 'package:tv_shows/repository/networking_repository.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeUser_0 extends _i1.Fake implements _i2.User {}

class _FakeReview_1 extends _i1.Fake implements _i3.Review {}

/// A class which mocks [NetworkingRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkingRepository extends _i1.Mock
    implements _i4.NetworkingRepository {
  MockNetworkingRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.User> registerUser(_i6.RegisterInfo? registerInfo) =>
      (super.noSuchMethod(Invocation.method(#registerUser, [registerInfo]),
              returnValue: Future<_i2.User>.value(_FakeUser_0()))
          as _i5.Future<_i2.User>);
  @override
  _i5.Future<_i2.User> loginUser(_i7.SignInInfo? loginInfo) =>
      (super.noSuchMethod(Invocation.method(#loginUser, [loginInfo]),
              returnValue: Future<_i2.User>.value(_FakeUser_0()))
          as _i5.Future<_i2.User>);
  @override
  _i5.Future<List<_i8.Show>> fetchShows() =>
      (super.noSuchMethod(Invocation.method(#fetchShows, []),
              returnValue: Future<List<_i8.Show>>.value(<_i8.Show>[]))
          as _i5.Future<List<_i8.Show>>);
  @override
  _i5.Future<List<_i3.Review>> fetchReviews(_i8.Show? show) =>
      (super.noSuchMethod(Invocation.method(#fetchReviews, [show]),
              returnValue: Future<List<_i3.Review>>.value(<_i3.Review>[]))
          as _i5.Future<List<_i3.Review>>);
  @override
  _i5.Future<_i3.Review> addReview(_i3.Review? review) =>
      (super.noSuchMethod(Invocation.method(#addReview, [review]),
              returnValue: Future<_i3.Review>.value(_FakeReview_1()))
          as _i5.Future<_i3.Review>);
  @override
  _i5.Future<_i2.User> updateUserData(String? email, _i9.PickedFile? image) =>
      (super.noSuchMethod(Invocation.method(#updateUserData, [email, image]),
              returnValue: Future<_i2.User>.value(_FakeUser_0()))
          as _i5.Future<_i2.User>);
}
