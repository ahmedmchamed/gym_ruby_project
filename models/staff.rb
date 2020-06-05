require_relative('../db/sql_runner')

class Staff

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

    def self.find_all_staff()
        sql = "SELECT * FROM staff;"
        staff_hash_result = SqlRunner.run(sql)
        return staff_array_result = self.map_staff_data(staff_hash_result)
    end

    def self.map_staff_data(staff_hash_data)
        return staff_hash_data.map { |staff| Staff.new(staff) }
    end

end