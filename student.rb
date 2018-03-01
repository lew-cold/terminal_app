require 'date'
require 'time'
require_relative 'writer'
# require_relative 'app'
# require_relative 'login'

module Student
    module_function
    def clockin(studlist_arr, stid)
        t = Time.now
        puts "Welcome #{stid} to the checkin prompt!"
        puts "The current time is #{t.strftime("%I:%M%p")}, do you want to checkin, y/n? Enter nothing to quit the program."
        response = gets.chomp.capitalize
        if response == "Y" then
            stda = studlist_arr.select{ |stu| stu[:student_ID] == stid }
            stdb = Hash[*stda.flatten]
            stdb[:checkin] << t.strftime("%H:%M %d/%m/%Y")
            Writer.send(studlist_arr)
            puts "You are clocked in, please wait 2 seconds...."
            sleep 2
            # SignIn.clear
            SignIn.begin(studlist_arr)
        elsif response == "N" then
            SignIn.begin(studlist_arr)
        elsif response == '' then
            SignIn.quit
        else
            puts "Error, please make a correct selection"
            self.clockin(studlist_arr, stid)
        end

    end

end
