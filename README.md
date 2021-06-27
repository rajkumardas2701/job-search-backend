# JobHub-Backend-API

> This is the backend (API) as part of Microverse final capstone project.<br>
This App is a hub for recruiter and job seekers to post or apply for jobs. <br>
By sending request to this API, users can signup/login, add, delete and see job applicants or view and apply for jobs.

## Features
1. Authentication system is implemented using Rails in-built session based authentication.
2. Bcrypt gem is used to save users password in the form of digest.
3. Users can be of recruiter or candidate types during sign up and play role of either posting jobs or viewing jobs.
4. Deleting a job also deletes all the applications for that job.

<b>Note:</b> FrontEnd of this app is linked <a href="https://github.com/rajkumardas2701/job-search-frontend">here</a> with live version <a href="https://job-search-by-raj.netlify.app/">here</a>.

## Built with
1. Rails 6.1.3
2. Ruby 2.7.2
3. Postgresql in the backend

## Quick Start

### Prerequisite

1. Install Ruby (<a href="https://www.ruby-lang.org/en/documentation/installation/">installation guide</a>)
2. Install Ruby on Rails (<a href="https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails">installation guide</a>)
3. Git and Github

### Get a local copy

git clone https://github.com/rajkumardas2701/job-search-frontend.git

### Installation

After cloning the app, enter below commands in sequence,

<pre>bundle install</pre>
<pre>rails db:create</pre>
<pre>rails db:migrate</pre>
<pre>rails server</pre>

Browse http://127.0.0.1:3001/ to validate if the API is accessible

### Testing

To test the app,<br>
1. Navigate to the directory where you cloned the app.
2. Open terminal in the same directory.
3. Test the code by typing `rspec` command.

## Authors

👤 **Rajkumar Das**

- Github: [@rajkumardas2701](https://github.com/rajkumardas2701)
- Twitter: [@Rajkuma58621299](https://twitter.com/Rajkuma58621299)
- Linkedin: [Rajkumar Das](https://www.linkedin.com/in/rajkumar-das-41308961/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/rajkumardas2701/job-search-backend/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.