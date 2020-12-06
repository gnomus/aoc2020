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
end.filter do |passport|
  fields_arr = passport.split(' ').map { |pair| pair.split(':')}.flatten
  fields = Hash[*fields_arr]

  fields['byr'].to_i.between?(1920,2002) &&
  fields['iyr'].to_i.between?(2010,2020) &&
  fields['eyr'].to_i.between?(2020,2030) &&
  if fields['hgt'].include?('cm')
    fields['hgt'].to_i.between?(150,193)
  else
    fields['hgt'].to_i.between?(59,76)
  end &&
  fields['hcl'].match?(/#[\da-f]{6}/) &&
  fields['ecl'].match?(/^(amb|blu|brn|gry|grn|hzl|oth)$/) &&
  fields['pid'].match?(/^\d{9}$/)
end

puts valid_passports.count
