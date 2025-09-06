import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/app_theme.dart';
import '../utils/mood_utils.dart'; // Importar MoodUtils
import '../models/mood_model.dart'; // Importar MoodModel

class PostCard extends StatefulWidget {
  final Map<String, dynamic> postData;
  final String postId;

  const PostCard({
    super.key,
    required this.postData,
    required this.postId,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _isRequesting = false;

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final isOwnPost = widget.postData['userId'] == currentUser?.uid;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header del post
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primary,
                  backgroundImage: widget.postData['userPhoto'] != null
                      ? NetworkImage(widget.postData['userPhoto'])
                      : null,
                  child: widget.postData['userPhoto'] == null
                      ? const Icon(Icons.person, color: Colors.black)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.postData['userName'] ?? 'Usuario',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.text,
                        ),
                      ),
                      Text(
                        _formatTime(widget.postData['createdAt']),
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                _getMoodIcon(widget.postData['mood']),
              ],
            ),

            const SizedBox(height: 12),

            // Contenido del post
            Text(
              widget.postData['content'] ?? '',
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.text,
                height: 1.4,
              ),
            ),

            if (widget.postData['topics'] != null &&
                (widget.postData['topics'] as List).isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: (widget.postData['topics'] as List)
                    .map<Widget>((topic) => Chip(
                          label: Text(
                            topic,
                            style: const TextStyle(fontSize: 12),
                          ),
                          backgroundColor: AppColors.primary.withOpacity(0.2),
                          labelStyle: const TextStyle(color: AppColors.primary),
                          visualDensity: VisualDensity.compact,
                        ))
                    .toList(),
              ),
            ],

            const SizedBox(height: 16),

            // Botones de acción
            if (!isOwnPost)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _isRequesting ? null : _sendFriendRequest,
                      icon: _isRequesting
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.black,
                              ),
                            )
                          : const Icon(Icons.person_add),
                      label: Text(_isRequesting ? 'Enviando...' : 'Conectar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton.icon(
                    onPressed: () {
                      // TODO: Implementar chat directo
                    },
                    icon: const Icon(Icons.chat_bubble_outline),
                    label: const Text('Chat'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _getMoodIcon(String? moodLabel) {
    final Mood? mood = MoodUtils.getMoodData(moodLabel ?? 'neutral');
    if (mood == null) {
      return Icon(Icons.sentiment_neutral, color: AppColors.textSecondary, size: 24);
    }
    // NOTE: Los iconos en MoodModel son emojis (String), no IconData.
    // Aquí estoy usando iconos Material para demostración, pero podrías:
    // 1. Usar un paquete de iconos para emojis (e.g., font_awesome_flutter)
    // 2. Mostrar el emoji directamente en un Text widget.
    IconData iconData;
    switch (mood.label) {
      case 'Feliz':
        iconData = Icons.sentiment_very_satisfied;
        break;
      case 'Triste':
        iconData = Icons.sentiment_very_dissatisfied;
        break;
      case 'Ansioso':
        iconData = Icons.sentiment_dissatisfied;
        break;
      case 'Neutral':
        iconData = Icons.sentiment_neutral;
        break;
      case 'Emocionado':
        iconData = Icons.sentiment_satisfied_alt;
        break;
      case 'Abrumado':
        iconData = Icons.sentiment_dissatisfied_sharp;
        break;
      default:
        iconData = Icons.sentiment_satisfied;
    }

    return Icon(iconData, color: mood.color, size: 24);
  }

  String _formatTime(dynamic timestamp) {
    if (timestamp == null) return 'Hace un momento';
    
    final now = DateTime.now();
    final postTime = (timestamp as Timestamp).toDate();
    final difference = now.difference(postTime);

    if (difference.inMinutes < 1) {
      return 'Hace un momento';
    } else if (difference.inHours < 1) {
      return 'Hace ${difference.inMinutes} min';
    } else if (difference.inDays < 1) {
      return 'Hace ${difference.inHours} h';
    } else {
      return 'Hace ${difference.inDays} días';
    }
  }

  Future<void> _sendFriendRequest() async {
    if (_isRequesting) return;

    setState(() => _isRequesting = true);

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) return;

      await FirebaseFirestore.instance.collection('friendRequests').add({
        'fromUserId': currentUser.uid,
        'toUserId': widget.postData['userId'],
        'fromUserName': currentUser.displayName ?? 'Usuario',
        'fromUserPhoto': currentUser.photoURL,
        'status': 'pending',
        'createdAt': FieldValue.serverTimestamp(),
        'postId': widget.postId,
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Solicitud de amistad enviada con éxito.'), // Mensaje actualizado
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al enviar solicitud: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isRequesting = false); // Corregido _isPosting a _isRequesting
      }
    }
  }

  @override
  void dispose() {
    // _contentController.dispose(); // Eliminado, ya que no está definido
    super.dispose();
  }
}
