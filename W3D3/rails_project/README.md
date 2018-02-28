# Rails demo_project
## Phase 1. Rails New
###1. Create a new rails project.
Use -d postgresql to set the database to PostgreSQL.
```
$ gem install rails -v '5.1.2'
$ rails new demo_project --database=postgresql
```

###2. Add gems for development in the Gemfile.

  ```
  group :development do
    # Run 'bundle exec annotate' in Terminal to add helpful comments to models.
    gem 'annotate'

    # These two give you a great error handling page.
    # But make sure to never use them in production!
    gem 'better_errors'
    gem 'binding_of_caller'

    # Gotta have byebug...
    gem 'byebug'

    # pry > irb
    gem 'pry-rails'
  end
  ```
  - This will allow us to do things like interact with our Rails project using the `pry`.
  - Make sure you are in the `demo_project` directory and run `bundle install`.

## Phase 2. Create Models and Migrations
###1. Migrations
####Step1
Notes from video2: We can write SQL syntax in ruby files to create tables, but we can also use Migrations to have rails write it for us. Migrations: paper trail of how the database got to the current state.

```
$ rails generate migration CreateHouses
```

Then we go to this file under db/migrate directory, and add address as a column:
```
class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :address, null: false
    end
  end
end
```

####Step2
* Error:
Run migrations that haven't been run:
```
$ rake db:migrate

rate
rake aborted!
ActiveRecord::NoDatabaseError: FATAL:  database "demo_project_development" does not exist


Caused by:
PG::ConnectionBad: FATAL:  database "demo_project_development" does not exist

Tasks: TOP => db:migrate
(See full trace by running task with --trace)
```

Got error. Go to the this file: demo_project/config/database.yml
We can see this:
```
development:
  <<: *default
  database: demo_project_development
```
So we tried to access this database but it does not exit.

* Do this:
```
$ rake db:create
$ rake db:migrate
```

* Check:
demo_project/db/schema.rb
In this file, we can see the tables that we just created.
We can't see the id column here, but we will have the id column in the table.

####Step3
Do the same thing to create the People table.
```
$ rails g migration CreatePeople
```
Then write the columns:
```
class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.integer :house_id, null: false
    end
  end
end
```
Then run the migration:
```
$ rake db:migrate
```

####Side Note 1
To delete the table we just created using migration, run:
```
$ rake db:rollback
```
So if we make a mistake in migration, we cannot just modify the file and migrate again. We need to rollback and then migrate again.

In industry, if we have pushed it to production. We usually just create a new migration.

e.g.
```
$ rails g migration AddPriceToHouses
```
Different syntax here:
```
class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    add_column :houses, :price, :integer
  end
end
```
Every house can have a price but is not required to.

####Side Note 2
I made a mistake and wanted to redo the project.

Got this error:
```
/demo_project (master)$ rake db:create
Database 'demo_project_development' already exists
Database 'demo_project_test' already exists
```
So I need to remove these databases from PostgreSQL:
```
$ psql
psql (10.2)
Type "help" for help.

sheny=# drop database demo_project_development;
DROP DATABASE
sheny=# drop database demo_project_test;
DROP DATABASE
```
