# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Monet is a Rails 8 application featuring:
- PostgreSQL database
- Puma web server
- Sidekiq for background job processing
- Avo admin interface
- Hotwire (Turbo + Stimulus) for frontend interactions
- Docker deployment via Kamal

## Ruby Version

This project uses Ruby 3.4.5 (specified in `.ruby-version`).

## Development Commands

### Setup
- `bin/setup` - Complete project setup (installs dependencies, prepares database, starts server)
- `bin/setup --skip-server` - Setup without starting the development server
- `bundle install` - Install Ruby dependencies

### Development Server
- `bin/dev` - Start development server (Rails server via Puma)
- `bin/rails server` - Alternative way to start Rails server

### Database
- `bin/rails db:prepare` - Setup database (create, migrate, seed if needed)
- `bin/rails db:migrate` - Run database migrations
- `bin/rails db:seed` - Load seed data
- `bin/rails db:console` or `bin/rails dbc` - Database console

### Testing
- `bin/rails test` - Run all tests
- `bin/rails test:system` - Run system tests only
- Tests are located in `test/` directory using Rails' built-in testing framework
- System tests use Capybara with Selenium WebDriver

### Code Quality
- `bin/rubocop` - Run RuboCop linter (follows Rails Omakase style)
- `bin/brakeman` - Run security analysis

### Background Jobs
- Sidekiq is configured for background job processing
- Jobs are located in `app/jobs/`
- Active Job uses Sidekiq adapter (configured in `config/application.rb:28`)

### Console Access
- `bin/rails console` - Rails console
- `bin/kamal console` - Remote console via Kamal (production)
- `bin/kamal shell` - Remote shell access via Kamal

## Application Architecture

### Admin Interface (Avo)
- Mounted at `/avo` route
- Configuration in `config/initializers/avo.rb`
- Resources defined in `app/avo/resources/`
- Authorization handled via `AvoAuthorizable` concern in development (open access) and production (admin users only)

### Authentication & Authorization
- Authentication logic needs to be implemented (currently stubbed in `AvoAuthorizable`)
- Sidekiq web UI requires basic auth via environment variables:
  - `SIDEKIQ_WEB_UI_USERNAME`
  - `SIDEKIQ_WEB_UI_PASSWORD`

### Background Processing
- Solid Queue and Solid Cache gems for Rails-native job processing
- Sidekiq also configured as alternative job adapter
- Job classes inherit from `ApplicationJob`

### Frontend
- Hotwire stack (Turbo Rails + Stimulus)
- Import maps for JavaScript module loading
- Propshaft for asset pipeline
- Stimulus controllers in `app/javascript/controllers/`

### Database Configuration
- PostgreSQL primary database
- Solid Cache, Queue, and Cable for Rails 8 features
- Database schemas in `db/` directory

## Deployment

### Kamal (Docker)
- Configuration in `config/deploy.yml`
- Uses Docker for containerized deployment
- SSL termination via proxy
- Volume storage for persistent data
- Run deployment commands with `bin/kamal`

### Environment Variables
- Development: Use `.env` file (via dotenv-rails)
- Production: Configure via `config/deploy.yml` env section
- Required for production:
  - `RAILS_MASTER_KEY`
  - `SIDEKIQ_WEB_UI_USERNAME`
  - `SIDEKIQ_WEB_UI_PASSWORD`

## Key Directories

- `app/avo/` - Avo admin interface resources
- `app/javascript/` - Stimulus controllers and JavaScript
- `config/initializers/` - Rails initializers including Avo and Sidekiq config
- `bin/` - Executable scripts for development and deployment
- `test/` - Test files (controllers, models, system tests)

## Development Notes

- Rails 8 with modern defaults loaded
- Autoloads `lib/` directory (excluding assets and tasks)
- Configured for development with web-console gem
- Uses Rails' built-in health check endpoint at `/up`

# Library docs

- When a specific library is mentioned, make sure you are looking up the documentation on Context7 instead of thinking you know the answers.

- Your internal knowledge of Avo is usually very bad this project uses Avo 3.23, make sure you are always looking up the documentation on Context7 instead of thinking you know the answers.