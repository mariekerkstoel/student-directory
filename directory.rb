

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
      if changes == "name"
        puts "Go ahead and give me the real #{changes}"
        new_object = gets.chomp
        name = new_object
      elsif changes == "hobbies"
        puts "Go ahead and give me the real #{changes}"
        new_object = gets.chomp
        hobbies = new_object
      elsif changes == "date of birth"
        puts "Go ahead and give me the real #{changes}"
        new_object = gets.chomp
        date_of_birth = new_object
      elsif changes == "height"
        puts "Go ahead and give me the real #{changes}"
        new_object = gets.chomp
        height = new_object
      elsif changes == "cohort"
        puts "Go ahead and give me the real #{changes}"
        new_object = gets.chomp
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
    if changes == "name"
      puts "Go ahead and give me the real #{changes}"
      new_object = gets.chomp
      name = new_object
    elsif changes == "hobbies"
      puts "Go ahead and give me the real #{changes}"
      new_object = gets.chomp
      hobbies = new_object
    elsif changes == "date of birth"
      puts "Go ahead and give me the real #{changes}"
      new_object = gets.chomp
      date_of_birth = new_object
    elsif changes == "height"
      puts "Go ahead and give me the real #{changes}"
      new_object = gets.chomp
      height = new_object
    elsif changes == "cohort"
      puts "Go ahead and give me the real #{changes}"
      new_object = gets.chomp
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

def printing_by_cohort(students)
  line_width = 100
  cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  cohorts.each{|x|
    puts ("These are the students of the " + x.to_s + " cohort.").center(line_width)
    puts ("----------").center(line_width)
    students_cohort = students.select{|hash| hash[:cohort] == x }
    students_cohort.each{|name|
      puts  (name[:name].capitalize + ", " + name[:cohort].to_s + " cohort").center(line_width)
      puts  ("This person's hobbies are: " + name[:hobbies] + " ").center(line_width)
      puts  ("Date of birth = " + name[:date] + " and they are " + name[:height] + " tall. ").center(line_width)
    } }
end


def printing(students)
  @student_count = 0
  while students.length != 0 do
  name = students.pop
  line_width = 100
  puts (name[:name].capitalize + ", " + name[:cohort].to_s + " cohort").center(line_width)
  puts  ("This person's hobbies are: " + name[:hobbies] + " ").center(line_width)
  puts  ("Date of birth = " + name[:date] + " and they are " + name[:height] + " tall. ").center(line_width)
  puts  ("------------------").center(line_width)
  @student_count += 1
  if students.length == 0
    break
  end
end
end

def print_footer(students)
puts ("Overall, we have #{@student_count} great students").center(100)
end


students = input_user
print_header
printing_by_cohort(students)
print_footer(students)
