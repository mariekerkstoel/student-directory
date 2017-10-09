#first we print the list of students

def input_user
  puts "Please enter the name of a student"
  puts "If you are finished, press the enter button twice."

  name = gets.chomp
  students = []

  while name != '' do
    students << {name: name, cohort: :november}
    puts "now we have #{students.count} students"
    name = gets.chomp
  end
students

end

def print_header
  puts  "The students of Villains Academy"
  puts  "-----------"
end
def printing(students)
  students.each_with_index{ |student,index|
  if student[:name][0] == "D"
  puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)"
  end
}
end

def print_footer(students)
puts "Overall, we have #{students.count} great students"
end


students = input_user
print_header
printing(students)
print_footer(students)
