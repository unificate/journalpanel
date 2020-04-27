# Panel README

Panel is a Ruby on Rails web application that is used in conjunction with the MicroManage engine to manage existing
microservices. It uses an API exposed by the MicroManage engine.

## System dependencies

In addition to default Rails dependencies, this app uses the following gems:
* Devise
* Faraday
* RSpec
* Mysql2


## Configuration

Before using Panel, you must store the addresses of the Microservices you would like to manage.
To do this, add the desired entries to the database seed file, in `/db/seeds.rb`. The file contains
example entries with sample Microservice addresses.

The seed file also contains a default admin user, with username 'admin' and password 'password'. When using Panel
for the first time, this password should of course be changed to a more secure value.

Finally, you'll have to set up and run a MySQL instance on port 3306. A user will have to be created with the
information contained in `/config/database.yml`. After this is done, use `db:reset` to set up a new database loaded
with the appropriate schema. Stub code for microservices is included in their respective `/config/database.yml` files.


## Using the application

### Dashboard

After logging in, the dashboard tab will display the Microservices that can be managed. Selecting a Microservice will
display all tables that have been exposed, and selecting a table will display the contents of that table.

When viewing a table, clicking edit will bring up a 'New Change Request' form where the user can edit the existing
values in the row and submit their changes.

### Changes

A change request stores an update to an existing row in a Microservice table.

The Changes tab displays all pending change requests and the previously executed changes. Pending changes can be
selected and executed, that is pushed to the Microservice, or bundled into a transaction. Once a change is bundled
into a transaction, it cannot be executed or deleted individually.

### Transactions

A transaction is a bundle of one or more change requests that can be submitted at once.

The Transaction tab display all pending transactions and previously executed transactions. Viewing a transaction will
display all changes in it, and submitting it will push all the changes to the Microservice. Deleting a transaction will
not delete the changes contained in it. Those changes can then be rebundled into a new transaction, executed, or
deleted.

### Users

The Users tab is only visible to admins. It displays all existing users of the application and their role. Users can
be updated with a new role, new password, or deleted from the system. New users can also be created with a selected
role.

The roles exist as a tiered permission system, where higher roles include all permissions of roles below them.
* Developer: Create change requests, view change requests and transactions.
* Product Owner: Create transactions plus Developer permissions.
* Release Manager: Submit change requests and transactions plus Product Owner permissions.
* Admin: Manage users plus Release Manager permissions.


## Testing

Testing is handled with RSpec. Simply run `rspec` in the project base directory to run the tests. Testing is currently
present for logging in and user management.
