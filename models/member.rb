require_relative('../db/sql_runner')

class Member

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @age = options['age'].to_i()
    end

    def save()
        sql = "INSERT INTO members
        (first_name, last_name, age)
        VALUES ($1, $2, $3) RETURNING id;"
        values = [@first_name, @last_name, @age]
        @id = SqlRunner.run(sql, values)
    end

end