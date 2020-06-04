class Membership

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @type = options['type']
        @status = options['status']
    end

end