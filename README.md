# DB Viewer Demo Application

A demo application showcasing DB Viewer, a powerful database exploration tool with a web interface. This application provides a secure, user-friendly way to interact with your database structure and data.

## Features

- 🔒 **Secure Authentication**: User authentication via Devise
- 📊 **Database Explorer**: Visual interface for database exploration
- 📝 **SQL Editor**: Write and execute SQL queries
- 📋 **Schema Browser**: Navigate database tables and relationships
- 📊 **Data Visualization**: View query results in a clean, paginated interface

## Getting Started

### Prerequisites

- Ruby 3.2.2+
- Rails 8.0.2+
- PostgreSQL

### Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/dbviewer-demo.git
   cd dbviewer-demo
   ```

2. Install dependencies:

   ```bash
   bundle install
   ```

3. Set up the database:

   ```bash
   rails db:setup
   ```

4. Start the server:
   ```bash
   rails server
   ```

### Default Admin User

The application comes with a pre-configured admin user:

- **Email**: admin@example.com
- **Password**: password

### Managing Users

Since the application doesn't allow public signup, you can manage users via rake tasks:

- **Create a user**:

  ```bash
  rake user:create[email@example.com,password]
  ```

- **List all users**:
  ```bash
  rake user:list
  ```

* Deployment instructions

* ...
