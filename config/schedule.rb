set :output, "#{path}/log/cron_log.log"
every 1.minutes do
  rake "ts:index"
end

