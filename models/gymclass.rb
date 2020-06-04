class Gymclass
   
    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @start_time = options['start_time']
        @duration = options['duration'].to_i() #in minutes
        @intensity = options['intensity']
        @workout = options['workout']
        @capacity = options['capacity'].to_i()
        @price = options['price'].to_i()
    end
    
end