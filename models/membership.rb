require_relative('../db/sql_runner')

class Membership

    attr_accessor :type, :status
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @type = options['type']
        @status = options['status']
    end

    def save()
        sql = "INSERT INTO memberships
        (type, status)
        VALUES ($1, $2) RETURNING id;"
        values = [@type, @status]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

    

end