require_relative 'solutions'
require 'rubygems'
require 'json'

class AbramovTasks
  include Solutions

  def main_menu
    system('clear')
    task_list = Solutions.instance_methods(false)
    task_id = 0
    puts "Welcome! We have #{task_list.length} tasks for you: "
    task_list.each { |task| puts "#{task_id += 1}. #{task}" }
    puts 'Choose a task (enter a number):'
    task_number = gets.chomp.to_i
    main_menu until task_number <= task_list.length
    task_chosing(task_number)
  end

  def continue_or_exit
    puts "Type 'm' to come back to main menu or press any key to exit"
    switch = gets.chomp.downcase
    return main_menu if switch == 'm'
    exit!
  end

  def get_condition(task)
    json = File.read('conditions.json')
    conditions = JSON.parse(json)
    conditions[task]
  end

  def task_chosing(task_number)
    system('clear')
    task_list = Solutions.instance_methods(false)
    task = task_list[task_number - 1]
    puts get_condition(task.to_s)
    n = gets.chomp.to_i
    puts method(task).call(n)
    continue_or_exit
  end

  new.main_menu
end
