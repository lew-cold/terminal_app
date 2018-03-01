require 'json'
require 'time'
require 'date'
require 'colorize'
require_relative 'writer'
require_relative 'info'

module Teacher
  module_function

  def createStudentLogin(studlist_arr)
    puts "Enter Student Name".light_magenta
    name = gets.chomp.capitalize
    puts "Enter Student ID".light_magenta
    student_id = gets.chomp.upcase
    studlist_arr << {"student_name" => name, "student_ID" => student_id, "checkin" => []}
    Writer.send(studlist_arr)
    puts "The program must be restarted to reflect the new user".green
    puts "Please press 1 to quit or any key to go back to the teachers menu"
    resp = gets.chomp.to_i
    if resp == 1
      SignIn.quit
    else
      self.return(studlist_arr)
    end
  end

  def idcheck(studlist_arr)
    puts "You are about to remove a user, are you sure, y/n?".green
    remcheck = gets.chomp.capitalize
    if remcheck == "Y"
      puts "Please enter the student ID that you want to remove:".light_magenta
      id = gets.chomp.upcase
      found = false
      studlist_arr.each do |student_hash|
        if student_hash[:student_ID] == id
          found = true
          break
        end
      end
      if found == true
        self.removestudent(studlist_arr, id)
      else
        puts "Student ID not found!".red
        self.return(studlist_arr)
      end
    elsif remcheck == "N"
      self.return(studlist_arr)
    else
      puts "Error! You have not entered a valid option, please try again in 2 seconds.....".red
      sleep 2
      self.removestudent(studlist_arr)
    end
  end

  def removestudent(studlist_arr, id)
    x = studlist_arr.index { |h| h[:student_ID] == id }
    puts "LAST CHANCE: You are about to remove #{id}, are you sure?  Enter y to continue or any other key to quit.".red
    last_chance = gets.chomp.capitalize
    if last_chance == 'Y'
      studlist_arr.delete_at(x)
      Writer.send(studlist_arr)
      puts "User removed, returning to the teachers menu.....".green
      self.return(studlist_arr)
    else last_chance == 'N'
      "Okay, returning to the teachers menu in 2 seconds....".green
      self.return(studlist_arr)     end
  end

  def view_student(studlist_arr)
    studlist_arr.each do |studs|
      puts "#{studs[:student_name].ljust(10)} | #{studs[:student_ID].ljust(10)}".green
    end
    puts "When finished, enter press any key to return to the teachers menu".light_magenta
    goback = gets.chomp
    if goback == ''
      self.return(studlist_arr)
    else
      self.return(studlist_arr)
    end
  end

  def return(studlist_arr)
    puts "Returning to teachers menu.....".green
    SignIn.clear
    self.run(studlist_arr)
  end

  def run(studlist_arr)
    puts "Welcome to the teachers room!".green
    puts "Press 1: to add user, 2: to remove user, 3: to generate student reports, 4: to view the current student list or nothing to return to the main menu:".light_magenta
    user_input = gets.chomp.to_i
    if user_input == 1
      self.createStudentLogin(studlist_arr)
    elsif user_input == 2
      self.idcheck(studlist_arr)
    elsif user_input == 3
      SignIn.clear
      Info.getInfo(studlist_arr)
    elsif user_input == 4
      SignIn.clear
      view_student(studlist_arr)
    elsif user_input == 0
      puts "Returning to the main menu......".green
      sleep 2
      SignIn.clear
      SignIn.begin(studlist_arr)
    else
      puts "Invalid selection, please try again in 2 seconds....".red
      self.return(studlist_arr)
    end
  end
end
