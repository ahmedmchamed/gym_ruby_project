require_relative('../db/sql_runner')

class Booking

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @member_id = options['member_id'].to_i()
        @staff_id = options['staff_id'].to_i()
        @gymclass_id = options['gymclass_id'].to_i()
        capacity = options['capacity'].to_i()
        @membership_id = options['membership_id'].to_i()
    end

end