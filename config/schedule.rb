set :output, "log/cron_log.log"
every 1.minutes do
  command 'bundle exec rails ts:rebuild RAILS_ENV=production'
end
#
