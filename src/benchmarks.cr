require "immutable"
require "./immutable/*"

module Benchmarks

class Main
    ELEMENTCOUNT = 10000u32

    def add_element_recursively(remaining) : Immutable::Vector
        if remaining == 0
            Immutable::Vector[0u32]
        else
            add_element_recursively(remaining - 1) << remaining
        end
    end

    def b_enum_array(arr, and_print)
        start_time = Time.now
        arr.each do |head|
            calc = head.not_nil!*2
            puts calc if and_print
        end
        Time.now - start_time
    end

    def b_enum_vector(vec, and_print)
        start_time = Time.now
        head, tail = vec.uncons
        puts head.not_nil!*2 if and_print
        while tail != nil
            calc = head.not_nil!**2
            list = tail.not_nil!
            head, tail = list.uncons
            if head != nil
                calc = head.not_nil!*2
                puts calc if and_print
            end
            #if list != nil
                #list.not_nil!.dump
            #end
        end
        Time.now - start_time
    end

    def run
        # Vector
        test_vector = add_element_recursively ELEMENTCOUNT
        # Array
        test_array = [] of UInt32
        (0u32..ELEMENTCOUNT).each do |i|
            test_array << i
        end

        array_elapsed_1 = b_enum_array test_array, false
        vector_elapsed_1 = b_enum_vector test_vector, false

        array_elapsed_2 = b_enum_array test_array, true
        vector_elapsed_2 = b_enum_vector test_vector, true

        puts "Pure performance: no display"
        puts "Array  enumeration: #{array_elapsed_1}"
        puts "Vector enumeration: #{vector_elapsed_1}"
        puts "Synthetic performance: display"
        puts "Array  enumeration: #{array_elapsed_2}"
        puts "Vector enumeration: #{vector_elapsed_2}"
    end
end

Main.new.run

end
