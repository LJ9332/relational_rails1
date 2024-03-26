# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

f1_teams {
	id int pk
	name string
	horsepower integer
	slick_tires boolean
	created_at datetime
	updated_at datetime
}

f1_drivers {
	id integer
	f1_team_id int > f1_teams.id
	name string
	weight integer
	world_champion boolean
	created_at datetime
	updated_at datetime
}
