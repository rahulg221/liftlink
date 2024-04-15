import 'dart:ui';

import 'package:fitness_app/reusable_components/large_button.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JoinSession extends StatefulWidget {
  @override
  _JoinSessionState createState() => _JoinSessionState();
}

class _JoinSessionState extends State<JoinSession> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("aishamango's Workout",
              style: theme.textTheme.headlineSmall),
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.chevronLeft,
                size: theme.iconTheme.size, color: theme.iconTheme.color),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Workout Type',
                                style: theme.textTheme.headlineSmall),
                            const SizedBox(height: 12),
                            Text('Leg Workout',
                                style: theme.textTheme.bodyMedium),
                            const SizedBox(height: 24),
                            Text('Date and Time',
                                style: theme.textTheme.headlineSmall),
                            const SizedBox(height: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Thu, April 11',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      fontVariations: const <FontVariation>[
                                        FontVariation(
                                          'wght',
                                          500,
                                        ),
                                      ]),
                                ),
                                Text(
                                  '6:00 PM',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Text('Gym Location',
                                style: theme.textTheme.headlineSmall),
                            const SizedBox(height: 12),
                            Text('Crunch Fitness, Orlando, FL',
                                style: theme.textTheme.bodyMedium),
                            const SizedBox(height: 24),
                            Text('Current Participants',
                                style: theme.textTheme.headlineSmall),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(dummyImage),
                                ),
                                const SizedBox(width: 8),
                                Text('rafman14',
                                    style: theme.textTheme.bodyMedium)
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(dummyImage),
                                ),
                                const SizedBox(width: 8),
                                Text('rahulg221',
                                    style: theme.textTheme.bodyMedium)
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(dummyImage),
                                ),
                                const SizedBox(width: 8),
                                Text('raymanatl',
                                    style: theme.textTheme.bodyMedium)
                              ],
                            ),
                            const SizedBox(height: 24),
                            Text('Duration',
                                style: theme.textTheme.headlineSmall),
                            const SizedBox(height: 12),
                            Text('45 mins', style: theme.textTheme.bodyMedium),
                            const SizedBox(height: 24),
                            Text('Notes', style: theme.textTheme.headlineSmall),
                            const SizedBox(height: 12),
                            Text(
                                'Might go for a Squat PR today - anyone down to spot me?',
                                style: theme.textTheme.bodyMedium),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                    LargeButton(
                        isLoading: _isLoading, onTap: () {}, text: 'Join'),
                  ],
                ),
              ));
  }
}
