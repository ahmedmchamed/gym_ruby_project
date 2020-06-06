require_relative('./gymclass')
require_relative('../db/sql_runner')

class Staff

    attr_accessor :first_name, :last_name, :role
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @role = options['role']
    end

    def save()
        sql = "INSERT INTO staff
        (first_name, last_name, role) 
        VALUES ($1, $2, $3) RETURNING id;"
        values = [@first_name, @last_name, @role]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

    def staff_classes()
        sql = "SELECT gymclasses.* FROM gymclasses
        INNER JOIN bookings ON bookings.gymclass_id = gymclasses.id
        WHERE bookings.staff_id = $1;"
        values = [@id]
        staff_classes_hash_result = SqlRunner.run(sql, values)
        return GymClass.map_class_data(staff_classes_hash_result)
    end

    def update_staff_member()
        sql = "UPDATE staff SET
        (first_name, last_name, role) = ($1, $2, $3)
        WHERE id = $4;"
        values = [@first_name, @last_name, @role, @id]
        SqlRunner.run(sql, values)
    end

    def self.find_staff_by_id(id)
        sql = "SELECT * FROM staff WHERE id = $1;"
        values = [id]
        staff_hash_result = SqlRunner.run(sql, values)
        staff_array_result = self.map_staff_data(staff_hash_result)
        return staff_array_result.first()
    end

    def self.delete_all_staff()
        sql = "DELETE FROM staff;"
        SqlRunner.run(sql)
    end 

    def self.find_all_staff()
        sql = "SELECT * FROM staff;"
        staff_hash_result = SqlRunner.run(sql)
        return staff_array_result = self.map_staff_data(staff_hash_result)
    end

    def self.map_staff_data(staff_hash_data)
        return staff_hash_data.map { |staff| Staff.new(staff) }
    end

end