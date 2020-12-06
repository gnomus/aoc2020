puts File.readlines('input').map { |line| line.gsub(/[BFLR]/, 'B' => '1', 'F' => '0', 'R' => '1', 'L' => '0').to_i(2) }.max
