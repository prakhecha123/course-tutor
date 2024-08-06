# Course and Tutor API

## Description

This is a simple Rails application that manages courses and tutors. A course can have many tutors, while a tutor can only teach one course.

## Installation

1. Clone the repository
    git clone https://github.com/yourusername/course_tutor.git

2. Navigate into the project directory
   cd course_tutor

3. Install dependencies
   bundle install

4. Set up the database
    rails db:create
    rails db:migrate

## API Endpoints

### 1. Create a Course and its Tutors

**POST /courses**

**Request Body:**
```json
{
  "course": {
    "name": "Science 101",
    "description": "Basic Science"
  },
  "tutors": [
    {
      "name": "Jane Doe",
      "email": "jane@example.com"
    },
    {
      "name": "Jim Beam",
      "email": "jim@example.com"
    }
  ]
}

Response:
    201 Created: Returns the created course along with its tutors.
    422 Unprocessable Entity: Returns errors if the request is invalid.

### 2. List All Courses with Tutors
    GET /courses
    Response:
    200 OK: Returns a list of all courses with their associated tutors.