require('time')
require_relative('../db/sql_runner')

class GymClass

    attr_accessor :name, :duration, :intensity, :workout, :price
    attr_reader :id
   
    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @name = options['name']
        @duration = options['duration'].to_i() #in minutes
        @intensity = options['intensity']
        @workout = options['workout']
        @price = options['price'].to_i()
    end

    def save()
        sql = "INSERT into gymclasses
        (name, duration, intensity, workout, price)
        VALUES ($1, $2, $3, $4, $5) RETURNING id;"
        values = [@name, @duration, @intensity, @workout, @price]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

    def self.map_class_data(class_hash_data)
        return class_hash_data.map { |gymclass| GymClass.new(gymclass) }
    end
    
end