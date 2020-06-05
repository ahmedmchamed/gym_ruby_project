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

end