#!/usr/bin/env ruby

require 'rubygems'
require 'json'
require 'colorize'

require_relative './login'

module SignIn
  module_function

  def prompt_ques
    puts "Welcome to Regi-Star!".green
    puts "Please select 's' for student,".light_magenta
    puts "Please select 't' for teacher or".light_magenta
    puts "Press enter to exit.".light_magenta
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
    puts "Please Wait".green
    sleep 1
    system("clear")
  end
end

if File.exist?("studlist.json")
  file = File.read("studlist.json")
  studlist_arr = JSON.parse(file, :symbolize_names => true)
else
  studlist_arr = []
end

SignIn.begin(studlist_arr)
