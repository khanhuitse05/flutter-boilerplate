import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/network/model/common/error_code.dart';
import 'package:myapp/src/network/model/common/result.dart';
import 'package:myapp/src/utils/utils.dart';

class BaseCollectionReference<T> {
  BaseCollectionReference(this.ref,
      {required this.setObjectId, required this.getObjectId});

  void log(dynamic value) => debugPrint('$value');
  final CollectionReference<T> ref;
  final T Function(T, String id) setObjectId;
  final String Function(T) getObjectId;

  Future<MResult<T>> get(String id) async {
    try {
      final DocumentSnapshot<T> doc = await ref.doc(id).get();
      if (doc.exists) {
        return MResult.success(doc.data());
      } else {
        return MResult.error('Document does not exist');
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Stream<DocumentSnapshot<T>> snapshots(String id) {
    return ref.doc(id).snapshots();
  }

  Future<MResult<T>> add(T item) async {
    try {
      final DocumentReference<T> doc =
          await ref.add(item).timeout(const Duration(seconds: 5));
      return MResult.success(setObjectId(item, doc.id));
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<T>> set(T item, {bool merge = true}) async {
    try {
      await ref
          .doc(getObjectId(item))
          .set(item, SetOptions(merge: merge))
          .timeout(const Duration(seconds: 5));
      return MResult.success(item);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult> update(String? id, Map<Object, Object?> data) async {
    if (id == null) {
      return MResult.error(MErrorCode.unknown);
    }
    try {
      await ref.doc(id).update(data).timeout(const Duration(seconds: 5));
      return MResult.success('');
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<String>> delete(String id) async {
    try {
      await ref.doc(id).delete().timeout(const Duration(seconds: 5));
      return MResult.success(id);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<T>>> getAll() async {
    try {
      final QuerySnapshot<T> query =
          await ref.get().timeout(const Duration(seconds: 5));
      final docs = query.docs.map((e) => e.data()).toList();

      return MResult.success(docs);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Stream<QuerySnapshot<T>> snapshotsAll() {
    return ref.snapshots();
  }

  // WhereIn limit 10 item
  // https://cloud.google.com/firestore/docs/query-data/queries
  Future<MResult<List<T>>> getDataByIds(List<String> rooms) async {
    if (rooms.isEmpty) {
      return MResult.success([]);
    }
    try {
      List<Query<T>> queries = [];
      final spliceRooms = Utils.splice(rooms, 10);
      for (final e in spliceRooms) {
        Query<T> queryChat = ref.where("id", whereIn: e);
        queries.add(queryChat);
      }
      final List<QuerySnapshot<T>> results =
          await Future.wait([for (final e in queries) e.get()]);
      final List<T> docs = [];
      for (final e in results) {
        docs.addAll(e.docs.map((e) => e.data()).toList());
      }
      return MResult.success(docs);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
