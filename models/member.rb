require_relative('./membership')
require_relative('./gymclass')
require_relative('../db/sql_runner')

class Member

    attr_accessor :first_name, :last_name, :age
    attr_reader :id

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

    def member_classes()
        sql = "SELECT gymclasses.* FROM gymclasses
        INNER JOIN bookings ON bookings.gymclass_id = gymclasses.id
        WHERE bookings.member_id = $1;"
        values = [@id]
        member_classes_hash_result = SqlRunner.run(sql, values)
        return GymClass.map_class_data(member_classes_hash_result)
    end

    def membership_information()
        sql = "SELECT memberships.* FROM memberships
        INNER JOIN bookings ON bookings.membership_id = memberships.id
        WHERE bookings.member_id = $1;"
        values = [@id]
        member_membership_hash_result = SqlRunner.run(sql, values)
        return Membership.map_membership_data(member_membership_hash_result)
    end

    def update_member()
        sql = "UPDATE members SET
        (first_name, last_name, age) = ($1, $2, $3)
        WHERE id = $4"
        values = [@first_name, @last_name, @age, @id]
        SqlRunner.run(sql, values)
    end

    def self.member_login(parameters)
        member_hash = Hash.new(0)
        sql_login = "SELECT * FROM members WHERE first_name IN ($1)
        AND last_name IN ($2) AND age in ($3);"
        values_login = [parameters['first_name'], parameters['last_name'], parameters['age']]
        member_login_hash_result = SqlRunner.run(sql_login, values_login)
        member_login_array_result = self.map_member_data(member_login_hash_result)
        member_object = member_login_array_result.first()
        membership_info = member_object.membership_information()
        return member_hash = {
            'member_details' => member_object,
            'membership_details' => membership_info
        }
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