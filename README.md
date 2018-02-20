# README
# Blocipedia

Blocipedia is Rails based, multi-contributor wiki application. Users must create an account in order to edit public wiki content (as per the default permission settings). Each account must be authenticated by an email sent to the email address that the user used for the sign-up process. In addition to public wikis, Blocipedia offers users premium membership, which allows for the creation of private wikis. The private wiki's owner controls who may edit and access their wiki. 

## Getting Started

These instructions will help you set up Blocipedia on your local machine for development and testing purposes. 

### Prerequisites

Blocipedia is mostly self contained, but you will need to create and configure a config/application.yml file for email authentications and premium membership upgrades. There is an example file under config/application.example.yml, so all you have to do is copy and past the data headers into your config/application.yml file and fill in the values based on the instructions below.

STRIPE_SECRET_KEY & STRIPE_PUBLISHABLE_KEY are both found after you sign up for an account at https://stripe.com/. When you finish signing up, the API keys are listed under the API menu header in your dashboard.

MAIL_HOST, SENDMAIL_USERNAME, SENDMAIL_PASSWORD are the hostname, email username, and email password you want to use to send email authentications through Devise.

### Installing

After you set up your config/application.yml file and pull Blocipedia from GitHub, you will need to run a `bundle install`. There is a seed file already built out if you want to prepopulate the database. Run a rails server to start the application on your local host!

## Built With

* [Rails5](http://rubyonrails.org/) - Ruby Framework
* [Devise](https://github.com/plataformatec/devise) - User Authentication Gem
* [Stripe](https://stripe.com/) - Online Payment Management

## Authors

* **Brandan Hummell** Full Stack Developer & Application Designer- [GitHub](https://github.com/Brandan-Hummell)

See also the list of [contributors](https://github.com/Brandan-Hummell/blocipedia/graphs/contributors) who participated in this project.

## Acknowledgments

* [Bloc](https://github.com/Bloc/) - Helped develop user stories & application goals

