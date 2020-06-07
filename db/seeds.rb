require('pry-byebug')
require('time')
require_relative('../models/member')
require_relative('../models/staff')
require_relative('../models/gymclass')
require_relative('../models/classdate')
require_relative('../models/booking')
require_relative('../models/membership')

Booking.delete_all_bookings()
GymClass.delete_all_classes()
Member.delete_all_members()
Staff.delete_all_staff()

member1 = Member.new({
    'first_name' => 'Jimbo',
    'last_name' => 'McNugget',
    'age' => 47
})

member1.save()

staffmember1 = Staff.new({
    'profile_image' => 'staff1.png',
    'first_name' => 'Bawbag',
    'last_name' => 'McNasty',
    'role' => 0
})

staffmember1.save()

gymclass1 = GymClass.new({
    'name' => 'yoga',
    'url' => 'yoga.png',
    'duration' => 45,
    'intensity' => 'medium',
    'workout' => 'cardio',
    'price' => 5
})

gymclass1.save()

gymclass2 = GymClass.new({
    'name' => 'trampolining',
    'url' => 'trampolining.png',
    'duration' => 30,
    'intensity' => 'high',
    'workout' => 'cardio',
    'price' => 5
})

gymclass2.save()

gymclass3 = GymClass.new({
    'name' => 'pilates',
    'url' => 'pilates.png',
    'duration' => 60,
    'intensity' => 'medium',
    'workout' => 'cardio',
    'price' => 5
})

gymclass3.save()

gymclass4 = GymClass.new({
    'name' => 'swimming',
    'url' => 'swimming.png',
    'duration' => 45,
    'intensity' => 'medium',
    'workout' => 'cardio',
    'price' => 5
})

gymclass4.save()

classtime1 = ClassDate.new({
    'year' => 2020, 
    'month' => 11,
    'day' => 3,
    'hour' => 10,
    'minute' => 0,
    'class_id' => gymclass1.id()
})

classtime1.save()

membershiptier1 = Membership.new({
    'type' => 'Premium',
    'status' => true
})

membershiptier1.save()

booking1 = Booking.new({
    'member_id' => member1.id(),
    'staff_id' => staffmember1.id(),
    'capacity' => 10,
    'gymclass_id' => gymclass1.id(),
    'dates_id' => classtime1.id(),
    'membership_id' => membershiptier1.id()
})

booking1.save()

binding.pry

nil