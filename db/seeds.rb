require('pry-byebug')
require_relative('../models/member')
require_relative('../models/staff')

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

binding.pry

nil