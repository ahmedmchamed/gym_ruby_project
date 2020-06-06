require_relative('../db/sql_runner')

class Booking

    attr_accessor :member_id, :staff_id, :gymclass_id, :capacity, :membership_id
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @member_id = options['member_id'].to_i()
        @staff_id = options['staff_id'].to_i()
        @capacity = options['capacity'].to_i()
        @gymclass_id = options['gymclass_id'].to_i()
        @dates_id = options['dates_id'].to_i()
        @membership_id = options['membership_id'].to_i()
    end

    def save()
        sql = "INSERT INTO bookings
        (member_id, staff_id, capacity, gymclass_id, dates_id, membership_id)
        VALUES ($1, $2, $3, $4, $5, $6) RETURNING id;"
        values = [@member_id, @staff_id, @capacity, @gymclass_id, @dates_id, @membership_id]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

    def self.find_booking_by_id(id)
        sql = "SELECT * FROM bookings WHERE id = $1;"
        values = [id]
        booking_hash_result = SqlRunner.run(sql, values)
        booking_array_result = self.map_booking_data(booking_hash_result)
        return booking_array_result.first()
    end

    def self.find_all_bookings()
        sql = "SELECT * FROM bookings;"
        bookings_hash_result = SqlRunner.run(sql)
        return bookings_array_result = self.map_booking_data(bookings_hash_result)
    end

    def self.map_booking_data(booking_hash_data)
        return booking_hash_data.map { |booking| Booking.new(booking) }
    end

end