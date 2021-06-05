# Project 6: Presentations

## Installation
Enter this code at the terminal:

  $git clone https://github.com/cse3901-2020au-1240/proj6-dabuggers.git
  $cd proj6-dabuggers
  $bundle install --without production

## Running the application
Enter this code at the terminal:

  $rails db:reset
  $rails server

Then click on the last link provided in the console.

If the server is still running from a previous attempt, you can follow these steps:
1. go to tmp > pids > server.pid to find the pid of the process
2. enter this code at the terminal:
    $kill -9 PID

## Helpful accounts
You can also look at the seed.rb file in the db folder for more of this information
Example admin:
username: sivilotti.1@osu.edu
password: admin

Example student:
username: chen.8290@osu.edu
password: test123

Example user: 
username: smith1@osu.edu
password: user

## Testing
Enter this code at the terminal:

  $rails db:reset
  $rails test

## Project Requirements Met
Assumption: 'audience member' means other students based off of how CSE 3901 was run for AU2020
1. Instructor/TA can create new presentations
2. students can submit feedback for presentations that are not their own, and presentations can continually be added throughout the semester with differing students assigned to it.
3. Admin users can look at specific presentations to see all the feedback provided for it
4. Presenter can see feedback provided by audience

## Database Structure Design
Students have a first name, last name, and email. They have and belong to multiple presentations.
Presentations have a name. They have and belong to many students. They also have many feedbacks.
Feedbacks have a comment, grade, and a student.

Students and Presentations have a many-to-many relationship with an intermediary table called presentaion_students.

## Style
All of the ERB files were tested using ERB linter. To run it, type

  $bundle exec erblint --lint-all –enable-all-linters

All CSS files were run through the W3 Schools CSS validator. The scss files have errors that are only there because the W3 Schools validator doesn't accept scss files.

All Ruby code follows the Rubocop error checker. There are a few functions which are labeled as having too many lines, but they were unrealistic to make shorter. We also did not add the frozen string literal comment to every controller, as we did not deem it necessary.