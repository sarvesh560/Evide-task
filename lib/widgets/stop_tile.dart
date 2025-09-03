import 'package:flutter/material.dart';
import '../model/stop_model.dart';

class StopTile extends StatelessWidget {
  final StopModel stop;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavTap;

  const StopTile({
    Key? key,
    required this.stop,
    required this.isFavorite,
    required this.onTap,
    required this.onFavTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          stop.stopname,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.timer, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            Chip(
              label: Text("ETA ~ ${stop.timedifference * 2} mins"),
              backgroundColor: Colors.deepPurple.shade50,
              labelStyle: const TextStyle(color: Colors.deepPurple),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 28,
          ),
          onPressed: onFavTap,
        ),
        onTap: onTap,
      ),
    );
  }
}
