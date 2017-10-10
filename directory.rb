
@students = []
def input_user

    puts "Please enter the name of a student"
    puts "If you are finished, press the enter button twice."
    name = gets.chomp
    if name != ''
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


  while name != '' do
    @students << {name: name, cohort: cohort.downcase.to_sym, hobbies: hobbies, date: date_of_birth, height: height}
    puts "now we have #{@students.count} student" if (@students.count) == 1
    puts "now we have #{@students.count} students" if @students.count > 1
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
    @students
end

def print_header
  line_width = 100
  puts  ("The students of Villains Academy").center(line_width)
  puts  ("-----------").center(line_width)
end

def printing_by_cohort
  line_width = 100
  @student_count = 0
  if @students.length >= 1
  cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  cohorts.each{|x|
    puts ("These are the students of the " + x.to_s + " cohort: ").center(line_width)
    students_cohort = @students.select{|hash| hash[:cohort] == x }
    students_cohort.each{|name|
      puts  (name[:name].capitalize + ", " + name[:cohort].to_s + " cohort").center(line_width)
      puts  ("This person's hobbies are: " + name[:hobbies] + " ").center(line_width)
      puts  ("Date of birth = " + name[:date] + " and they are " + name[:height] + " tall. ").center(line_width)
      puts ("----------").center(line_width)
      @student_count += 1
    } }
  else
    puts ("There are no students at the Villain Academy!").center(line_width)
  end
end


def printing
  @student_count = 0
  while @students.length != 0 do
  name = @students.pop
  line_width = 100
  puts (name[:name].capitalize + ", " + name[:cohort].to_s + " cohort").center(line_width)
  # uncover this code if you'd like to show this person's extra information
  #puts  ("This person's hobbies are: " + name[:hobbies] + " ").center(line_width)
  #puts  ("Date of birth = " + name[:date] + " and they are " + name[:height] + " tall. ").center(line_width)
  puts  ("------------------").center(line_width)
  @student_count += 1
  if @students.length == 0
    break
  end
end
end

def print_footer
  if @student_count == 1
      puts ("Overall, we have #{@student_count} great student.").center(100)
  elsif @student_count > 1
      puts ("Overall, we have #{@student_count} great students.").center(100)
  end

end


def print_menu
  list = ["Input the students", "Show the students", "Save the list to students.csv ", "fourth", "fifth", "sixth", "seventh", "eighth", "Exit"]
    list.each_with_index{|x,index|
    puts "#{index + 1}. #{x}" }

end

def show_students
  print_header
  printing
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_user
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you meant."
  end
end




def interactive_menu
  @students = []
  loop do
    print_menu
    puts "What would you like to do? "
    process(gets.chomp)
end
end

def save_students
  file = File.open("students.csv","w")
  #if we want to write to a file, we need to open it.
  @students.each do |student|
  #then we iterate over the array, processing one student at a time
  #on every iteration we create a new array
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
  #we write the csv line to the file
    file.puts csv_line
  end
  file.close
end




















interactive_menu
#students = input_user
#print_header
#printing_by_cohort(students)
#print_footer(students)
