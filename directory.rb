

def input_user

    puts "Please enter the name of a student"
    puts "If you are finished, press the enter button twice."
    name = gets.chomp
    puts "What are this persons hobbies?"
    hobbies = gets.chomp
    puts "Date of birth?"
    date_of_birth = gets.chomp
    puts "One last thing: How tall is he?"
    height = gets.chomp

  students = []

  while name != '' do
    students << {name: name, cohort: :november, hobbies: hobbies, date: date_of_birth, height: height}
    puts "now we have #{students.count} students"
    puts "Is there any other students?"
    name = gets.chomp
    if name == ''
      break
    end
    puts "What are this persons hobbies?"
    hobbies = gets.chomp
    puts "Date of birth?"
    date_of_birth = gets.chomp
    puts "One last thing: How tall is he/she?"
    height = gets.chomp
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
  print name[:name].capitalize + ", "
  puts name[:cohort].to_s + " cohort"
  puts  "This person's hobbies are: " + name[:hobbies] + " "
  puts "Date of birth = " + name[:date] + " and they are " + name[:height] + " tall. " 
  puts "------------------"
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
