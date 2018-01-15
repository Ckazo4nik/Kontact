every 1.minutes do
  rake 'ts:rebuild'
end

App 23736 stdout: [a1dd130b-ba48-4ce4-b0da-339b3f3abab0] Started PUT "/api/v1/update_profile" for 178.212.101.167 at 2018-01-15 11:42:03 +0000
App 23736 stdout: [a1dd130b-ba48-4ce4-b0da-339b3f3abab0] Processing by Api::V1::UsersController#update as HTML
App 23736 stdout: [a1dd130b-ba48-4ce4-b0da-339b3f3abab0]   Parameters: {"email"=>"avevanja@gmail.com", "name"=>"Ivan Shvets", "phone"=>"воововово", "user"=>{"name"=>"Ivan Shvets", "email"=>"avevanja@gmail.com", "phone"=>"воововово"}}
App 23736 stdout: [a1dd130b-ba48-4ce4-b0da-339b3f3abab0]   User Load (0.5ms)  SELECT  "users".* FROM "users" WHERE "users"."token" = $1 LIMIT $2  [["token", "2913d1999b20b0055317113a4f95baa4"], ["LIMIT", 1]]
App 23736 stdout: [a1dd130b-ba48-4ce4-b0da-339b3f3abab0] Completed 500 Internal Server Error in 4ms (ActiveRecord: 0.5ms)
App 23736 stdout: [a1dd130b-ba48-4ce4-b0da-339b3f3abab0]
App 23736 stdout: [a1dd130b-ba48-4ce4-b0da-339b3f3abab0] NoMethodError (undefined method `id' for nil:NilClass):
App 23736 stdout: [a1dd130b-ba48-4ce4-b0da-339b3f3abab0]
App 23736 stdout: [a1dd130b-ba48-4ce4-b0da-339b3f3abab0] app/controllers/api/v1/users_controller.rb:14:in `update'
