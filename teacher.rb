require 'json'
require 'time'
require 'date'
require_relative 'writer'
# require_relative 'info'

module Teacher
    module_function
    
    def createStudentLogin(studlist_arr)
        puts "Enter Student Name"
        name = gets.chomp
        puts "Enter Student ID"
        student_id = gets.chomp
        studlist_arr << {"student_name" => name,"student_ID" => student_id,"checkin" => []}
        Writer.send(studlist_arr)
        puts "You have just created a new user, in 2 seconds you will now be directed to the teacher menu...."
        sleep 2
        SignIn.clear
        self.run(studlist_arr)
    end

    def removestudent(studlist_arr)
        puts "You are about to remove a user, are you sure, y/n?"
        remcheck = gets.chomp.capitalize
            if remcheck == "Y"
                puts "Please enter the student ID that you want to remove:"
                id = gets.chomp
                x = studlist_arr.index {|h| h[:student_ID] == id }
                puts "LAST CHANCE: You are about to remove #{id}, are you sure?  Enter y to continue or any other key to quit."
                last_chance = gets.chomp.capitalize
                    if last_chance == 'Y'
                        studlist_arr.delete_at(x)
                        Writer.send(studlist_arr)
                        puts "User removed, returning to the teachers menu....."
                        sleep 2
                        SignIn.clear
                        self.run(studlist_arr)
                    else last_chance == 'N'
                        "Okay, returning to the teachers menu in 2 seconds...."
                        sleep 2
                        SignIn.clear
                        self.run(studlist_arr)
                    end
            elsif remcheck == "N"
                SignIn.clear
                puts "Returning to the teacher menu...."
                sleep 2
                self.run(studlist_arr)
            else
                puts "Error! You have not entered a valid option, please try again in 2 seconds....."
                sleep 2
                self.removestudent(studlist_arr)
            end
    end

    def view_student(studlist_arr)
        puts studlist_arr
        puts "When finished, enter press any key to return to the teachers menu"
        goback = gets.chomp
        if goback == ''
            SignIn.clear
            self.run(studlist_arr)
        else
            SignIn.clear
            self.run
        end
    end

    def run(studlist_arr)
        puts "Welcome to the teachers room!"
        puts "Press 1: to add user, 2: to remove user, 3: to generate student reports, 4: to view the current student list or nothing to return to the main menu:"
        user_input = gets.chomp.to_i
        if user_input == 1
            self.createStudentLogin(studlist_arr)
        elsif user_input == 2
            self.removestudent(studlist_arr) 
        elsif user_input == 3
            # Information.report
            puts "report"
        elsif user_input == 4
            view_student(studlist_arr)
        elsif user_input == 0
            puts "Returning to the main menu......"
            sleep 2
            SignIn.clear
            SignIn.begin(studlist_arr)
        else
            puts "Invalid selection, please try again in 2 seconds...."
            sleep 2
            self.run(studlist_arr)               
        end
            
    end

end




