require_relative "room"

class Hotel
  def initialize(name, rooms)
		@name = name
		@rooms = {}
		rooms.each do |room|
			@rooms[room[0]] = Room.new(room[1])
		end
	end

	#getters
	def name
		@name.split.map(&:capitalize).join(' ')
	end

	def rooms
		@rooms
	end

	#methods
	def room_exists?(name)
		@rooms[name] ? true : false
	end

	def check_in(person, room)
		if room_exists?(room)
			if @rooms[room].add_occupant(person)
				p 'check in successful'
			else
				p 'sorry, room is full'
			end
		else
			p "sorry, room does not exist"
		end
	end

	def has_vacancy?
		@rooms.any? {|name, room| room.available_space > 0 }
	end

	def list_rooms
		@rooms.each do |name, room|
			puts "#{name}, #{room.available_space}"
		end
	end
end
