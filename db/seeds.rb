require('pry-byebug')
require('time')
require_relative('../models/member')
require_relative('../models/staff')
require_relative('../models/gymclass')
require_relative('../models/date')

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
    'duration' => 45,
    'intensity' => 'medium',
    'workout' => 'cardio',
    'price' => 5
})

classtime1 = ClassDate.new({
    'year' => 2020, 
    'month' => 11,
    'day' => 3,
    'hour' => 10,
    'minute' => 0,
    'class_id' => gymclass1.id()
})

binding.pry

nil