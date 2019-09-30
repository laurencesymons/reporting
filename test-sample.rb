sql_results = [[{1=>5, 2=>9, 3=>3, 4=>8, 5=>2, 6=>6, 7=>4, 8=>2, 9=>4, 10=>7, 11=>10, 12=>3, 13=>3, 14=>4, 15=>2, 16=>10, 17=>65, 18=>17, 19=>17, 20=>11, 21=>3, 22=>2, 23=>7, 24=>109, 25=>52, 26=>17, 27=>14, 28=>4, 29=>7, 30=>5}, {1=>1, 2=>1, 5=>1, 8=>2, 11=>1, 13=>1, 17=>2, 24=>4, 25=>2, 27=>1, 29=>1}], [{1=>13, 2=>19, 3=>16, 4=>11, 5=>10, 6=>3, 7=>5, 8=>2, 9=>6, 10=>15, 11=>14, 12=>19, 13=>5, 14=>12, 15=>15, 16=>20, 17=>160, 18=>75, 19=>35, 20=>20, 21=>15, 22=>17, 23=>17, 24=>469, 25=>176, 26=>51, 27=>33, 28=>22, 29=>15, 30=>12}, {1=>8, 2=>7, 3=>4, 4=>2, 5=>4, 6=>8, 7=>6, 8=>8, 9=>14, 10=>3, 11=>11, 12=>8, 13=>5, 14=>5, 15=>7, 16=>5, 17=>31, 18=>11, 19=>2, 20=>4, 21=>8, 22=>2, 23=>4, 24=>27, 25=>21, 26=>8, 27=>10, 28=>6, 29=>3, 30=>8}], [{1=>21, 2=>23, 3=>24, 4=>20, 5=>24, 6=>27, 7=>14, 8=>19, 9=>17, 10=>28, 11=>38, 12=>36, 13=>27, 14=>28, 15=>20, 16=>19, 17=>488, 18=>165, 19=>65, 20=>53, 21=>25, 22=>14, 23=>26, 24=>612, 25=>244, 26=>78, 27=>56, 28=>29, 29=>25, 30=>25}, {1=>8, 2=>5, 3=>5, 4=>3, 5=>3, 6=>2, 7=>1, 8=>3, 9=>1, 10=>6, 11=>2, 12=>4, 13=>3, 15=>7, 16=>9, 17=>5, 18=>6, 19=>7, 20=>3, 22=>4, 23=>4, 24=>6, 25=>3, 26=>3, 27=>5, 28=>1, 29=>6, 30=>3}]]
def format_raw_recruitments_data(data, year, month)
  # split up the query results
  # make the hashes contained in the arrays return 0 as default if there is no key
  # if a day is missing (0 + 5) will return 5 (nil + 5) will error

  ro1, ro2, rec = data.each { |ro| ro.each { |r| r.default = 0 } }

  # make a hash with each day of the month as a key
  # {"2019-01-01"=>[12, 2, 12]} this is what we are building
  # the three positions in the array correspond to three columns in the display table for that day

  last_day = (Time.new(year, month + 1) - 1).day

  (1..last_day).to_a.reduce(Hash.new) { |hash, day|
    hash[Time.new(year, month, day).strftime("%F")] = [
      ro1.first[day] + ro1.last[day],
      ro2.first[day] + ro2.last[day],
      rec.first[day] + rec.last[day],
    ]

    hash
  }
end

print format_raw_recruitments_data(sql_results, 2019, 9)

def format_raw_recruitments_data(data, year, month)
  # split up the query results
  # make the hashes contained in the arrays return 0 as default if there is no key
  # if a day is missing (0 + 5) will return 5 (nil + 5) will error

  ro1, ro2, rec = data.each { |ro| ro.each { |r| r.default = 0 } }

  # make a hash with each day of the month as a key
  # {"2019-01-01"=>[12, 2, 12]} this is what we are building
  # the three positions in the array correspond to three columns in the display table for that day

  last_day = (Time.new(year, month + 1) - 1).day

  (1..last_day).to_a.reduce(Hash.new) { |hash, day|
    hash[Time.new(year, month, day).strftime("%F")] = [
      ro1.first[day] + ro1.last[day],
      ro2.first[day] + ro2.last[day],
      rec.first[day] + rec.last[day],
    ]

    hash
  }
end

print format_raw_recruitments_data(sql_results, 2019, 9)
