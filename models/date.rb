require('time')
require_relative('../db/sql_runner')

class ClassDate

    attr_accessor :time
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @time = Time.new(
            options['year'].to_int(),
            options['month'].to_int(),
            options['day'].to_int(),
            options['hour'].to_int(),
            options['minute'].to_int()
        )
    end

    def save()
        sql = "INSERT INTO dates
        (time)
        VALUES ($1) RETURNING id;"
        values = [@time]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

end