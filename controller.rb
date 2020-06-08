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

get('/book/:id') do
    @gymclass = GymClass.find_class_by_id(params[:id].to_i())
    @staff_for_class = @gymclass.staff_registered()
    erb(:book_class)
end

get('/register') do
    erb(:member_register)
end

get('/edit/:id') do
    @find_member = Member.find_member_by_id(params[:id].to_i())
    @find_membership_details = Membership.find_membership_by_id(@find_member.membership_id())
    erb(:edit)
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

post('/edit/:id/:membership_id') do
    member = Member.new(params)
    member.update_member()
end

post('/book/:gymclass_id/:staff_id') do
    member_login = Member.member_login(params)
    staff_member = Staff.find_staff_by_id(params[:staff_id])

    params['year'] = params['date'][0..3]
    params['month'] = params['date'][5..6]
    params['day'] = params['date'][8..9]
    new_date = ClassDate.new(params)
    new_date.save()
    params['member_id'] = member_login['member_details'].id()
    params['membership_id'] = member_login['membership_details'].id()
    params['dates_id'] = new_date.id()
    params['capacity'] = 9 #NOTE:this needs to be removed
    new_booking = Booking.new(params)
    new_booking.save()
end
