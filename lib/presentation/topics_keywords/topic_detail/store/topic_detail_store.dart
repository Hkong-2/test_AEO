import 'package:flutter/material.dart';

enum TopicDetailTab {
  active('Active'),
  suggestion('Suggestion'),
  keyword('Keyword'),
  inactive('Inactive');

  final String label;
  const TopicDetailTab(this.label);
}

enum PromptKeywordType {
  informational,
  commercial,
  topicKeyword,
  neutral,
}

class PromptKeyword {
  final String value;
  final PromptKeywordType type;

  const PromptKeyword({
    required this.value,
    required this.type,
  });
}

class PromptItem {
  final String id;
  final String question;
  final TopicDetailTab tab;
  final List<PromptKeyword> keywords;
  final String llm;
  final String brandMentioned;
  final String linkAppeared;
  final String sentiment;
  final DateTime createdAt;

  const PromptItem({
    required this.id,
    required this.question,
    required this.tab,
    required this.keywords,
    required this.llm,
    required this.brandMentioned,
    required this.linkAppeared,
    required this.sentiment,
    required this.createdAt,
  });
}

class TopicDetailStore extends ChangeNotifier {
  TopicDetailStore({required this.topicName});

  final String topicName;
  final TextEditingController searchController = TextEditingController();

  TopicDetailTab _selectedTab = TopicDetailTab.active;

  final List<PromptItem> _prompts = [
    PromptItem(
      id: 'p1',
      question:
          'What are the best undergraduate computer science programs in Vietnam right now?',
      tab: TopicDetailTab.active,
      keywords: [
        PromptKeyword(
          value: 'Informational',
          type: PromptKeywordType.informational,
        ),
        PromptKeyword(
          value: 'Higher Education in IT',
          type: PromptKeywordType.topicKeyword,
        ),
        PromptKeyword(
          value: 'best undergraduate computer science programs in Vietnam',
          type: PromptKeywordType.neutral,
        ),
      ],
      llm: 'AI Overviews',
      brandMentioned: '-',
      linkAppeared: '-',
      sentiment: '-',
      createdAt: DateTime(2026, 3, 17, 14, 26),
    ),
    PromptItem(
      id: 'p2',
      question:
          'How do I choose the best IT university in Vietnam to align with my career goals?',
      tab: TopicDetailTab.suggestion,
      keywords: [
        PromptKeyword(value: 'Commercial', type: PromptKeywordType.commercial),
        PromptKeyword(
          value: 'Higher Education in IT',
          type: PromptKeywordType.topicKeyword,
        ),
        PromptKeyword(
          value: 'how to choose an IT university in Vietnam',
          type: PromptKeywordType.neutral,
        ),
      ],
      llm: 'AI Overviews',
      brandMentioned: '-',
      linkAppeared: '-',
      sentiment: '-',
      createdAt: DateTime(2026, 3, 17, 14, 26),
    ),
    PromptItem(
      id: 'p3',
      question:
          'What should I expect from a high-quality IT education program in terms of coursework and facilities?',
      tab: TopicDetailTab.keyword,
      keywords: [
        PromptKeyword(
          value: 'Informational',
          type: PromptKeywordType.informational,
        ),
        PromptKeyword(
          value: 'Higher Education in IT',
          type: PromptKeywordType.topicKeyword,
        ),
        PromptKeyword(
          value: 'what to expect from a high-quality IT education program',
          type: PromptKeywordType.neutral,
        ),
      ],
      llm: 'AI Overviews',
      brandMentioned: '-',
      linkAppeared: '-',
      sentiment: '-',
      createdAt: DateTime(2026, 3, 17, 14, 25),
    ),
    PromptItem(
      id: 'p4',
      question:
          'Could you outline the standard curriculum requirements for a Master of Science in Computer Science?',
      tab: TopicDetailTab.inactive,
      keywords: [
        PromptKeyword(
          value: 'Informational',
          type: PromptKeywordType.informational,
        ),
        PromptKeyword(
          value: 'Higher Education in IT',
          type: PromptKeywordType.topicKeyword,
        ),
        PromptKeyword(
          value: 'computer science curriculum requirements',
          type: PromptKeywordType.neutral,
        ),
      ],
      llm: 'AI Overviews',
      brandMentioned: '-',
      linkAppeared: '-',
      sentiment: '-',
      createdAt: DateTime(2026, 3, 17, 14, 25),
    ),
  ];

  TopicDetailTab get selectedTab => _selectedTab;

  List<TopicDetailTab> get tabs => TopicDetailTab.values;

  void setTab(TopicDetailTab tab) {
    _selectedTab = tab;
    notifyListeners();
  }

  void onSearchChanged(String _) {
    notifyListeners();
  }

  void deletePrompt(String id) {
    _prompts.removeWhere((prompt) => prompt.id == id);
    notifyListeners();
  }

  void refreshPrompt(String id) {
    final promptIndex = _prompts.indexWhere((prompt) => prompt.id == id);
    if (promptIndex < 0) {
      return;
    }

    final prompt = _prompts[promptIndex];
    _prompts[promptIndex] = PromptItem(
      id: prompt.id,
      question: prompt.question,
      tab: prompt.tab,
      keywords: prompt.keywords,
      llm: prompt.llm,
      brandMentioned: prompt.brandMentioned,
      linkAppeared: prompt.linkAppeared,
      sentiment: prompt.sentiment,
      createdAt: DateTime.now(),
    );
    notifyListeners();
  }

  List<PromptItem> get filteredPrompts {
    final query = searchController.text.trim().toLowerCase();

    return _prompts.where((prompt) {
      final matchesTab = prompt.tab == _selectedTab;
      final matchesSearch = query.isEmpty ||
          prompt.question.toLowerCase().contains(query) ||
          prompt.keywords
              .any((keyword) => keyword.value.toLowerCase().contains(query));

      return matchesTab && matchesSearch;
    }).toList(growable: false);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
