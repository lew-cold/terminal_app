require 'colorize'
require_relative 'teacher'
require_relative 'student'

module Login
    module_function

    # TODO 
    # - create unit test that calls initial([...], 2) and expects the response to be false
    # - create unit test that calls initial([...], "s") and expects the response to be true
    def initial(studlist_arr, selected_option)
        command = selected_option
        if command == "S"
            self.match_student_id_in_studentlist (studlist_arr)
        elsif command == "T"
            self.teacher_log(studlist_arr)
        elsif command == ''
            SignIn.quit
        else
            puts "Invalid selection, returning to the main menu......".red
            SignIn.clear
            SignIn.begin (studlist_arr)
        end
    end

    def match_student_id_in_studentlist(studlist_arr)
        puts "Please enter your student ID".light_magenta
        studid_str = gets.chomp.upcase
        stid = studid_str
        found = false
        studlist_arr.each do |student_hash|
            if student_hash[:student_ID] == studid_str then
                found = true
                break
            end 
        end
        if found == true 
            Student.clockin(studlist_arr, stid)
        else
            puts "Student ID not found, returning to the main menu.........".red
            SignIn.clear
            SignIn.begin(studlist_arr)    
        end
    end

    def teacher_log(studlist_arr)
        puts "Welcome teacher, to access the admin functions please enter the pin".light_magenta
    pin = 1234
    pin_entry = gets.chomp.to_i
        if pin_entry == pin then
            puts "You are signed in, please wait....".green
            SignIn.clear
            Teacher.run(studlist_arr)
        else
            puts "Incorrect Pin, in 2 seconds you will be returned to the main menu....".red
            SignIn.clear
            SignIn.begin(studlist_arr)
        end
    end

end
