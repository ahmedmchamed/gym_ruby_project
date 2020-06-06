require('time')
require_relative('../db/sql_runner')

class ClassDate

    attr_accessor :time
    attr_reader :id, :class_id

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @time = Time.new(
            options['year'].to_int(),
            options['month'].to_int(),
            options['day'].to_int(),
            options['hour'].to_int(),
            options['minute'].to_int()
        )
        @class_id = options['class_id'].to_i()
    end

    def save()
        sql = "INSERT INTO dates
        (time, class_id)
        VALUES ($1, $2) RETURNING id;"
        values = [@time, @class_id]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

end