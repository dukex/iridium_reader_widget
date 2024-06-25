import 'package:flutter/material.dart';
import 'bookmarks_panel.dart';
import 'content_panel.dart';
import 'package:mno_navigator/publication.dart';

class ReaderNavigationScreen extends StatefulWidget {
  final ReaderContext readerContext;

  const ReaderNavigationScreen({super.key, required this.readerContext});

  @override
  State<ReaderNavigationScreen> createState() => _ReaderNavigationScreenState();
}

class _ReaderNavigationScreenState extends State<ReaderNavigationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.onPrimary,
            controller: _tabController,
            tabs: const [
              Tab(text: "Contents"),
              Tab(text: "Bookmarks"),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: _tabController,
            children: [
              ContentPanel(
                readerContext: widget.readerContext,
              ),
              BookmarksPanel(
                readerContext: widget.readerContext,
              ),
            ],
          ),
        ),
      );
}
