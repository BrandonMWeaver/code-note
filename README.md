# README

Code-Note is a rails web application which allows users to share notes related to software development

## Ruby version
	2.6.5p114 (2019-10-01 revision 67812) [x64-mingw32]

## System dependencies
	Node.js
	Yarn
	PostgreSQL 12

## Database creation
	execute: $ rake db:create

## Database initialization
	execute: $ rake db:migrate

## Deployment instructions
	execute: $ rails s
	visit: localhost:3000/

## Additional information
	To use the applications OAuth service:
		Create a new OAuth app on GitHub
		Create a .env file in the primary directory of the application
		Set GITHUB_KEY=your_key
		Set GITHUB_SECRET=your_secret
