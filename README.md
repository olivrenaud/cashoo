# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration - OlivR

	gem install rails
	bundle install

	* fix gems coffee-script-source (version issue with Windows)
	add in gemfile :	gem 'coffee-script-source', '1.8.0'
	bundle update coffee-script-source	

	* Install authentication gem Devise (hint from http://guides.railsgirls.com/devise)

	in gemfile add : 		
		gem 'devise'
		gem "hpricot"
		gem "ruby_parser"
	bundle update
	rails generate devise:install 

--> then follow instructions 1. to 4. specified in the command line of the currently running rails server
	
	IMPORTANT for mail sending : in file config/initializer/devise.rb modify line 15 config.mailer_sender  
	
	from file config/locales/devise.en.yml localize gem devise in other language than english

	* Internationalization (config requires server stop and restart)
	gem 'rails-i18n'
	bundle update

* App creation - OlivR

	* create User model related to gem devise 
   	rails generate devise user
   		(or rails generate devise MODEL)

	* create controller and view for user (admin) model
(hint from https://github.com/plataformatec/devise/wiki/How-to-Setup-Multiple-Devise-User-Models)
(see also https://launchschool.com/blog/how-to-use-devise-in-rails-for-authentication)
	
	rails generate devise:controllers users
		(or rails generate devise:views)
	
    rails generate controller game
    rails generate controller events
    rails generate controller userlogs
    rails generate controller userassets

	* created app models
	
	dynamic data:
	rails generate model userstat
    rails generate model userlog
    rails generate model userasset
		created table in schema : 
            userstats (linked n-0 to users, 0-1 jobs)
            userlogs (n-0 userstats, n-0 events)
            userassets (n-n userstats-assets)

	static data:
	rails generate model job
	raisl generate model event
	rails generate model asset	
		created tables in schema : jobs (n-0 userstats), events (0-n userlogs), assets (0-n events)

	Enable routes for devise. Name your route by modifying file route.rb :		
	*Copy this code in route.rb (https://devhints.io/devise)

	# olivR - my routes 
	  root 'home#index'
	  get 'index' => 'home#index'
	  get 'home' => 'home#index' 
	  get 'gamestart' => 'game#start'
	  post 'game' => 'game#create'


	(option) Scope the user view in file config/initializer/devise.rb by uncommenting line 226 and change false to true : # config.scoped_views = false


	* Crypting user password :
	gem bcrypt 3.1.11 requires to fix Window 10 error message : "cannot load such file bcrypt_ext"

	SOLUTION #1 
	in gemfile modify :		gem 'bcrypt', '~> 3.1.7', platforms: :ruby
	gem list bcrypt : returns bcrypt (3.1.11 ruby x86-mingw32) 
	gem uninstall devise && gem uninstall bcrypt - and select option #3
	gem uninstall bcrypt-ruby 
	gem list bcrypt-ruby : returns nothing
	gem install bcrypt --platform=ruby
	bundle install
	rails server

	C:\RailsInstaller\DevKit\devkitvars.bat ???


* Database initialization

	# OlivR - database
    
	to create database from schema.rb (see content below):
		
		rake db:drop:_unsafe	(rake db:drop for non Windows)
		rake db:create 
		rake db:schema:load
		(rails db:environment:set RAILS_ENV=development)
	
	ONLY if db already exists:		
		rake db:migrate

	to populate database
		rake db:seed 

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


* content of schema.rb :


ActiveRecord::Schema.define(version: 20171130120849) do

  create_table "assets", force: :cascade do |t|
    t.integer "number", default: 0, null: false
    t.string "name"
    t.text "extra"
    t.string "category"
    t.string "subcategory"
    t.decimal "value", precision: 3, scale: 2, default: "0.0"
    t.decimal "profitrate", precision: 3, scale: 2, default: "0.0"
    t.decimal "creditrate", precision: 3, scale: 2, default: "0.0"
    t.decimal "feerate", precision: 3, scale: 2, default: "0.0"
    t.decimal "taxrate", precision: 3, scale: 2, default: "0.0"
    t.decimal "TaxOnSellProfitRate", precision: 3, scale: 2, default: "0.0"
    t.index ["number"], name: "index_assets_on_number"
  end

  create_table "events", force: :cascade do |t|
    t.integer "number", default: 0, null: false
    t.string "title"
    t.string "color"
    t.integer "asset_number", default: 0, null: false
    t.decimal "amount", precision: 3, scale: 2, default: "0.0"
    t.decimal "ratio", precision: 3, scale: 2, default: "0.0"
    t.string "assetmove"
    t.text "message"
    t.text "edu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_number"], name: "index_events_on_asset_number"
    t.index ["number"], name: "index_events_on_number"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.decimal "monthsalary", precision: 3, scale: 2, default: "0.0"
    t.index ["title"], name: "index_jobs_on_title"
  end

  create_table "userassets", force: :cascade do |t|
    t.integer "userstat_id", default: 0, null: false
    t.integer "asset_id", default: 0, null: false
    t.integer "asset_number", default: 0, null: false    
    t.decimal "value", precision: 3, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false    
    t.index ["asset_id", "userstat_id"], name: "index_userassets_on_asset_id_and_userstat_id", unique: true
    t.index ["asset_id"], name: "index_userassets_on_asset_id"
    t.index ["asset_number"], name: "index_userassets_on_asset_number"
    t.index ["userstat_id", "asset_id"], name: "index_userassets_on_userstat_id_and_asset_id", unique: true
    t.index ["userstat_id"], name: "index_userassets_on_userstat_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "userstats", force: :cascade do |t|
    t.decimal "available", precision: 3, scale: 2, default: "0.0"
    t.decimal "revenue", precision: 3, scale: 2, default: "0.0"
    t.decimal "wealth", precision: 3, scale: 2, default: "0.0"
    t.integer "user_id", default: 0, null: false
    t.integer "job_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_userstats_on_user_id"
  end

end
