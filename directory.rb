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
  @new_students = 0
while students.length != 0
  name = students.pop
  print name[:name] + ", "
  puts name[:cohort].to_s + " cohort"
  @new_students += 1
    if students.length == 0
      break
    end
  end
end

def print_footer(students)
puts "Overall, we have #{@new_students} great students"
end


students = input_user
print_header
printing(students)
print_footer(students)
