require 'sinatra'
require 'haml'

# Listen on all interfaces
set :bind, '0.0.0.0'
set :port, '9292'

before do
  # Get information from local repository
  @gitInfo = {
    :name => `git rev-parse --abbrev-ref HEAD`.delete!("\n"),
    :sHA => `git rev-parse HEAD`.delete!("\n"),
    :shortSHA => `git rev-parse --short HEAD`.delete!("\n"),
    :lastCommitTime => `git 'log' --format="%ai" -n1 HEAD`.delete!("\n"),
    :lastCommitMessage => `git log --format="%B" -n1 HEAD`.delete!("\n"),
    :lastCommitAuthor => `git log --format="%aN" -n1 HEAD`.delete!("\n"),
    :remoteOriginUrl => `git config --get-all remote.origin.url`.delete!("\n")
  }
end 

get '/' do
  # Serve & Interpret index.haml with github information
  haml :index, :locals => @gitInfo
end
