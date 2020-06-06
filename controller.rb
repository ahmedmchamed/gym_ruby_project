require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/booking')
require_relative('./models/classdate')
require_relative('./models/gymclass')
require_relative('./models/member')
require_relative('./models/membership')
require_relative('./models/staff')

also_reload('./models/*')

set :environment, :production

get('/') do
    erb(:main)
end

get('/superhappyfungym') do
    erb(:index)
end
