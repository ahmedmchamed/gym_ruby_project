require('time')
require_relative('../db/sql_runner')

class Gymclass
   
    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @start_time = options['start_time']
        @duration = options['duration'].to_i() #in minutes
        @intensity = options['intensity']
        @workout = options['workout']
        @price = options['price'].to_i()
    end

    def save()
        sql = "INSERT into gymclasses
        (start_time, duration, intensity, workout, capacity, price)
        VALUES ($1, $2, $3, $4, $5) RETURNING id;"
        values = [@start_time, @duration, @intensity, @workout, @price]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end
    
end