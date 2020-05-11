import 'package:clientf/enginf_clientf_service/enginf.post.model.dart';
import 'package:clientf/globals.dart';
import 'package:clientf/services/app.defines.dart';
import 'package:clientf/services/app.i18n.dart';
import 'package:clientf/services/app.service.dart';
import 'package:flutter/material.dart';

class PostListTitle extends StatefulWidget {
  PostListTitle(
    this.post, {
    Key key,
  }) : super(key: key);

  final EnginPost post;

  @override
  _PostListTitleState createState() => _PostListTitleState();
}

class _PostListTitleState extends State<PostListTitle> {
  bool showContent = false;

  @override
  Widget build(BuildContext context) {
    if (showContent) {
      return Column(
        children: <Widget>[
          Text('title: ${widget.post.title}'),
          Text('author: ${widget.post.uid}'),
          Text('created: ${widget.post.created}'),
          Text('content: ${widget.post.content}'),
          Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  AppService.alert(null, t('Not supported'));
                },
                child: Text('Reply'),
              ),
              RaisedButton(
                onPressed: () async {
                  print('go to edit page:');
                  print(widget.post);
                  final EnginPost post = await open(AppRoutes.postUpdate,
                      arguments: {'post': widget.post});

                  /// TODO: update post list after updating a post.
                  print(post);
                },
                child: Text('Edit'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    showContent = false;
                  });
                },
                child: Text('Close'),
              ),
            ],
          ),
        ],
      );
    } else {
      return ListTile(
        title: Text(widget.post.title ?? 'No title'),
        trailing: Icon(Icons.keyboard_arrow_down),
        onTap: () {
          setState(() {
            showContent = true;
          });
        },
      );
    }
  }
}
