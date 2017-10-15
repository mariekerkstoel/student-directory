
@students = []
def input_user

    puts "Please enter the name of a student"
    puts "If you are finished, press the enter button twice."
    name = STDIN.gets.chomp
    if name != ''
      puts "What cohort are they in?"
      cohort = STDIN.gets.chomp
        if cohort == ''
            cohort = :november
        end
      puts "If you are sure you haven't made a typo, just press enter. Otherwise tell me what you'd like to change!"
      changes = STDIN.gets.chomp
        if changes == "name"
            puts "Go ahead and give me the real #{changes}"
            new_object = STDIN.gets.chomp
            name = new_object
        elsif changes == "cohort"
            puts "Go ahead and give me the real #{changes}"
            new_object = STDIN.gets.chomp
            cohort = new_object
        end
      end


  while name != '' do
    input_to_students(name,cohort)
    puts "now we have #{@students.count} student" if (@students.count) == 1
    puts "now we have #{@students.count} students" if @students.count > 1
    puts "Is there any other students?"
    name = STDIN.gets.chomp
    if name != ''
      puts "What cohort are they in?"
      cohort = STDIN.gets.chomp
        if cohort == ''
            cohort = :november
        end
      puts "If you are sure you haven't made a typo, just press enter. Otherwise tell me what you'd like to change!"
      changes = STDIN.gets.chomp
        if changes == "name"
            puts "Go ahead and give me the real #{changes}"
            new_object = STDIN.gets.chomp
            name = new_object
        elsif changes == "cohort"
            puts "Go ahead and give me the real #{changes}"
            new_object = STDIN.gets.chomp
            cohort = new_object
        end
      end
  end
    @students
end



def getting_more_info(input)
  puts "What is this person's #{input}?"
  input = STDIN.gets.chomp
end

def changing_more_info(input)
  if changes == input
     puts "Go ahead and give me the real #{changes}"
     new_object = STDIN.gets.chomp
     input = new_object
  end
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
  cohorts = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
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
  puts ("Overall, we have #{@student_count} great student.").center(100) if @student_count == 1
  puts ("Overall, we have #{@student_count} great students.").center(100) if @student_count > 1
end



def print_menu
  list = ["Input the students", "Show the students", "Save the list to students.csv ", "Load the list from students.csv ", "fifth", "sixth", "seventh", "eighth", "Exit"]
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
      puts "Input succesful!"
      puts ''
    when "2"
      show_students
      puts "You were just shown the existing students!"
      puts ''
    when "3"
      save_students
      puts "Saved!"
      puts ''
    when "4"
      students_load_from_file
      puts "File loaded!"
      puts ''
    when "9"
      puts "You have just exited the program."
      exit
    else
      puts "I don't know what you meant."
      puts ''
  end
end




def interactive_menu
  @students = []
  loop do
    print_menu
    puts "What would you like to do? "
    process(STDIN.gets.chomp)
  end
end

def save_students
  puts "Which file would you like to save to?"
  file_to_save = STDIN.gets.chomp
  file = File.open(file_to_save,"w")
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


def load_students(filename = "students.csv")
  file = File.open(filename, "r") #open file + specify that you're reading it
  file.readlines.each do |line| #read all lines into an array and iterate over it
    name, cohort = line.chomp.split(',') #assign it to two variables
    input_to_students(name, cohort) #create a new hash and put it in the list of students
  end
  file.close
end

def students_load_from_file
  puts "Which file would you like to load from?"
    file_to_load = STDIN.gets.chomp
  if !File.exist?(file_to_load)
    file_to_load = "students.csv"
  end
  load_students(file_to_load)
end
#When a program is launched, there's no way of knowing how many arguments will be passed to it, let alone their names.
#Therefore, we have to access them by their index.
#ARGV = is a variable that contains the arguments passed to a program through the command line
#Manifests as an array so you access the objects like you would access objects of an array!
# If we pass the filename as an argument, we can load the data from there automatically:
# ruby directory.rb students.csv : filename is passed as an argument.
#To acces the argument : ARGV[0] or ARGV.first

def try_load_students
  filename = ARGV.first
  return if filename.nil? #get out of the method if argument isn't given.
    if File.exist?(filename) #checking if file exists
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else
      puts "Sorry, #{filename} doesn't exist"
    end
end


#Why we have to use STDIN.gets instead of gets:
#gets actually returns the next line from the list of files in ARGV or from standard input(keyboard input)
#if no aruments are given. So we need to specify that gets should read from standard input stream.

def input_to_students(value1, value2)
  @students << {name: value1, cohort: value2.capitalize.to_sym}
end








try_load_students
interactive_menu
#students = input_user
#print_header
#printing_by_cohort(students)
#print_footer(students)
