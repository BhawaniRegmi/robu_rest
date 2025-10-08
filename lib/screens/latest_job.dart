// 1. Data Model
class Job {
  final String title;
  final String company;
  final String location;

  Job({required this.title, required this.company, required this.location});
}

// 2. The Job List Widget
class JobsListScreen extends StatelessWidget {
  final List<Job> jobs = [
    // Sample data
    Job(title: 'Flutter Developer', company: 'Google', location: 'Mountain View, CA'),
    Job(title: 'Product Manager', company: 'Apple', location: 'Cupertino, CA'),
    Job(title: 'Data Scientist', company: 'Microsoft', location: 'Redmond, WA'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
      ),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          // 3. The List Item UI
          return Card(
            child: ListTile(
              title: Text(job.title),
              subtitle: Text('${job.company} - ${job.location}'),
              onTap: () {
                // Navigate to job details screen
              },
            ),
          );
        },
      ),
    );
  }
}