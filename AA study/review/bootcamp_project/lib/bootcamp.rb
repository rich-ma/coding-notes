class Bootcamp
	def initialize(name, slogan, student_capacity)
		@name = name
		@slogan = slogan
		@student_capacity = student_capacity
		@students = []
		@teachers = []
		@grades = Hash.new{|h,k| h[k] = []}

	end

	#getters
	def name
		@name
	end

	def slogan
		@slogan
	end

	def teachers
		@teachers
	end

	def students
		@students
	end



	#methods
	def hire(teacher)
		@teachers << teacher
	end

	def enroll(student)
		if students.length < @student_capacity
			@students << student
			return true
		else
			return false
		end
	end

	def enrolled?(student)
		@students.include?(student) ? true : false
	end



end
