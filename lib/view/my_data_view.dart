import 'dart:convert';
import 'dart:typed_data';

import 'package:feed/model/my_data.dart';
import 'package:feed/service/web_service.dart';
import 'package:feed/widgets/user_posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class MyDataView extends StatefulWidget {
  MyDataView({Key? key,}) : super(key: key);

  @override
  State<MyDataView> createState() => _MyDataViewState();
}

class _MyDataViewState extends State<MyDataView> {
  List myTags = [];
  final PagingController<int, MyData> _pagingController =
  PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await WebService().fetchJobs(pageKey);
      final isLastPage = newItems.length < 20;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 14.h,
            title: Container(
              width: 100.w,
              height: 8.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Feed",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          body: buildListView(context)),
    );
  }

  RefreshIndicator buildListView(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
            () => _pagingController.refresh(),
      ),
      child: PagedListView<int, MyData>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<MyData>(
            animateTransitions: true,
            itemBuilder: (context, item, index) {
              for (int i = 0; i < item.myDatumTags.length; i++) {
                myTags.add(item.myDatumTags[i].name);
              }
              return UserPost(
                userAvatarUrl: item.authorPhotoUrl,
                imageUrl: item.photoUrls.first,
                username: item.authorUsername,
                realName: item.authorFullName,
                placeName: item.placeName,
                location: item.placeLocationName,
                description: item.description,
                tagsList: item.myDatumTags,
                time: item.createdAt,
              );
            }),
      ),
    );
  }
}
