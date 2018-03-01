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
    f = studlist_arr.find { |x| x[:student_ID] == student_id }
    while f != nil
      print "Error! ".red
      puts "ID already exist please enter the ID again:".green
      student_id = gets.chomp.upcase
      f = studlist_arr.find { |x| x[:student_ID] == student_id }
    end
    studlist_arr << {:student_name => name, :student_ID => student_id, :checkin => []}
    Writer.send(studlist_arr)
    puts "The new user has been added, please wait 2 seconds to be directed to the teacher menu...."
    self.return(studlist_arr)
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
      SignIn.clear
      self.idcheck(studlist_arr)
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
    puts "Press 1: to add user,".light_magenta
    puts "Press 2: to remove user,".light_magenta
    puts "Press 3: to generate student reports,".light_magenta
    puts "Press 4: to view the student list".light_magenta
    puts "or any other key to return to the main menu:".light_magenta
    user_input = gets.chomp.to_i
    case user_input
    when 1
      SignIn.clear
      self.createStudentLogin(studlist_arr)
    when 2
      SignIn.clear
      self.idcheck(studlist_arr)
    when 3
      SignIn.clear
      Info.getInfo(studlist_arr)
    when 4
      SignIn.clear
      view_student(studlist_arr)
    else
      puts "Returning to the main menu......".green
      SignIn.clear
      SignIn.begin(studlist_arr)
    end
  end
end
