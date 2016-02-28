require 'pronto'

desc 'codereview'
task :codereview do
  # next unless ENV['PULL_REQUEST_ID']
  # next unless ENV['PULL_REQUEST_ID'].casecmp('false') != 0
  # next unless ENV['GITHUB_ACCESS_TOKEN']

  Pronto.gem_names.each { |gem_name| require "pronto/#{gem_name}" }

  formatter = Pronto::Formatter::GithubPullRequestFormatter.new
  Pronto.run('origin/master', '.', formatter)
end
