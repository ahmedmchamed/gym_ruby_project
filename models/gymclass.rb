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

    def self.find_class_by_id(id)
        sql = "SELECT * FROM gymclasses WHERE id = $1;"
        values = [id]
        class_hash_result = SqlRunner.run(sql, values)
        class_array_result = self.map_class_data(class_hash_result)
        return class_array_result.first()
    end

    def self.delete_all_classes()
        sql = "DELETE FROM gymclasses;"
        SqlRunner.run(sql)
    end

    def self.find_all_classes()
        sql = "SELECT * FROM gymclasses;"
        gymclass_hash_result = SqlRunner.run(sql)
        return self.map_class_data(gymclass_hash_result)
    end

    def self.map_class_data(class_hash_data)
        return class_hash_data.map { |gymclass| GymClass.new(gymclass) }
    end
    
end