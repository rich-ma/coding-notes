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
		@students.include?(student)
	end

	def student_to_teacher_ratio
		(@students.length / @teachers.length).floor
	end

	def add_grade(student, grade)
		if enrolled?(student)
			@grades[student] << grade
			true
		else
			false
		end
	end

	def num_grades(student)
		@grades[student].length
	end

	def average_grade(student)
		if enrolled?(student) && num_grades(student) > 0
			@grades[student].sum / num_grades(student)
		else
			nil
		end
	end

end
