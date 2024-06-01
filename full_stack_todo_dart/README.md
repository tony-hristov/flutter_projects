# Fullstack TODO app

Contains notes and code from studying [Building a Fullstack App with dart_frog and Flutter in a Monorepo](https://saileshdahal.com.np/building-a-fullstack-app-with-dartfrog-and-flutter-in-a-monorepo-part-1)

See author's repo: [here](https://github.com/saileshbro/full_stack_todo_dart)

## Part 4: Connect to database

I have setup PostgreSQL on WSL2 Ubuntu instance.

Open Ubuntu WSL prompt and start PostgreSQL: `sudo service postgresql start`

To find the IP of the Ubuntu WSL instance run in Powershell: `wsl hostname -I`

Open `sudo -u postgres psql` shell in Ubuntu WSL and create user role and database for the app:

```sql
create database flutter_todo_db;
\c flutter_todo_db
create user flutter_todo_user with encrypted password 'flutter_todo_pass';
grant all privileges on database flutter_todo_db to flutter_todo_user;
grant all on schema public TO flutter_todo_user;
```

Then login as the DB user: `psql flutter_todo_db flutter_todo_user -h 127.0.0.1`

Create table:

```sql
CREATE TABLE todos(
    id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    completed BOOL DEFAULT FALSE,
    created_at timestamp default current_timestamp NOT NULL,
    updated_at timestamp null
);
```

To run the backend server: `dart_frog dev`

To run the backend _e2e_ tests: `dart test --concurrency=1 e2e/routes_test.dart`
