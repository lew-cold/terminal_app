# module login
    require 'rubygems'
    require 'json'

file = File.read("studlist.json")

studlist = JSON.parse(file, :symbolize_names => true)

    # module_function
def student (studlist)
    puts "Please enter your student ID"
    studid = gets.chomp
    if studid == studlist[:studentid] then
        puts "welcome"
    #  Student.welcome
    else
        puts "invalid student ID, press  to find"

    end
end 

# def teacher
#     puts "please enter the admin password"
#     gets.chomp
# end

puts student (studlist)