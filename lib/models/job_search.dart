import 'package:flutter/material.dart';

void main() => runApp(JobSearchApp());

class JobSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Job> jobs = [
    Job(title: "Senior UI Designer", company: "Google", location: "Remote", salary: "\$120k - \$150k", logoUrl: "G"),
    Job(title: "Flutter Developer", company: "Airbnb", location: "New York", salary: "\$130k - \$160k", logoUrl: "A"),
    Job(title: "Product Manager", company: "Tesla", location: "Austin, TX", salary: "\$140k - \$180k", logoUrl: "T"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Find Your Dream Job", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
        actions: [IconButton(icon: Icon(Icons.notifications_none), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search jobs, companies...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            // Job List
            Expanded(
              child: ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) => JobCard(job: jobs[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final Job job;
  JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          width: 50, height: 50,
          decoration: BoxDecoration(color: Colors.indigo[50], borderRadius: BorderRadius.circular(12)),
          child: Center(child: Text(job.logoUrl, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo))),
        ),
        title: Text(job.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${job.company} • ${job.location}"),
            SizedBox(height: 8),
            Text(job.salary, style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.w600)),
          ],
        ),
        trailing: Icon(Icons.bookmark_border),
      ),
    );
  }
}