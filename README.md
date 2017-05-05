# Rales Engine
## Description
This project creates an API and endpoints to access records, relationships, and business intelligence for an imaginary e-commerce site. All returned data renders as JSON in the browser.

Technology: Ruby, Rails, PostgresSQL, and RSpec.

## Getting Started

1. Run `git clone git@github.com:jk1dd/rales-engine.git` using SSH or `git clone https://github.com/jk1dd/rales-engine.git` using HTTPS.

2. Run `bundle` from the command line to install all needed gems.

3. Run `rake db:create db:migrate` to set up the PostgresSQL database.

4. Run `rake import_csv:import_all` to seed the database - this will take a few moments.

5. Run `rails s` to start the server, visit `localhost:3000` on the browser, or run the spec harness while the server is up.

6. Enjoy.


