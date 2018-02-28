# require_relative 'teacher'
require_relative 'student'

module Login
    module_function

    def initial(studlist_arr, selected_option)
        command = selected_option
        if command == "s"
            self.match_student_id_in_studentlist (studlist_arr)
        elsif command == "t"
            puts "TEACHER"
        elsif command == ''
            SignIn.quit
        else
            SignIn.clear
            puts "Invalid selection, returning to the main menu......"
            SignIn.begin (studlist_arr)
        end
    end

    def match_student_id_in_studentlist(studlist_arr)
        puts "Please enter your student ID"
        studid_str = gets.chomp.upcase
        stid = studid_str
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
            Student.clockin(studlist_arr, stid)
        else
            SignIn.clear
            puts "Student ID not found, returning to the main menu........."
            SignIn.begin(studlist_arr)
            
        end
    end
end
