import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yum_application/src/features/ingredients/data/datasource/remotes/remote_ingredient_api.dart';
import 'package:yum_application/src/features/ingredients/data/model/ingredient.dart';
import 'remote_ingredient_api_test.mocks.dart';

// 자동 mock 클래스를 생성할 클래스 목록 지정
@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  QuerySnapshot,
  QueryDocumentSnapshot,
  DocumentReference
])
void main() {
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollection;
  late MockDocumentReference<Map<String, dynamic>> mockDocumentRef;
  late RemoteIngredientApi api;
  late String collection;

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockCollection = MockCollectionReference<Map<String, dynamic>>();
    mockDocumentRef = MockDocumentReference<Map<String, dynamic>>();

    api = RemoteIngredientApi(firestore: mockFirestore);
    collection = RemoteIngredientApi.collecion;
  });

  group(RemoteIngredientApi, () {
    test('should returns stream of ingredient data list', () async {
      final doc1 = MockQueryDocumentSnapshot<Map<String, dynamic>>();
      final doc2 = MockQueryDocumentSnapshot<Map<String, dynamic>>();
      when(doc1.id).thenReturn('uuid1');
      when(doc2.id).thenReturn('uuid2');
      when(doc1.data()).thenReturn({
        'name': 'Apple',
        'isFreezed': false,
        'category': 'grape',
        'startAt': Timestamp.fromDate(DateTime(2023, 1, 1)),
        'endAt': Timestamp.fromDate(DateTime(2023, 1, 10)),
      });
      when(doc2.data()).thenReturn({
        'name': 'Banana',
        'isFreezed': true,
        'category': 'grape',
        'startAt': Timestamp.fromDate(DateTime(2023, 2, 1)),
        'endAt': null,
      });

      final querySnapshot = MockQuerySnapshot<Map<String, dynamic>>();
      when(querySnapshot.docs).thenReturn([doc1, doc2]);

      when(mockCollection.snapshots())
          .thenAnswer((_) => Stream.value(querySnapshot));
      when(mockFirestore.collection(collection)).thenReturn(mockCollection);

      final stream = api.getMyIngredient();

      await expectLater(
        stream,
        emits(predicate<List<Ingredient>>((ingredients) {
          if (ingredients.length != 2) return false;
          final first = ingredients[0];
          final second = ingredients[1];

          return first.name == 'Apple' &&
              first.isFreezed == false &&
              first.category == 'grape' &&
              first.startAt.year == 2023 &&
              first.endAt?.year == 2023 &&
              second.name == 'Banana' &&
              second.isFreezed == true &&
              second.category == 'grape' &&
              second.endAt == null;
        })),
      );
    });

    test('should return ingredient with generated id', () async {
      when(mockFirestore.collection(collection)).thenReturn(mockCollection);
      // given
      final ingredient = Ingredient(
        id: '', // 생성 전이므로 빈 값
        name: 'Tomato',
        category: 'vegetable',
        isFreezed: false,
        startAt: DateTime(2025, 8, 10),
        endAt: null,
      );

      const generatedId = 'abc123';

      // add() 호출 시 DocumentReference 반환
      when(mockCollection.add(ingredient.toJson()))
          .thenAnswer((_) async => mockDocumentRef);
      when(mockDocumentRef.id).thenReturn(generatedId);

      // when
      final result = await api.createNewIngredient(ingredient);

      // then
      expect(result.id, generatedId);
      expect(result.name, 'Tomato');
      verify(mockCollection.add(ingredient.toJson())).called(1);
    });

    test('should call delete with correct id', () async {
      when(mockFirestore.collection(collection)).thenReturn(mockCollection);
      when(mockCollection.doc(any)).thenReturn(mockDocumentRef);
      // given
      const testId = 'test123';

      // when
      await api.deleteIngredient(testId);

      // then
      verify(mockFirestore.collection(collection)).called(1);
      verify(mockCollection.doc(testId)).called(1);
      verify(mockDocumentRef.delete()).called(1);
    });

    test('sould be update with correct id and return updated ingredient',
        () async {
      when(mockFirestore.collection(collection)).thenReturn(mockCollection);
      when(mockCollection.doc(any)).thenReturn(mockDocumentRef);

      // given
      final ingredient = Ingredient(
        id: 'uuid', // 생성 전이므로 빈 값
        name: 'Tomato',
        category: 'vegetable',
        isFreezed: false,
        startAt: DateTime(2025, 8, 10),
        endAt: null,
      );

      when(mockDocumentRef.update(ingredient.toJson()))
          .thenAnswer((_) async => mockDocumentRef);

      await api.updateIngredient(ingredient);

      verify(mockFirestore.collection(collection)).called(1);
      verify(mockCollection.doc('uuid')).called(1);
      verify(mockDocumentRef.update(ingredient.toJson())).called(1);
    });
  });
}
