require 'rubygems'
require 'json'
module Login
    module_function

    def initial (studlist_arr, selected_option)
        command = selected_option
        if command == "s"
            self.match_student_id_in_studentlist (studlist_arr)
        elsif command == "t"
            Teacher.run
        elsif command == ''
            SignIn.quit
        else
            system("clear")
            puts "invalid selection, returning to the main menu."
            SignIn.begin (studlist_arr)
        end
    end

    def match_student_id_in_studentlist (studlist_arr)
        puts "Please enter your student ID"
        studid_str = gets.chomp.upcase
        found = false
        studlist_arr.each do |student_hash|
            # puts student_hash.inspect
            # puts studid_str.inspect
            if student_hash[:student_ID] == studid_str then
                found = true
                break
            end 
        end
        if found == true 
            puts "welcome"  
        else
            puts "not found"
            self.match_student_id_in_studentlist (studlist_arr)
        end
    end
end
