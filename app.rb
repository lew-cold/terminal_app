require 'rubygems'
require 'json'

require_relative 'login'

module SignIn
    module_function
    def prompt_ques
        puts "Welcome to Regi-Star!  Please select 's' for student, 't' for teacher or press enter to exit."
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
        self.clear
        puts "Leaving the system, thank you for using Regi-Star!"
    end
    
    def clear
        system("clear")
    end
end

# studlist_arr = {"student_name": "John", "student_ID": "CA123", "checkin": ["2018-02-28 21:38:56 +1100", "2018-02-28 21:38:56 +1100"]}, {"student_name": "Lewis", "student_ID": "CA124", "checkin": ["2018-02-28 21:38:56 +1100", "2018-02-28 21:38:56 +1100"]}, { "student_name": "Punya", "student_ID": "CA125", "checkin": ["2018-02-28 21:38:56 +1100", "2018-02-28 21:38:56 +1100"] }, { "student_name": "Michael", "student_ID": "CA126", "checkin":["2018-02-28 21:38:56 +1100", "2018-02-28 21:38:56 +1100"] }



file = File.read("studlist.json")
studlist_arr = JSON.parse(file, :symbolize_names => true)


SignIn.begin(studlist_arr)

# puts match_student_id_in_studentlist (studlist_arr)

