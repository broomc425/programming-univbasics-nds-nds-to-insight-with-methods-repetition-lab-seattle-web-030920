require 'yaml'

def directors_database
	rot13 = -> (s) { s.tr('A-Za-z', 'N-ZA-Mn-za-m') }
  @_db ||= YAML.load(rot13.call(File.open("directors_db").read.to_s))
end

def directors_totals(source)
  result = []
  director_index = 0 
  while director_index < source.size do
    director = source[director_index].length 
    result[director[:name]] = gross_for_director(director)
    director_index += 1 
  end
  result
end

def gross_for_director(d)
  totals = 0 
  i = 0 
  while i < d[:movies].length do
    totals += d[:movies][index][:worldwide_gross]
    index += 1 
  end
  totals
end

