class Item

    attr_accessor :title, :description
    attr_reader :deadline, :done

    def self.valid_date?(date_string)
        date_arr=date_string.split("-")
        year,month,day=date_arr
        return false if year.length!=4
        return false if month.length!=2 || month.to_i>12
        return false if day.length!=2 || day.to_i>31
        true
    end

    def initialize(title, deadline, description)
        if !Item.valid_date?(deadline)
            raise 'deadline is not valid'
        end

        @title, @deadline, @description = title, deadline, description
        @done=false
    end

    def deadline=(new_deadline)
        if !Item.valid_date?(new_deadline)
            raise 'deadline is not valid'
        end
        @deadline = new_deadline
    end

    def toggle
        if self.done
            @done=false
        else
            @done=true
        end
    end
end

