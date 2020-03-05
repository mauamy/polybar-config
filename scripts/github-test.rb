require 'octokit'
require 'pp'

@client = Octokit::Client.new(:access_token => "207526ca761732b8e286847551d32b51eb155a97")

@user = @client.user
@user.login

# Read all Repos
repos = {}
@client.repositories.each do |repo|
  repos[repo.name] = repo.full_name
end

# Get Random Repo Key
randRepoKey = repos.keys.sample

commits = @client.commits(repos[randRepoKey], 'master')
puts randRepoKey + ": " + commits.first.commit.message
