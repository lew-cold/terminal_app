require_relative 'login'

module SignIn
    module_function
    def prompt_ques
        puts "Welcome to the registry.  Please select 's' for student, 't' for teacher or enter any key to exit."
        gets.chomp
    end

    def begin(studlist_arr)
        selected_option = SignIn.prompt_ques
        output = Login.initial(studlist_arr, selected_option)
        # if output == "error"
            # self.begin(studlist_arr)
        # end
    end

    def quit
        puts "Leaving the system, thank you for using"
    end
end



file = File.read("studlist.json")
studlist_arr = JSON.parse(file, :symbolize_names => true)

SignIn.begin(studlist_arr)

# puts match_student_id_in_studentlist (studlist_arr)

