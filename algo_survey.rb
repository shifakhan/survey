def create(name)
#    puts "Enter a name for your survey:"
#    name = gets.chomp
    s1 = Survey.new
    s1.name = name
    s1.myques = []
    p s1.name
    continue = 'y'
    while continue == 'y'
      a = s1.add_ques
      a.myopn = []
      s1.myques << a
      a.options(a)
      puts "any more questions?"
      continue = gets.chomp!
    end
    s2 = s1
end

class Survey
 
   attr_accessor :name , :myques
  
  def add_ques
    puts "Enter the question:"
    x = gets.chomp
    obj = Ques.new
    obj.value = x
    obj
  end

  def display(s)
    puts "Survey" , s.name
    puts "Questions:"
    s.myques.each do |c|
      print "Q: " , c.value , "\n"
      c.myopn.each do |d|
        print "option: " , d.value , "\n"
      end
    end
  end

end

class Ques
  attr_accessor :value, :myopn
  
  def options(a)
    p #"{a}"
    p "a"
    p a
    cont2 = 'y'
    while cont2 == 'y'
      puts "Enter an option "
      val = gets.chomp
      o = Option.new
      o.value = val
      a.myopn << o
      puts "any more options?"
      cont2 = gets.chomp!
    end
  end

end

class Option
  attr_accessor :value
end

def file_survey(name,file_name)
 p "yoyo"
	f=File.open("/home/shifa/Documents/#{file_name}.csv").read
	s = Survey.new
	s.name = name
	s.myques = []
	f.split("\n").each do |line|
		x = line.split(",")
		ques = Ques.new
		ques.value = x[0]
		s.myques << ques
		x.shift
		ques.myopn = []
		x.each do |op|
			opn = Option.new
			opn.value = op
			ques.myopn << opn
		end
	end
	s
end

survey_list = []
puts "Menu:"
puts "Enter 1 for creating a survey manually"
puts "Enter 2 for creating a survey through csv file"
puts "Enter 3 for taking a survey"

choice = gets.chomp

case choice

	when '1'
	puts "Enter a name for your survey:"
	name = gets.chomp
	s = create(name)
	survey_list << s
	p s
	p s.name
	s.display(s)
	p survey_list

	when '2'
	puts "Enter a name for your survey:"
	name = gets.chomp
	puts "Enter name of csv file"
	file_name = gets.chomp
	s = file_survey(name,file_name)
	survey_list << s
	p survey_list
	s.display(s)

end
