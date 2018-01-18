desc 'Update percent column for flights (last 24 hours)'
task sphinx_update: :environment do
  'ts:index'
end