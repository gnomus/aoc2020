inputs = File.readlines('input')

passports = inputs.chunk do |line|
  line == "\n"
end.filter do |emptyline,passport|
  !emptyline
end.map do |emptyline, passport|
  passport.join(" ").delete("\n")
end

valid_passports = passports.filter do |passport|
  passport.include?('byr:') &&
  passport.include?('iyr:') &&
  passport.include?('eyr:') &&
  passport.include?('hgt:') &&
  passport.include?('hcl:') &&
  passport.include?('ecl:') &&
  passport.include?('pid:')
end

puts valid_passports.count
