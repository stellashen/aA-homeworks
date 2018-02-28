# Rails demo_project
## Phase 1. Rails New
### 1. Create a new rails project.
Use -d postgresql to set the database to PostgreSQL.
```
$ gem install rails -v '5.1.2'
$ rails new demo_project --database=postgresql
```

### 2. Add gems for development in the Gemfile.

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
### 1. Migrations
#### Step1
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

#### Step2
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

#### Step3
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

#### Side Note 1
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

#### Side Note 2
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

### 2.Models
Under the directory demo_project/app/models,
make two new files: house.rb, person.rb
```
class House < ActiveRecord::Base
end
```
Under Terminal:
enter rails console, create a House instance, and insert it into the houses table.
```
~/Dropbox/AA/aA-homeworks/W3D3/rails_project/demo_project (master)$ rails c
Running via Spring preloader in process 88482
Loading development environment (Rails 5.1.5)
No entry for terminal type "gem/ruby/2.3.0";
using dumb terminal settings.
[1] pry(main)> House
=> House (call 'House.connection' to establish a connection)
[2] pry(main)> h = House.new
=> #<House:0x007fd429cff350 id: nil, address: nil>
[3] pry(main)> h.address = "1111 M St"
=> "1111 M St"
[4] pry(main)> h.save
   (0.2ms)  BEGIN
  SQL (1.2ms)  INSERT INTO "houses" ("address") VALUES ($1) RETURNING "id"  [["address", "1111 M St"]]
   (0.7ms)  COMMIT
=> true
```
Read the data:
```
[5] pry(main)> bar = House.first
  House Load (0.4ms)  SELECT  "houses".* FROM "houses" ORDER BY "houses"."id" ASC LIMIT $1  [["LIMIT", 1]]
=> #<House:0x007fd42b8f9df8 id: 1, address: "1111 M St">
```
Create two people: Jeff and Jane
```
[6] pry(main)> jeff = Person.new(name: "Jeff", house_id: 1)
=> #<Person:0x007fd42a6f33e8 id: nil, name: "Jeff", house_id: 1>
[7] pry(main)> jeff.name
=> "Jeff"
[8] pry(main)> jeff.save
   (0.3ms)  BEGIN
  SQL (1.6ms)  INSERT INTO "people" ("name", "house_id") VALUES ($1, $2) RETURNING "id"  [["name", "Jeff"], ["house_id", 1]]
   (0.8ms)  COMMIT
=> true
[9] pry(main)> jane = Person.new(name: "Jane", house_id: 1)
=> #<Person:0x007fd42da21ad0 id: nil, name: "Jane", house_id: 1>
[10] pry(main)> jane.save
   (0.3ms)  BEGIN
  SQL (0.6ms)  INSERT INTO "people" ("name", "house_id") VALUES ($1, $2) RETURNING "id"  [["name", "Jane"], ["house_id", 1]]
   (1.8ms)  COMMIT
=> true
[11] pry(main)> Person.all
  Person Load (0.5ms)  SELECT "people".* FROM "people"
=> [#<Person:0x007fd42e84ab48 id: 1, name: "Jeff", house_id: 1>,
 #<Person:0x007fd42e84a940 id: 2, name: "Jane", house_id: 1>]
[12] pry(main)> Person.last
  Person Load (0.5ms)  SELECT  "people".* FROM "people" ORDER BY "people"."id" DESC LIMIT $1  [["LIMIT", 1]]
=> #<Person:0x007fd42d9b0128 id: 2, name: "Jane", house_id: 1>
```
Remove Jane:
```
[13] pry(main)> jane.destroy
   (0.3ms)  BEGIN
  SQL (0.9ms)  DELETE FROM "people" WHERE "people"."id" = $1  [["id", 2]]
   (1.7ms)  COMMIT
=> #<Person:0x007fd42da21ad0 id: 2, name: "Jane", house_id: 1>
[14] pry(main)> Person.all
  Person Load (0.5ms)  SELECT "people".* FROM "people"
=> [#<Person:0x007fd42d9099b8 id: 1, name: "Jeff", house_id: 1>]
```
find methods:
```
[15] pry(main)> Person.find(1)           
  Person Load (0.3ms)  SELECT  "people".* FROM "people" WHERE "people"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
=> #<Person:0x007fd429fb4fc8 id: 1, name: "Jeff", house_id: 1>
[16] pry(main)> Person.find_by(name: "Jeff")
  Person Load (0.5ms)  SELECT  "people".* FROM "people" WHERE "people"."name" = $1 LIMIT $2  [["name", "Jeff"], ["LIMIT", 1]]
=> #<Person:0x007fd42d892160 id: 1, name: "Jeff", house_id: 1>
```
Create instance and insert it into table directly:
```
[17] pry(main)> Person.create(name: "David", house_id: 1)
   (0.2ms)  BEGIN
  SQL (0.6ms)  INSERT INTO "people" ("name", "house_id") VALUES ($1, $2) RETURNING "id"  [["name", "David"], ["house_id", 1]]
   (1.7ms)  COMMIT
=> #<Person:0x007fd42d832aa8 id: 3, name: "David", house_id: 1>
[18] pry(main)> Person.last
  Person Load (0.7ms)  SELECT  "people".* FROM "people" ORDER BY "people"."id" DESC LIMIT $1  [["LIMIT", 1]]
=> #<Person:0x007fd429f96578 id: 3, name: "David", house_id: 1>
```

## Phase 3: Create associations
**Reload the rails console after making changes in files**
pry(main)> reload!

person.rb:
```
class Person < ActiveRecord::Base
  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'
end
```
house.rb:
```
class House < ActiveRecord::Base
  has_many :people,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Person'
end
```
Now, under rails console, we can use the methods, for example:
```
[3] pry(main)> house = House.last
  House Load (0.5ms)  SELECT  "houses".* FROM "houses" ORDER BY "houses"."id" DESC LIMIT $1  [["LIMIT", 1]]
=> #<House:0x007fd42e87b3d8 id: 1, address: "1111 M St">
[4] pry(main)> house.people
  Person Load (0.6ms)  SELECT "people".* FROM "people" WHERE "people"."house_id" = $1  [["house_id", 1]]
=> [#<Person:0x007fd42b17ead8 id: 1, name: "Jeff", house_id: 1>,
 #<Person:0x007fd42b17e6c8 id: 3, name: "David", house_id: 1>]
```
You don't only have the getter method house.people, you also have the setter method! For example:
```
[7] pry(main)> house.people = Person.all
  Person Load (0.7ms)  SELECT "people".* FROM "people"
=> [#<Person:0x007fd42a778868 id: 1, name: "Jeff", house_id: 1>,
 #<Person:0x007fd42a778700 id: 3, name: "David", house_id: 1>]
```
You can also push elements to the array:
```
[9] pry(main)> house.people << Person.first
  Person Load (0.5ms)  SELECT  "people".* FROM "people" ORDER BY "people"."id" ASC LIMIT $1  [["LIMIT", 1]]
   (0.6ms)  BEGIN
  House Load (0.3ms)  SELECT  "houses".* FROM "houses" WHERE "houses"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
   (0.3ms)  COMMIT
=> [#<Person:0x007fd42a778868 id: 1, name: "Jeff", house_id: 1>,
 #<Person:0x007fd42a778700 id: 3, name: "David", house_id: 1>,
 #<Person:0x007fd42a6b3ba8 id: 1, name: "Jeff", house_id: 1>]
```
