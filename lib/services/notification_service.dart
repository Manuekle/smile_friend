import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotificationService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> sendFriendRequestNotification({
    required String toUserId,
    required String fromUserName,
    required String? fromUserPhoto,
    required String postId,
  }) async {
    try {
      await _firestore.collection('notifications').add({
        'toUserId': toUserId,
        'fromUserId': FirebaseAuth.instance.currentUser?.uid,
        'fromUserName': fromUserName,
        'fromUserPhoto': fromUserPhoto,
        'type': 'friend_request',
        'title': 'Nueva solicitud de amistad',
        'body': '$fromUserName quiere conectar contigo',
        'postId': postId,
        'isRead': false,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error sending notification: $e');
    }
  }

  static Future<void> sendMessageNotification({
    required String toUserId,
    required String fromUserName,
    required String message,
    required String chatId,
  }) async {
    try {
      await _firestore.collection('notifications').add({
        'toUserId': toUserId,
        'fromUserId': FirebaseAuth.instance.currentUser?.uid,
        'fromUserName': fromUserName,
        'type': 'message',
        'title': 'Nuevo mensaje',
        'body': '$fromUserName: $message',
        'chatId': chatId,
        'isRead': false,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error sending message notification: $e');
    }
  }

  static Stream<QuerySnapshot> getNotificationsStream(String userId) {
    return _firestore
        .collection('notifications')
        .where('toUserId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  static Future<void> markNotificationAsRead(String notificationId) async {
    try {
      await _firestore
          .collection('notifications')
          .doc(notificationId)
          .update({'isRead': true});
    } catch (e) {
      print('Error marking notification as read: $e');
    }
  }
}