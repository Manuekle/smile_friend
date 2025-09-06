import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../theme/app_theme.dart';
import '../../utils/constants.dart';
import '../../utils/mood_utils.dart';
import '../../widgets/mood_selector.dart';
import '../../widgets/topic_selector.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _contentController = TextEditingController();
  String _selectedMood = 'neutral'; // Default mood ID
  final List<String> _selectedTopics = [];
  bool _isPosting = false;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _publishPost() async {
    if (_isPosting) return;

    final l10n = AppLocalizations.of(context)!;
    final content = _contentController.text.trim();

    if (content.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.minPostLength(10)),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (content.length > AppConstants.maxPostLength) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.maxPostLength(AppConstants.maxPostLength)),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setState(() {
      _isPosting = true;
    });

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      await FirebaseFirestore.instance.collection('posts').add({
        'userId': user.uid,
        'userName': user.displayName ?? l10n.defaultUserName,
        'userPhoto': user.photoURL,
        'content': content,
        'mood': _selectedMood, // Store mood ID
        'topics': _selectedTopics,
        'createdAt': FieldValue.serverTimestamp(),
        'likes': 0,
        'comments': 0,
      });

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.errorPublishingPost),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isPosting = false;
        });
      }
    }
  }

  void _onMoodSelected(String moodId) { // Receive mood ID
    setState(() {
      _selectedMood = moodId;
    });
  }

  void _onTopicSelected(String topic) {
    setState(() {
      if (_selectedTopics.contains(topic)) {
        _selectedTopics.remove(topic);
      } else if (_selectedTopics.length < AppConstants.maxTopicsPerPost) {
        _selectedTopics.add(topic);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Obtain mental health topics from AppLocalizations
    final List<String> mentalHealthTopics = [
      l10n.depression,
      l10n.anxiety,
      l10n.stress,
      l10n.grief,
      l10n.selfEsteem,
      l10n.relationships,
      l10n.workSchool,
      l10n.personalGrowth,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.createPost),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: _isPosting
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _contentController,
                    maxLines: 8,
                    maxLength: AppConstants.maxPostLength,
                    decoration: InputDecoration(
                      hintText: l10n.whatIsOnYourMind,
                      hintStyle: const TextStyle(color: AppColors.textSecondary),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColors.surface,
                    ),
                    style: const TextStyle(color: AppColors.text),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    l10n.selectMood,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MoodSelector(
                    selectedMoodId: _selectedMood, // Pass mood ID
                    onMoodSelected: _onMoodSelected,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    l10n.selectTopics,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TopicSelector(
                    availableTopics: mentalHealthTopics,
                    selectedTopics: _selectedTopics,
                    onTopicSelected: _onTopicSelected,
                    maxTopics: AppConstants.maxTopicsPerPost,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _publishPost,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: _isPosting
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.text,
                              ),
                            )
                          : Text(
                              l10n.publish,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}