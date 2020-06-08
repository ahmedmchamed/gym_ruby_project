require_relative('./member')
require_relative('./staff')
require_relative('./booking')
require_relative('./classdate')
require_relative('../db/sql_runner')

class GymClass

    attr_accessor :name, :url, :duration, :intensity, :workout, :price
    attr_reader :id
   
    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @url = options['url']
        @name = options['name']
        @duration = options['duration'].to_i() #in minutes
        @intensity = options['intensity']
        @workout = options['workout']
        @price = options['price'].to_i()
    end

    def save()
        sql = "INSERT into gymclasses
        (name, url, duration, intensity, workout, price)
        VALUES ($1, $2, $3, $4, $5, $6) RETURNING id;"
        values = [@name, @url, @duration, @intensity, @workout, @price]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

    def find_gymclass_date()
        sql = "SELECT bookings.* FROM bookings
        WHERE bookings.gymclass_id = $1;"
        values = [@id]
        booking_hash_result = SqlRunner.run(sql, values)
        booking_array_result = Booking.map_booking_data(booking_hash_result)
        date_id = booking_array_result.first().dates_id()
        return ClassDate.find_class_time_by_id(date_id)
    end

    def find_capacity()
        sql = "SELECT bookings.* FROM bookings
        WHERE bookings.gymclass_id = $1;"
        values = [@id]
        booking_hash_result = SqlRunner.run(sql, values)
        booking_array_result = Booking.map_booking_data(booking_hash_result)
        return booking_array_result.first().capacity
    end

    def members_registered()
        sql = "SELECT members.* FROM members
        INNER JOIN bookings ON bookings.member_id = members.id
        WHERE bookings.gymclass_id = $1;"
        values = [@id]
        members_hash_result = SqlRunner.run(sql, values)
        return members_array_result = Member.map_member_data(members_hash_result)
    end

    def staff_registered()
        sql = "SELECT staff.* FROM staff
        INNER JOIN bookings ON bookings.staff_id = staff.id
        WHERE bookings.gymclass_id = $1;"
        values = [@id]
        staff_hash_result = SqlRunner.run(sql, values)
        staff_array_result = Staff.map_staff_data(staff_hash_result)
        return staff_array_result.first()
    end

    def update_class()
        sql = "UPDATE gymclasses SET
        (name, url, duration, intensity, workout, price) = ($1, $2, $3, $4, $5, $6)
        WHERE id = $7"
        values = [@name, @url, @duration, @intensity, @workout, @price, @id]
        SqlRunner.run(sql, values)
    end

    def self.find_class_by_id(id)
        sql = "SELECT * FROM gymclasses WHERE id = $1;"
        values = [id]
        class_hash_result = SqlRunner.run(sql, values)
        class_array_result = self.map_class_data(class_hash_result)
        return class_array_result.first()
    end

    def self.delete_all_classes()
        sql = "DELETE FROM gymclasses;"
        SqlRunner.run(sql)
    end

    def self.find_all_classes()
        sql = "SELECT * FROM gymclasses;"
        gymclass_hash_result = SqlRunner.run(sql)
        return self.map_class_data(gymclass_hash_result)
    end

    def self.map_class_data(class_hash_data)
        return class_hash_data.map { |gymclass| GymClass.new(gymclass) }
    end
    
end