HP Open Print Ruby on Rails Setup - Multi-part Watermarking App!

Supporting Documentation by suresundar1 through topsider.com

1) Note : Complete source code is available at the following git repository…

	https://github.com/sureSundar/mylp1.git

2) https://mylivepaper.herokuapp.com
	login : user@example.com
	password : changeme


Documentation Contents :
1.Challenge Overview
2.Requirements : Traceability Matrix
3.Gems List
4.Completed Functionalities
5.Deployment to Public domain
6.Screenshots


1.Challenge Overview

Welcome to the HP Open Print Ruby on Rails Setup - Multi-part Watermarking App!  HP’s Link Technology API allows for the hyperlinking of printed content through watermarks.  They have developed a scanning technology which can detect these watermarks on printed materials like catalogs, postcards, or business cards, and provide the functionality to navigate to associated digital content on a mobile device. For more information about HP Link Technology you should familiarize yourself with the features, API and the mobile LinkReader scanning app at https://www.linkcreationstudio.com and you can watch a video here.

We’re in the process of designing the user interfaces for this Multipart Watermarking App -- the initial wireframes will be provided for context here -- but in this challenge, the primary goal is to create back-end code that will save data, query and provide updates to the Link Studio REST API, and process images for the Multi-part Watermarking web application.

The requirements for this challenge are the following:

Create a Ruby on Rails project, and deploy to web.   

The indicated model (Diagram:  hp_open_print_multiple_watermarking_entities_v1.jpg.) is shown here. It includes key attributes and relationships.

Create scaffolds for User, Project, Image, Region and Payoff models, including Rspec specs (tests)

MySQL preferred, but SQLite is OK

Use RSpec for testing framework

Ruby version 2 or higher, Rails version 4 or higher

Your web app should:

have basic auth on all pages

have two users seeded in the DB (db/seeds.rb)

A user, that  has logged in, can

create a project

create an image within that project (provided a jpg for upload)

create a region within the image

region requires the information to create a payoff for the region

create a second region that reuses the payoff created above

download a final multi-watermarked jpg

You should implement the following models and actions listed here:

 

 Model

Action

Description

User

login

Authenticates a User

User

index

list Users

 	
show

show User by id

 	
new

show form for User creation

 	
create

create new User

 	
edit

show form for User update

 	
update

update User

 	
delete

delete User by id

Project

index

returns a list of projects related to current User

 	
show

returns a single project related to current User based on Project id

 	
new

show form to enable Project creation

 	
create

creates a new Project

 	
edit

show form to update Project

 	
update

updates a Project

 	
delete

deletes a Project based on id

Image

index

list Images belonging to current Project

 	
show

Image based on Image id.

 	
download

builds final multiple-watermarked image with all regions replaced with the watermarked versions, and streams back the final  jpg. (additional action to scaffold)

 	
new

show form to enable Image creation (upload image capability)

 	
create

creates a new image

 	
edit

show form to edit existing Image

 	
update

updates a image

 	
delete

deletes an project based on project id

Region

index

returns a list of regions related to current image

 	
show

returns a single region based on region id

 	
new

show form to new region creation

 	
create

creates a new region

 	
edit

show form to edit existing region

 	
update

updates a region

 	
delete

deletes an a region based on region id

Payoff

index

returns a list of payoffs related to current project

 	
show

returns a single payoff based on payoff id

 	
new

show form to new payoff creation

 	
create

creates a new payoff

 	
edit

show form to edit existing payoff

 	
update

updates a payoff

 	
delete

deletes an a payoff based on payoff id

Models should support the fields and relationships outlined in the Entity diagram.  Note the entity diagram is a suggestion for the desired implementation, not a blueprint.  We will need to support the functions outlined above (and eventually we’ll create a json-based REST API for this functionality), but you have creative license to propose or suggest alternative function signatures, designs and approaches.  You are strongly encouraged to discuss design proposals via the forums for this challenge so that pros and cons of various approaches can be considered.

Integration with Link API

The following actions will require that certain models interact with the HP Link Studio API’s and you will be expected to implement those interactions here and perform REST API calls using the Link Studio API in addition to persisting local data: (note, the rubygem live_paper may be helpful)

region#create: Region model will need to create the remote resources on the Link API service - Trigger, Payoff and Link.

region#update:  When a user updates a Region in the application that may include updating the payoff (the hyperlink) for their Region, the Region will potentially need to update the appropriate remote Trigger, Payoff and Link resources.

region#delete: delete associated Trigger and Link remote resources.

payoff#create:  Payoff model will create a Link API Payoff remote resource.

payoff#update:  Payoff model will update the remote payoff resource.

payoff#delete: if valid to delete, then delete remote Payoff resource.

image#build: may need to list Regions

You’ll need to obtain a Link Creation Studio account from HP to explore and develop this functionality. Once you have an account and are logged in you will be able to see your Basic Auth token (here) or your client id & client secret (here)

Write tests using RSpec to demonstrate that your code is functional.

Make sure adequate test coverage is achieved (the rubygem simplecov is useful for this)

Some Guidance

Storage of Image sources can be one of:

AWS S3

Google Drive

Dropbox

LPP Storage Service

local folder in rails project

Image manipulation ruby gems:

ImageMagick (RMagick) - railscast

other rubygems you know of, or find...

2.Requirements 

This section will detail out Traceability Metrics,tracking the solution  from requirement to implementation.


3.Gems List
Gems included by the bundle:
  * actionmailer (4.2.1)
  * actionpack (4.2.1)
  * actionview (4.2.1)
  * activejob (4.2.1)
  * activemodel (4.2.1)
  * activerecord (4.2.1)
  * activesupport (4.2.1)
  * addressable (2.3.8)
  * arel (6.0.0)
  * bcrypt (3.1.10)
  * better_errors (2.1.1)
  * binding_of_caller (0.7.2)
  * builder (3.2.2)
  * bundler (1.10.3)
  * byebug (5.0.0)
  * capybara (2.4.4)
  * carrierwave (0.10.0)
  * childprocess (0.5.6)
  * coderay (1.1.0)
  * coffee-rails (4.1.0)
  * coffee-script (2.4.1)
  * coffee-script-source (1.9.1.1)
  * columnize (0.9.0)
  * database_cleaner (1.4.1)
  * debug_inspector (0.0.2)
  * delayed_job (4.0.6)
  * delayed_job_active_record (4.0.3)
  * devise (3.5.1)
  * diff-lcs (1.2.5)
  * domain_name (0.5.24)
  * erubis (2.7.0)
  * execjs (2.5.2)
  * factory_girl (4.5.0)
  * factory_girl_rails (4.5.0)
  * faker (1.4.3)
  * ffi (1.9.8)
  * foundation-rails (5.5.2.1)
  * globalid (0.3.5)
  * http-cookie (1.0.2)
  * hub (1.12.4)
  * i18n (0.7.0)
  * jbuilder (2.3.0)
  * jquery-rails (4.0.3)
  * json (1.8.3)
  * launchy (2.4.3)
  * live_paper (0.0.24)
  * loofah (2.0.2)
  * mail (2.6.3)
  * mime-types (2.6.1)
  * mini_portile (0.6.2)
  * minitest (5.7.0)
  * multi_json (1.11.1)
  * netrc (0.10.3)
  * nokogiri (1.6.6.2)
  * orm_adapter (0.5.0)
  * progress_job (0.0.4)
  * quiet_assets (1.1.0)
  * rack (1.6.1)
  * rack-test (0.6.3)
  * rails (4.2.1)
  * rails-deprecated_sanitizer (1.0.3)
  * rails-dom-testing (1.0.6)
  * rails-html-sanitizer (1.0.2)
  * rails_layout (1.0.26)
  * railties (4.2.1)
  * rake (10.4.2)
  * responders (2.1.0)
  * rest-client (1.8.0)
  * rmagick (2.15.2)
  * rspec-core (3.3.0)
  * rspec-expectations (3.3.0)
  * rspec-mocks (3.3.0)
  * rspec-rails (3.3.1)
  * rspec-support (3.3.0)
  * rubyzip (1.1.7)
  * sass (3.4.14)
  * sass-rails (5.0.3)
  * selenium-webdriver (2.46.2)
  * simple_form (3.1.0)
  * spring (1.3.6)
  * spring-commands-rspec (1.0.4)
  * sprockets (3.2.0)
  * sprockets-rails (2.3.1)
  * sqlite3 (1.3.10)
  * thor (0.19.1)
  * thread_safe (0.3.5)
  * tilt (1.4.1)
  * turbolinks (2.5.3)
  * tzinfo (1.2.2)
  * uglifier (2.7.1)
  * unf (0.1.4)
  * unf_ext (0.0.7.1)
  * warden (1.2.3)
  * web-console (2.1.2)
  * websocket (1.2.2)
  * xpath (2.0.0)

4.Completed Functionalities

a.Storage has been achieved locally using carrier wave gem,which can be extended to fog
b.All functionality(esp.multi watermak images) have been tested with mobile LinkReader app
c.Front end has been achieved with Zurb Foundation Framework
d.Form authentication has been achieved with Devise
e.Basic Authentication also has been achieved with Devise at the application controller level.So either of these 2 auth will allow access.
	1.Basic authentication has been achieved with client_id and client_secret.Right now it is hard wired to my creds(suresundar) which can be easily extended to link with Link API
	2.Form authentication can be enabled for internal users.
f.Model wise navigation is not implemented considering the time constraint which can be implemented easily.
	ie : User —> Project —> Images —> Region vs PayOff with the help of session is yet to implemented.
	whereas Navigation can be easily achieved with association and menus.
5.Deployment to Public Domain.
Publicly hosted on heroku : https://mylivepaper.herokuapp.com
	Note : After that significant changes have been made which is yet to be deployed.
6.Screenshots for Reference

6.1 Successfully created MultiWatermark image through application…
