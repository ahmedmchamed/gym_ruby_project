require_relative('../db/sql_runner')

class Member

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @age = options['age'].to_i()
    end

    def save()
        sql = "INSERT INTO members
        (first_name, last_name, age)
        VALUES ($1, $2, $3) RETURNING id;"
        values = [@first_name, @last_name, @age]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

    def self.find_member_by_id(id)
        sql = "SELECT * FROM members WHERE id = $1;"
        values = [id]
        member_hash_result = SqlRunner.run(sql, values)
        member_array_result = self.map_member_data(member_hash_result)
        return member_array_result.first()
    end

    def self.delete_all_members()
        sql = "DELETE FROM members;"
        SqlRunner.run(sql)
    end

    def self.find_all_members()
        sql = "SELECT * FROM members;"
        members_hash_result = SqlRunner.run(sql)
        return member_array_result = self.map_member_data(members_hash_result)
    end

    def self.map_member_data(member_hash_data)
        return member_hash_data.map { |member| Member.new(member) }
    end

end