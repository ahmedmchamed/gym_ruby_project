require_relative('../db/sql_runner')

class Membership

    attr_accessor :type, :status
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @type = options['type']
        @status = options['status']
    end

end