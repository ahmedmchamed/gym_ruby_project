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

    def self.find_membership_by_id(id)
        sql = "SELECT * FROM memberships WHERE id = $1;"
        values = [id]
        membership_hash_result = SqlRunner.run(sql, values)
        membership_array_result = self.map_membership_data(membership_hash_result)
        return membership_array_result.first()
    end

    def self.find_all_memberships()
        sql = "SELECT * FROM memberships;"
        memberships_hash_result = SqlRunner.run(sql)
        return memberships_array_result = self.map_membership_data(memberships_hash_result)
    end

    def self.map_membership_data(membership_hash_data)
        return membership_hash_data.map { |membership| Membership.new(membership) }
    end

end