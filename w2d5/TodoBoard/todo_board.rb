require_relative "list.rb"
require_relative "item.rb"

class TodoBoard

    def initialize
        @list = {}
    end

    def get_command
        puts "Enter a command:"
        cmd, *args = gets.chomp.split(" ")
        
        case cmd
        when 'mklist'
            @list[*args]=List.new(*args)
        when 'ls' 
            @list.each_key { |key| puts key }
        when 'showall'
            @list.each_value { |value| puts value }
        when 'mktodo'
            list_label=args.shift
            @list[list_label].add_item(*args)
        when 'up'
            list_label=args.shift
            args = args.map(&:to_i)
            @list[list_label].up(*args)
        when 'down'
            list_label=args.shift
            args = args.map(&:to_i)
            @list[list_label].down(*args)
        when 'swap'
            list_label=args.shift
            args = args.map(&:to_i)
            @list[list_label].swap(*args)
        when 'sort'
            @list[*args].sort_by_date!
        when 'priority'
            @list[*args].print_priority
        when 'print'
            list_label=args.shift
            if args.empty?
                @list[list_label].print
            else
                args = args.map(&:to_i)
                @list[list_label].print_full_item(*args)
            end
        when 'toggle'
            list_label=args.shift
            args = args.map(&:to_i)
            @list[list_label].toggle_item(*args)
        when 'quit'
            return false
        when 'rm'
            list_label=args.shift
            args = args.map(&:to_i)
            @list[list_label].remove_item(*args)
        when "purge"
            @list[*args].purge
        else
            puts "Sorry, that command is not recognized."
        end
        true
    end

    def run
        flag = true
        while flag
            flag = self.get_command # returns either true or false
        end
    end


end

board=TodoBoard.new
board.run

# import 'todo_board.rb'
# my_board = TodoBoard.new
# my_board.run
# mktodo ruby 2019-12-04
# mktodo sql 2019-12-20
# mktodo rails 2020-01-06
# mktodo javascript 2020-01-08
# mktodo react 2020-02-08
# mktodo redux 2020-02-15
# print

# brd=TodoBoard.new("TODO")
# brd.run

# mktodo cheese 2019-10-25 foooooood
# mktodo toothpaste 2019-10-23
# mktodo candy 2019-10-31 sugar-free
# mktodo shampoo 2019-10-25
# # # # print
# # # sort
# print
# swap 0 3
# print
# print 1
# priority
# down 0
# print
# up 3 2
# print

