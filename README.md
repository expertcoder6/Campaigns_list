
# Project Campaigns_list

## Objective

Create a users table in a MySQL database with a specific structure and implement an API in a Ruby on Rails application, hosted on EC2, to filter users based on campaign names present in their campaigns_list.

## Database Structure

**Table Name:** `users`

| Column         | Type         | Description                                      |
|----------------|--------------|--------------------------------------------------|
| `id`           | INT          | Primary key                                      |
| `name`         | VARCHAR(255) | User's name                                      |
| `email`        | VARCHAR(255) | User's email address                             |
| `campaigns_list` | JSON        | JSON array of objects representing campaigns the user is part of |

**Example Data:**

| id  | name | email          | campaigns_list                                                                 |
|-----|------|----------------|-------------------------------------------------------------------------------|
| 1   | John | john@gmail.com | `[{"campaign_name": "cam1", "campaign_id": "id1"}, {"campaign_name": "cam2", "campaign_id": "id2"}]` |
| 2   | Jane | jane@gmail.com | `[{"campaign_name": "cam1", "campaign_id": "id1"}, {"campaign_name": "cam3", "campaign_id": "id3"}]` |

## Task

Implement an API in a Ruby on Rails application and host it on EC2. The API should allow users to be filtered based on the campaign_name present in their campaigns_list. Users should be able to apply multiple campaign name filters.

## Requirements

### Database Setup

1. Create a MySQL database.
2. Create the `users` table with the specified structure.

### API Implementation

Implement the following API endpoints in a Ruby on Rails application:

#### List Users

- **Endpoint:** `GET /users`
- **Function:** Retrieve all users from the database.

#### Add New User

- **Endpoint:** `POST /users`
- **Function:** Add a new user to the database with name, email, and campaigns_list.
- **Request Body Example:**
  ```json
  {
    "name": "Alice",
    "email": "alice@gmail.com",
    "campaigns_list": [{"campaign_name": "cam4", "campaign_id": "id4"}]
  }
  ```

#### Filter Users by Campaign Names

- **Endpoint:** `GET /users/filter`
- **Parameters:** Accept multiple campaign names as query parameters.
- **Function:** Retrieve users whose campaigns_list contains any of the specified campaign names.
- **Example Request:**
  ```
  GET /users/filter?filter=cam1,cam2
  ```

### Hosting on EC2

Deploy the Ruby on Rails application to an EC2 instance and ensure the API endpoints are accessible.

### Optional Frontend UI

Provide a simple frontend UI to:
- List all users.
- Add new user records.
- Filter users by campaign names.

## Setup Instructions

### Prerequisites

- Ruby (3.3.0)
- Rails (>= 7.1.3)
- MySQL
- AWS EC2 Instance

### Local Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/expertcoder6/Campaigns_list.git
   cd Campaigns_list
   ```

2. **Install Dependencies**
   ```bash
   bundle install
   ```

3. **Database Configuration**
   - Configure your database settings in `config/database.yml`.

4. **Create and Migrate the Database**
   ```bash
   rails db:create
   rails db:migrate
   ```

5. **Run the Rails Server**
   ```bash
   rails server
   ```

6. **Access the Application**
   Open your web browser and go to `http://localhost:3000`.

### Deployment to EC2

1. **Launch an EC2 Instance**
   - Launch an EC2 instance with the appropriate settings for your application (e.g., Ubuntu, t2.micro).

2. **Install Required Software**
   - Install Ruby, Rails, MySQL, and other necessary software on the EC2 instance.

3. **Deploy the Application**
   - Clone your repository on the EC2 instance.
   - Set up the database configuration.
   - Migrate the database.
   - Start the Rails server.

4. **Configure Security Groups**
   - Ensure the security group for your EC2 instance allows inbound traffic on the necessary ports (e.g., port 3000 for Rails).

### Example API Requests

#### List Users

```bash
GET /users
```

#### Add New User

```bash
POST /users
{
  "name": "Alice",
  "email": "alice@gmail.com",
  "campaigns_list": [{"campaign_name": "cam4", "campaign_id": "id4"}]
}
```

#### Filter Users by Campaign Names

```bash
GET /users/filter?filter=cam1,cam2
```

## Submission

Provide the code repository link contains following thing:
- The Ruby on Rails application code.
- Instructions for setting up and running the application locally.
- Details for accessing the deployed application on EC2.