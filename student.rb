require 'date'
require 'time'
require 'colorize'
require_relative 'writer'

module Student
    module_function
    def clockin(studlist_arr, stid)
        t = Time.now
        puts "Welcome #{stid} to the checkin prompt!".green
        puts "The current time is #{t.strftime("%I:%M%p")}, do you want to checkin, y/n?".light_magenta
        puts "Enter nothing to quit the program.".light_magenta
        response = gets.chomp.capitalize
        if response == "Y" then
            stda = studlist_arr.select{ |stu| stu[:student_ID] == stid }
            stdb = Hash[*stda.flatten]
            stdb[:checkin] << t.strftime("%H:%M %d/%m/%Y")
            Writer.send(studlist_arr)
            puts "You are clocked in, please wait 2 seconds....".green
            SignIn.clear
            SignIn.begin(studlist_arr)
        elsif response == "N" then
            puts "Returning to the main menu, please wait....".green
            SignIn.clear
            SignIn.begin(studlist_arr)
        elsif response == '' then
            SignIn.quit
        else
            puts "Error, please make a correct selection".red
            SignIn.clear
            self.clockin(studlist_arr, stid)
        end

    end

end
