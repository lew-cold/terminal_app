require 'rubygems'
require 'json'
require 'colorize'

require_relative 'login'

module SignIn
    module_function
    def prompt_ques
        puts "Welcome to Regi-Star!  Please select 's' for student, 't' for teacher or press enter to exit.".light_magenta
        gets.chomp.capitalize
    end

    def begin(studlist_arr)
        selected_option = SignIn.prompt_ques
        output = Login.initial(studlist_arr, selected_option)
    end

    def quit
        puts "Leaving the system, thank you for using Regi-Star!".green
        self.clear
    end
    
    def clear
        sleep 2
        system("clear")
    end
end

file = File.read("studlist.json")
studlist_arr = JSON.parse(file, :symbolize_names => true)

SignIn.begin(studlist_arr)


