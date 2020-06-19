require_relative "item.rb"

class List

    attr_accessor :label

    def initialize(label)
        @label=label
        @items=[]
    end

    def add_item(title,deadline,description="")
        @items<<Item.new(title,deadline,description)
    end

    def size
        @items.length
    end

    def valid_index?(index)
        (0...self.size).any? {|i| index == i}
    end

    def swap(index_1,index_2)
        return false if !self.valid_index?(index_1) || !self.valid_index?(index_2)
        @items[index_1],@items[index_2]=@items[index_2],@items[index_1]
        true
    end

    def [](index)
        return nil if !self.valid_index?(index)
        @items[index]
    end

    def priority
        self[0]
    end

    def print
        line="-----------------------------------------"
        puts line
        puts self.label
        puts line
        puts "Index".ljust(6) + "Item".ljust(20) + "Deadline".ljust(11) + "Done?".ljust(8)
        puts line
        @items.each_with_index do |item,idx|
            puts "#{idx}".ljust(6) + "#{item.title}".ljust(20) + "#{item.deadline}".ljust(11) + "#{item.done}".ljust(8)
        end
        puts line
    end

    def print_full_item(index)
        return if !self.valid_index?(index)
        line="-----------------------------------------"
        puts line
        puts "#{self[index].title}".ljust(20) + "#{self[index].deadline}".ljust(11) + "#{self[index].done}".ljust(8)
        puts "#{self[index].description}".ljust(33)
        puts line
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount=1)
        return false if !self.valid_index?(index)

        curr_index=index
        amount.times do 
            self.swap(curr_index, curr_index-1) if index != 0
            curr_index-=1
        end
    end

    def down(index, amount=1)
        return false if !self.valid_index?(index)

        curr_index=index
        amount.times do 
            self.swap(curr_index, curr_index+1) if index != self.size-1
            curr_index+=1
        end
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(index)
        self[index].toggle
    end

    def remove_item(index)
        return false if !self.valid_index?(index)

        @items.delete_at(index)
        return true
    end

    # def purge 
    #     done_items=[]

    #     @items.each do |item|
    #         done_items<< item if item.done
    #     end
        
    #     done_items.each { |item| self.remove_item(@items.index(item))}
    # end

    def purge
        @items.reject! { |item| item.done }
    end
end

