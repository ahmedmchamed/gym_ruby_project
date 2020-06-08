require('time')
require('pry')
require_relative('../db/sql_runner')

class ClassDate

    attr_accessor :time
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @time = Time.new(
            options['year'].to_i(),
            options['month'].to_i(),
            options['day'].to_i(),
            options['hour'].to_i(),
            options['minute'].to_i()
        )
    end

    def save()
        sql = "INSERT INTO dates
        (time)
        VALUES ($1) RETURNING id;"
        values = [@time]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

    def update_class_time()
        sql = "UPDATE dates SET time = $1 where id = $2;"
        values = [@time, @id]
        SqlRunner.run(sql, values)
    end

    def self.find_class_time_by_id(id)
        sql = "SELECT * FROM dates WHERE id = $1;"
        values = [id]
        time_hash_result = SqlRunner.run(sql, values)
        time_array_result = self.map_time_data(time_hash_result)
        return Time.parse(time_array_result.first()['time']).strftime("%H:%M on " "%A %d of " "%B %Y")
    end

    def self.map_time_data(time_hash_data)
        return time_hash_data.map { |time| time }
    end

end