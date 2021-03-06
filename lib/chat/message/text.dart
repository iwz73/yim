import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bubble/bubble.dart';
import 'package:yim/chat/avatar.dart';
import 'package:yim/chat/message_item.dart';
import 'package:yim/model/message.dart';

class TextMessage extends StatefulWidget {
  final Message message;
  final int messageAlign;
  final String avatarUrl;
  final Color color;

  TextMessage(
      {Key key, this.message, this.messageAlign, this.avatarUrl, this.color})
      : super(key: key);

  @override
  _TextMessageState createState() => _TextMessageState();
}

class _TextMessageState extends State<TextMessage> {
  @override
  Widget build(BuildContext context) {
    return _buildTextMessage();
  }

  Widget _buildTextMessage() {
    if (widget.messageAlign == MessageLeftAlign) {
      return Container(
        margin: const EdgeInsets.only(left: 10, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Avatar(
                avatarUrl: widget.avatarUrl,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, left: 4),
              constraints: BoxConstraints(maxWidth: 250),
              child: Bubble(
                stick: true,
                nip: BubbleNip.leftBottom,
                color: Colors.white,
                child: Text(widget.message.text,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16.0)),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(right: 10, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10, right: 4),
              constraints: BoxConstraints(maxWidth: 250),
              child: Bubble(
                stick: true,
                nip: BubbleNip.rightTop,
                color: widget.color,
                child: Text(widget.message.text,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16.0)),
              ),
            ),
            Container(
              child: Avatar(avatarUrl: widget.avatarUrl),
            ),
          ],
        ),
      );
    }
  }
}
