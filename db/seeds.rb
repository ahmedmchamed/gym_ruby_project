require('pry-byebug')
require_relative('../models/member')

Member.delete_all()

member1 = Member.new({
    'first_name' => 'Jimbo',
    'last_name' => 'McNugget',
    'age' => 47
})

member1.save()

binding.pry

nil