require 'csv'
require_relative 'employee.rb';
class CsvReader

  def read_csv(input_file)
    CSV.parse(input_file, headers: true)
  end

  def process_csv(input_file)
    table = read_csv(input_file)
    hash_map = Employee.generate_hash(table)
    File.open('answer.txt', 'w+') do |file|
      hash_map.each do |key, arr|
        write_to_file(file, hash_map, key, arr)
      end
    end
  end

  def write_to_file(file, hash_map, key, arr)
    file.puts "#{key}#{'s' if hash_map[key].length > 1}"
    arr.each { |employee| file.puts "#{employee.name} (EmpId: #{employee.empid})" }
    file.puts "\n"
  end
end

CsvReader.new.process_csv(File.open('csv_file.csv'))