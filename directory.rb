

def input_user

    puts "Please enter the name of a student"
    puts "If you are finished, press the enter button twice."
    name = gets.chomp
    puts "What cohort are they in?"
    cohort = gets.chomp
    if cohort == ''
      cohort= :november
    end
    puts "What are this persons hobbies?"
    hobbies = gets.chomp
    puts "Date of birth?"
    date_of_birth = gets.chomp
    puts "One last thing: How tall is he?"
    height = gets.chomp
    puts "If you are sure you haven't made a typo, just press enter. Otherwise tell me what you'd like to change!"
    changes = gets.chomp
    puts "Go ahead and give me the real #{changes}"
    new_object = gets.chomp
    if changes == "name"
      name = new_object
    elsif changes == "hobbies"
      hobbies = new_object
    elsif changes == "date of birth"
      date_of_birth = new_object
    elsif changes == "height"
      height = new_object
    elsif changes == "cohort"
      cohort = new_object
    end

  students = []

  while name != '' do
    students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, date: date_of_birth, height: height}
    puts "now we have #{students.count} students"
    puts "Is there any other students?"
    name = gets.chomp
    if name == ''
      break
    end
    puts "What cohort are they in?"
    cohort = gets.chomp
    if cohort == ''
      cohort= :november
    end
    puts "What are this persons hobbies?"
    hobbies = gets.chomp
    puts "Date of birth?"
    date_of_birth = gets.chomp
    puts "One last thing: How tall is he/she?"
    height = gets.chomp
    puts "If you are sure you haven't made a typo, just press enter. Otherwise tell me what you'd like to change!"
    changes = gets.chomp
    puts "Go ahead and give me the real #{changes}"
    new_object = gets.chomp
    if changes == "name"
      name = new_object
    elsif changes == "hobbies"
      hobbies = new_object
    elsif changes == "date of birth"
      date_of_birth = new_object
    elsif changes == "height"
      height = new_object
    elsif changes == "cohort"
      cohort = new_object
    end
  end
    students
end




def print_header
  line_width = 100
  puts  ("The students of Villains Academy").center(line_width)
  puts  ("-----------").center(line_width)
end

def printing(students)
  @new_students = 0
while students.length != 0
  name = students.pop
  line_width = 100
  puts (name[:name].capitalize + ", " + name[:cohort].to_s + " cohort").center(line_width)
  puts  ("This person's hobbies are: " + name[:hobbies] + " ").center(line_width)
  puts  ("Date of birth = " + name[:date] + " and they are " + name[:height] + " tall. ").center(line_width)
  puts  ("------------------").center(line_width)
  @new_students += 1
    if students.length == 0
      break
    end
  end
end

def print_footer(students)
puts ("Overall, we have #{@new_students} great students").center(100)
end


students = input_user
print_header
printing(students)
print_footer(students)
