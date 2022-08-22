require 'csv'
require_relative 'employee.rb';
class CsvReader

  def process_csv(input_file)
    hash_map = Employees.new(input_file).generate_hash
    File.open('answer.txt', 'w') do |file|
      hash_map.each do |designation, details|
        file.puts "#{designation}#{'s' if hash_map[designation].length > 1}"
        details.each { |detail| file.puts "#{detail[0]} (EmpId: #{detail[1]})" }
        file.puts "\n"
      end
    end
  end
end

CsvReader.new.process_csv(File.open('csv_file.csv'))