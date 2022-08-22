class Employees
	attr_reader :input_file
	def initialize(input_file)
		@input_file = input_file

	end

	def generate_hash
		arr = read_csv(input_file)
		grouped_hash(arr)
	end

	def grouped_hash(arr)
	    arr.sort_by! { |row| row[2] }
	    hash_map = arr.group_by { |row| row[2] }
	    hash_map.each do |_designation, details|
	      details.sort_by! { |value| value[1] }
	    end
	end

	def read_csv(input_file)
    	CSV.read(input_file, headers: true).to_a[1..-1]
    end
end