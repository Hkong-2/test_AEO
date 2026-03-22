import 'package:boilerplate/presentation/topics_keywords/topic_detail/store/topic_detail_store.dart';
import 'package:flutter/material.dart';

class TopicDetailScreen extends StatefulWidget {
  const TopicDetailScreen({super.key, required this.topicName});

  final String topicName;

  @override
  State<TopicDetailScreen> createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  late final TopicDetailStore _store;

  @override
  void initState() {
    super.initState();
    _store = TopicDetailStore(topicName: widget.topicName);
    _store.searchController.addListener(() {
      _store.onSearchChanged(_store.searchController.text);
    });
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF101828),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: Text(
          'Topics & Keywords > ${widget.topicName}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: _store,
        builder: (context, _) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                _buildTabBar(),
                const SizedBox(height: 10),
                _buildSearchAndFilterBar(),
                const SizedBox(height: 12),
                Expanded(
                  child: _store.filteredPrompts.isEmpty
                      ? const Center(
                          child: Text(
                            'No prompts found',
                            style: TextStyle(color: Color(0xFF667085)),
                          ),
                        )
                      : ListView.separated(
                          itemCount: _store.filteredPrompts.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final prompt = _store.filteredPrompts[index];
                            return _buildPromptCard(prompt);
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: _store.tabs.map((tab) {
          final isActive = tab == _store.selectedTab;
          return Expanded(
            child: GestureDetector(
              onTap: () => _store.setTab(tab),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  tab.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                    color: const Color(0xFF344054),
                  ),
                ),
              ),
            ),
          );
        }).toList(growable: false),
      ),
    );
  }

  Widget _buildSearchAndFilterBar() {
    return Column(
      children: [
        TextField(
          controller: _store.searchController,
          decoration: InputDecoration(
            hintText: 'Search prompts...',
            prefixIcon: const Icon(Icons.search),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFD0D5DD)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFD0D5DD)),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.filter_list, size: 18),
              label: const Text('Filters'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF344054),
                side: const BorderSide(color: Color(0xFFD0D5DD)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Add Prompt'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6A00),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPromptCard(PromptItem prompt) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE4E7EC)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            prompt.question,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF101828),
              fontSize: 16,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: prompt.keywords
                .map((keyword) => _KeywordLabel(keyword: keyword))
                .toList(growable: false),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F4F7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'LLM: ${prompt.llm}',
              style: const TextStyle(
                color: Color(0xFF344054),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildMetaItem('Brand Mentioned', prompt.brandMentioned),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildMetaItem('Link Appeared', prompt.linkAppeared),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildMetaItem('Sentiment', prompt.sentiment),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                _formatCreatedDate(prompt.createdAt),
                style: const TextStyle(
                  color: Color(0xFF98A2B3),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              IconButton(
                tooltip: 'Refresh',
                onPressed: () => _store.refreshPrompt(prompt.id),
                icon: const Icon(Icons.refresh, color: Color(0xFF98A2B3)),
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                tooltip: 'Delete',
                onPressed: () => _store.deletePrompt(prompt.id),
                icon:
                    const Icon(Icons.delete_outline, color: Color(0xFFEF4444)),
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetaItem(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFD),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFEAECF0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF667085),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF101828),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _formatCreatedDate(DateTime value) {
    final month = value.month.toString().padLeft(2, '0');
    final day = value.day.toString().padLeft(2, '0');
    final hour24 = value.hour;
    final minute = value.minute.toString().padLeft(2, '0');
    final period = hour24 >= 12 ? 'PM' : 'AM';
    final hour12 = hour24 % 12 == 0 ? 12 : hour24 % 12;
    return '$month/$day/${value.year}, $hour12:$minute $period';
  }
}

class _KeywordLabel extends StatelessWidget {
  const _KeywordLabel({required this.keyword});

  final PromptKeyword keyword;

  @override
  Widget build(BuildContext context) {
    final style = _styleForType(keyword.type);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: style.background,
        border: Border.all(color: style.border),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        keyword.value,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: style.foreground,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  _KeywordStyle _styleForType(PromptKeywordType type) {
    switch (type) {
      case PromptKeywordType.informational:
        return const _KeywordStyle(
          background: Color(0xFFEFF8FF),
          border: Color(0xFFB2DDFF),
          foreground: Color(0xFF175CD3),
        );
      case PromptKeywordType.commercial:
        return const _KeywordStyle(
          background: Color(0xFFFFF6ED),
          border: Color(0xFFFDDCAB),
          foreground: Color(0xFFB54708),
        );
      case PromptKeywordType.topicKeyword:
        return const _KeywordStyle(
          background: Color(0xFFF5F3FF),
          border: Color(0xFFD9D6FE),
          foreground: Color(0xFF5925DC),
        );
      case PromptKeywordType.neutral:
        return const _KeywordStyle(
          background: Color(0xFFF9FAFB),
          border: Color(0xFFEAECF0),
          foreground: Color(0xFF475467),
        );
    }
  }
}

class _KeywordStyle {
  const _KeywordStyle({
    required this.background,
    required this.border,
    required this.foreground,
  });

  final Color background;
  final Color border;
  final Color foreground;
}
