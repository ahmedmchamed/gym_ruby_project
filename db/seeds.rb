require('pry-byebug')
require('time')
require_relative('../models/member')
require_relative('../models/staff')
require_relative('../models/gymclass')

Member.delete_all_members()
Staff.delete_all_staff()

member1 = Member.new({
    'first_name' => 'Jimbo',
    'last_name' => 'McNugget',
    'age' => 47
})

member1.save()

staffmember1 = Staff.new({
    'first_name' => 'Bawbag',
    'last_name' => 'McNasty',
    'role' => 0
})

staffmember1.save()

gymclass1 = Gymclass.new({
    'name' => 'yoga',
    'start_time' => Gymclass.start_time(2020, 6, 15, 10, 0),
    'duration' => 45,
    'intensity' => 'medium',
    'workout' => 'cardio',
    'price' => 5
})

binding.pry

nil