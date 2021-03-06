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

# membershiptier1 = Membership.new({
#     'type' => 'Premium',
#     'status' => 'Active'
# })

# membershiptier1.save()

# member1 = Member.new({
#     'first_name' => 'Jimbo',
#     'last_name' => 'McNugget',
#     'age' => 47,
#     'membership_id' => membershiptier1.id()
# })

# member1.save()

staffmember1 = Staff.new({
    'profile_image' => 'elspeth.jpg',
    'first_name' => 'Elspeth',
    'last_name' => 'Richardson',
    'role' => 0
})

staffmember1.save()

staffmember2 = Staff.new({
    'profile_image' => 'jake.jpg',
    'first_name' => 'Jake',
    'last_name' => 'Sparrow',
    'role' => 0
})

staffmember2.save()

staffmember3 = Staff.new({
    'profile_image' => 'nadine.jpg',
    'first_name' => 'Nadine',
    'last_name' => 'Hassanein',
    'role' => 0
})

staffmember3.save()

staffmember4 = Staff.new({
    'profile_image' => 'zack.jpg',
    'first_name' => 'Zack',
    'last_name' => 'McJack',
    'role' => 0
})

staffmember4.save()

gymclass1 = GymClass.new({
    'name' => 'yoga',
    'url' => 'yoga.png',
    'duration' => 45,
    'capacity' => 10,
    'intensity' => 'medium',
    'workout' => 'cardio',
    'price' => 5
})

gymclass1.save()

gymclass2 = GymClass.new({
    'name' => 'trampolining',
    'url' => 'trampolining.png',
    'duration' => 30,
    'capacity' => 10,
    'intensity' => 'high',
    'workout' => 'cardio',
    'price' => 5
})

gymclass2.save()

gymclass3 = GymClass.new({
    'name' => 'pilates',
    'url' => 'pilates.png',
    'duration' => 60,
    'capacity' => 10,
    'intensity' => 'medium',
    'workout' => 'cardio',
    'price' => 5
})

gymclass3.save()

gymclass4 = GymClass.new({
    'name' => 'swimming',
    'url' => 'swimming.png',
    'duration' => 45,
    'capacity' => 10,
    'intensity' => 'medium',
    'workout' => 'cardio',
    'price' => 5
})

gymclass4.save()

# classtime1 = ClassDate.new({
#     'year' => 2020, 
#     'month' => 11,
#     'day' => 3,
#     'hour' => 10
# })

# classtime1.save()

# booking1 = Booking.new({
#     'member_id' => member1.id(),
#     'staff_id' => staffmember1.id(),
#     'gymclass_id' => gymclass1.id(),
#     'dates_id' => classtime1.id(),
#     'membership_id' => membershiptier1.id()
# })

# booking1.save()

# booking2 = Booking.new({
#     'member_id' => member1.id(),
#     'staff_id' => staffmember1.id(),
#     'gymclass_id' => gymclass2.id(),
#     'dates_id' => classtime1.id(),
#     'membership_id' => membershiptier1.id()
# })

# booking2.save()

# booking3 = Booking.new({
#     'member_id' => member1.id(),
#     'staff_id' => staffmember1.id(),
#     'gymclass_id' => gymclass3.id(),
#     'dates_id' => classtime1.id(),
#     'membership_id' => membershiptier1.id()
# })

# booking3.save()

# booking4 = Booking.new({
#     'member_id' => member1.id(),
#     'staff_id' => staffmember1.id(),
#     'gymclass_id' => gymclass4.id(),
#     'dates_id' => classtime1.id(),
#     'membership_id' => membershiptier1.id()
# })

# booking4.save()

binding.pry

nil