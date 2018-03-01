require 'colorize'
require 'time'

module Info
  module_function

  def report(studlist_arr)
    data = studlist_arr
    puts data.length
    x = 0
    data.each do
      puts
      puts "student name =  #{data[x][:student_name]}  Student ID = #{data[x][:student_ID]}  "
      puts "login time"
      f = studlist_arr[x][:checkin].length
      z = 0
      for i in 0...f
        t = Time.parse(studlist_arr[x][:checkin][z])
        s = t.to_s
        y = t.strftime("%H")
        r = y.to_i
        if r < 10
          puts "#{s.green}            On Time"
        else
          puts "#{s.red}              Late"
        end
        z += 1
      end
      x += 1
    end
    puts "When you are finished please enter any key to return back to the teachers menu".light_magenta
    goback = gets.chomp
    if goback == ''
      Teacher.return(studlist_arr)
    else
      Teacher.return(studlist_arr)
    end
  end

  def idcheck(studlist_arr)
    print "Enter the student ID you want to view: ".light_magenta
    id = gets.chomp.upcase
    found = false
    studlist_arr.each do |student_hash|
      if student_hash[:student_ID] == id
        found = true
        break
      end
    end
    if found == true
      self.singleReport(studlist_arr, id)
    else
      puts "Student ID not found, please try again".red
      Teacher.return(studlist_arr)
    end
  end

  def singleReport(studlist_arr, id)
    f = studlist_arr.find { |x| x[:student_ID] == id }
    z = 0
    for i in f[:checkin]
      t = Time.parse(f[:checkin][z])
      s = t.to_s
      y = t.strftime("%H")
      r = y.to_i
      if r < 10
        puts "#{s.green}            On Time"
      else
        puts "#{s.red}              Late"
      end
      z += 1
    end
    puts "When you are finished please enter any key to return back to the teachers menu".light_magenta
    goback = gets.chomp
    if goback == ''
      Teacher.return(studlist_arr)
    else
      Teacher.return(studlist_arr)
    end
  end

  def getInfo(studlist_arr)
    puts "Welcome to the Student Report Page".green
    puts "Press 1 to get All student info".light_magenta
    puts "Press 2 to get indidual student info".light_magenta
    puts "Press 3 to go back to Teacher menu".light_magenta

    print "Prease select the option ".light_magenta
    input = gets.chomp
    input = input.to_i

    if input == 1
      self.report(studlist_arr)
    elsif input == 2
      self.idcheck(studlist_arr)
    elsif input == 3
      Teacher.return(studlist_arr)
    else
      puts "Invalid Selection, please try again in 2 seconds...".red
      SignIn.clear
      self.getInfo(studlist_arr)
    end
  end
end
