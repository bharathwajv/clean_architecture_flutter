import 'package:clean_architecture_flutter/features/courses_list/data/model/course.dart';
import 'package:clean_architecture_flutter/features/courses_list/presentation/widgets/course_design_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CourseDesignWidget should render correctly',
      (WidgetTester tester) async {
    // Create a list of sample Course objects
    final List<Course> courses = [
      Course(
        img: '/CourseImages/202306031349.png',
        name: 'Course 1',
        id: 1,
        category: 'Programming',
        viewerQuntity: 100,
        numberOfVideos: 10,
      ),
      Course(
        img: '/CourseImages/202306031349.png',
        name: 'Course 2',
        id: 2,
        category: 'Math',
        viewerQuntity: 50,
        numberOfVideos: 8,
      ),
    ];

    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CourseDesignWidget(courses: courses),
      ),
    ));

    // Verify that the widget shows correctly
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Course 1'), findsOneWidget);
    expect(find.text('Category: Programming'), findsOneWidget);
    expect(find.text('Viewers: 100'), findsOneWidget);
    expect(find.text('Number of Videos: 10'), findsOneWidget);
  });

  testWidgets('VideoCard should render correctly', (WidgetTester tester) async {
    // Create a sample Course object
    final Course course = Course(
      img: '/CourseImages/202306031349.png',
      name: 'Course 1',
      id: 1,
      category: 'Programming',
      viewerQuntity: 100,
      numberOfVideos: 10,
    );

    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VideoCard(course: course),
      ),
    ));

    // Verify that the widget shows correctly
    expect(find.byType(Card), findsOneWidget);
    expect(find.text('Course 1'), findsOneWidget);
    expect(find.text('Category: Programming'), findsOneWidget);
    expect(find.text('Viewers: 100'), findsOneWidget);
    expect(find.text('Number of Videos: 10'), findsOneWidget);
  });
}
