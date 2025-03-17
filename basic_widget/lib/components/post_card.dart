
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/post.dart';

class PostCard extends StatelessWidget{
  final Post post;

  const PostCard({
    super.key,
    required this.post
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Get text theme
    final theme = Theme.of(context);
    final bool isBright = theme.brightness == Brightness.light;
    final Color textColor = isBright ? Colors.black : Colors.white;
    // Áp dụng text theme
    final textTheme = theme.textTheme.apply(displayColor: textColor);

   return Card(
   // Đặt khoảng cách bằng nhau cho tất cả các cạnh.
     child: Padding(
       padding: const EdgeInsets.all(16.0),
       child: Row(
         // CrossAxisAlignment.start giúp các chữ căn về phía trên.
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            // TODO: Add CircleAvatar
              CircleAvatar(
                radius: 25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(post.avtUrl, fit: BoxFit.cover, width: 100,
                    height: 100,),
                )
              ),

            // TODO: Add spacing
           SizedBox(width: 16,),
            // TODO: Add Expanded Widget
           // các widget con chiếm toàn bộ không gian còn trống.
           Expanded(
             // xếp theo chiều dọc
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: textTheme.titleMedium,
                ),
                Text(
                  "10 minutes ago",
                  style: textTheme.bodySmall,
                ),
              ],
            )
           ),
         ],
       ) ,

     )

   );
  }
}

