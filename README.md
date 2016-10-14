# RunnableDemo Sample Ruby on Rails application

## Running locally

1. `git clone git@github.com:RunnableDemo/rails-app.git`
2. `bundle install`
3. `bundle exec rackup`

## Running on Runnable.io

This guide will help you setup Runnable templates for a simple Rails application. This guide will assume that you don't have a Dockerfile and want Runnable to generate the Dockerfile for you using a simple setup guide.

### Configuring your first Rails app 

* From the *Configure* page, click on the *Create Template* button. Choose the Rails repository you want to add.<br />
* Select _Start up with our setup guide_ as your configuration mode.<br />
* Name your template.<br />
* Now you can select your *Stack Type*. This is the environment that your repository requires for runtime. In our case, it is *Rails*. Also, make sure to select a compatible *Ruby* version.<br />
* After clicking *Next*, you will be presented with the following three options: *Packages*, *Build Commands*, and *Container CMD*.<br />

#### Packages 

This option allows you to install any tools, libraries, or frameworks you need. Add multiple packages by separating them with spaces. You can specify packages that are listed in the [Ubuntu Aptitude library](http://packages.ubuntu.com/).  

#### Build Commands

Use this option to specify any commands needed to build and prepare your app (supports UNIX bash format). These commands will run in the root folder of the repository after every push. This is also the perfect place to run any commands to build any assets (such as css, html and minified javascript code). 

For our simple API repository, this is where we’ll specify:<br />
`bundle install`

>Build commands cannot connect to any other container during a build. It is therefore not recommended to seed databases or communicate with another container using the Build Commands.

#### Container CMD 

Here the main run command for your app is specified. Important: the container will stop running when this command exits. For our simple Rails app, we will specify:<br />
`rails server -b 0.0.0.0`

>Note that we are using 0.0.0.0 to bind to all interfaces. This will allow us to access the container from other containers and through the browser."

__Container CMD__ is where the invocation command for our app is specified. _Important:_ the container will stop running when this command exits.

>This would also be a good place to add your migration commands after connecting your database. Your container cmd would look something similar to "rake db:migrate && rails server -b 0.0.0.0"

Click __Next__. Additional configuration options are revealed to customize your container further:

#### Environment Variables

Add any required Environtment Variables your app may need. These values will be inserted into a container's environment when it launches from the template. The the syntax for entering in Environment variables is `KEY=VAL`<br />

>For example: if you are trying to set the "RAILS_ENV" to "staging", you would input "RAILS_ENV=staging".

#### Files & SSH Keys

Use this tool to add any addtional configuration files, other GitHub repositories, SSH Keys or assets your repository needs to build and run properly. This is also the option to use if you have to upload any override files to overwrite any hard coded values in your repository.

For more details, Check Out:

1. [Adding Files to your Container](https://support.runnable.com/hc/en-us/articles/208221743)
2. [Adding SSH Keys to build private modules](https://support.runnable.com/hc/en-us/articles/208018586-My-build-is-failing-because-of-No-Such-Key-or-Host-key-verification-failed-What-do-I-do-)

#### Exposed Ports

Open up any ports your repository may need. 

Most Rails apps run on 3000 when developing, so we'll click on the *Exposed Ports* tool and expose it.  

1. Once you are happy with Save & Build to save our changes and trigger your first build. 
2. You will be automatically transitioned to the Logs tab of your configuration. Here you will be able to access:

#### Build Logs

These logs correspond to all the output from the build process of your template. Any errors here will correspond to configuration options you have specified in your repository, Build Commands, Packages and Files & SSH keys. 

#### CMD Logs 

These logs correspond to all the output from the run process of a container launched from your template. Any errors here will correspond to configuration options you have specified in your CMD Command or Environment Variables. 

> Your repository can crash for several reasons outside of your configuration on Runnable. There could be several factors ranging from a bug in your code or a misconfigured connection. 

#### Terminal

This is a terminal session into a container launched from your template. This is useful to verify any configuration details you may want to confirm.

#### URL

This is the Environment URL corresponding to the container launched from the default branch. Check [this](https://support.runnable.com/hc/en-us/articles/212802006-Runnable-URLs) article out for more about Runnable URLs.

* *Save &amp; Build* to save our changes and trigger your first build. 
* When you’re ready, click *Done* to see a summary of your new container.  
* If everything went well, your build will complete successfully. Anytime you run across an error that you need help with, we have developers ready to help in real-time. Click on the chat bubble on the bottom left!  

Head on over to our [Branches](https://support.runnable.com/hc/en-us/sections/202755686-Branches) section to see how to launch branches from your templates.
