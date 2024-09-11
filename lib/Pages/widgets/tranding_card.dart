import 'package:flutter/material.dart';

class TrandingCard extends StatelessWidget {
  final String? imageUrl; // Allow imageUrl to be nullable
  final String tag;
  final String time;
  final String title;
  final String author;
  final VoidCallback ontap;

  const TrandingCard({
    super.key,
    required this.imageUrl,
    required this.tag,
    required this.time,
    required this.title,
    required this.author,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(5.0),
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl ??
                      'https://via.placeholder.com/150', // Default image
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/default_image.png', // Local fallback image
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$tag",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  "$time",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: 2, // Limit title to 2 lines
                    overflow:
                        TextOverflow.ellipsis, // Add ellipsis if text overflows
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 5),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    author,
                    overflow: TextOverflow
                        .ellipsis, // Handle overflow for author name
                    maxLines: 1, // Limit to 1 line
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
