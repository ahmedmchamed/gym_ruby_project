require('time')
require_relative('../db/sql_runner')

class Gymclass

    attr_accessor :name, :start_time, :duration, :intensity, :workout, :price
    attr_reader :id
   
    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @name = options['name']
        @start_time = options['start_time']
        @duration = options['duration'].to_i() #in minutes
        @intensity = options['intensity']
        @workout = options['workout']
        @price = options['price'].to_i()
    end

    def save()
        sql = "INSERT into gymclasses
        (start_time, duration, intensity, workout, capacity, price)
        VALUES ($1, $2, $3, $4, $5, $6) RETURNING id;"
        values = [@name, @start_time, @duration, @intensity, @workout, @price]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

    def self.start_time(year, month, day, hour, minutes)
        return Time.new(year, month, day, hour, minutes).strftime('%d/%m/%Y %H:%M')
    end
    
end