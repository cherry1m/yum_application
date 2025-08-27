import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/features/ingredients/data/datasource/remotes/remote_favorite_category_api.dart';
import 'package:yum_application/src/features/ingredients/data/model/favorite_category.dart';

import 'remote_ingredient_api_test.mocks.dart';

@GenerateMocks([
  FirebaseFirestore,
  QuerySnapshot,
  QueryDocumentSnapshot,
  CollectionReference,
  DocumentReference,
])
void main() {
  late MockFirebaseFirestore firebaseFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollection;
  late MockDocumentReference<Map<String, dynamic>> mockDocumentRef;
  late RemoteFavoriteCategoryApi api;
  late String collection;

  group(RemoteFavoriteCategoryApi, () {
    setUp(() {
      firebaseFirestore = MockFirebaseFirestore();
      mockCollection = MockCollectionReference<Map<String, dynamic>>();
      api = RemoteFavoriteCategoryApi(firestore: firebaseFirestore);
      mockDocumentRef = MockDocumentReference<Map<String, dynamic>>();

      collection = RemoteFavoriteCategoryApi.collections;
    });

    test('should returns favorite category items', () async {
      final doc1 = MockQueryDocumentSnapshot<Map<String, dynamic>>();
      final doc2 = MockQueryDocumentSnapshot<Map<String, dynamic>>();
      when(doc1.id).thenReturn('uuid1');
      when(doc1.data()).thenReturn({'category': 'grape'});
      when(doc2.id).thenReturn('uuid2');
      when(doc2.data()).thenReturn({'category': 'beef'});

      final querySnapshot = MockQuerySnapshot<Map<String, dynamic>>();
      when(querySnapshot.docs).thenReturn([doc1, doc2]);
      when(mockCollection.get()).thenAnswer((_) => Future.value(querySnapshot));
      when(firebaseFirestore.collection(collection)).thenReturn(mockCollection);

      final future = await api.getFavorites();

      expect(future.length, 2);
      final first = future[0];

      expect(first.category, 'grape');
      final second = future[1];

      expect(second.category, 'beef');
    });

    test('should returns new created favorite category with generated id',
        () async {
      when(firebaseFirestore.collection(collection)).thenReturn(mockCollection);

      const favorite = FavoriteCategory(category: 'grape');

      const generatedId = 'abc123';

      when(mockCollection.add(favorite.toFirestore()))
          .thenAnswer((_) async => mockDocumentRef);

      when(mockDocumentRef.id).thenReturn(generatedId);

      final result = await api.createFavorite(favorite);

      expect(result.category, 'grape');
    });

    test('should call delete with correct id', () async {
      when(firebaseFirestore.collection(collection)).thenReturn(mockCollection);
      when(mockCollection.doc(any)).thenReturn(mockDocumentRef);

      verify(firebaseFirestore.collection(collection)).called(1);
      // verify(mockCollection.doc(testId)).called(1);
      verify(mockDocumentRef.delete()).called(1);
    });
  });
}
