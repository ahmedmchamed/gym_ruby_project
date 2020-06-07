require('pry')
require('sinatra')
require('sinatra/contrib/all')
# require('sinatra/reloader') if development?
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

get('/about-us') do
    @all_staff = Staff.find_all_staff()
    erb(:about_us)
end

get('/classes') do
    @all_classes = GymClass.find_all_classes()
    erb(:classes)
end

get('/register') do
    erb(:member_register)
end

post('/login') do
    @member_logged_in = Member.member_login(params)
    erb(:member_login_success)
end

post('/register') do
    new_membership = Membership.new(params)
    new_membership.save()
    params['membership_id'] = new_membership.id()
    new_member = Member.new(params).save()
    erb(:member_registration_success)
end
