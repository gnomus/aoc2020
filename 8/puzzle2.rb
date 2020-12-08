PROGRAM = File.readlines('input').map do |cmd|
  cmd = cmd.split(' ')
  cmd[0] = cmd[0].to_sym
  cmd[1] = cmd[1].to_i
  cmd
end.freeze

def exec(prog, visited, addr, acc)
  if addr >= prog.count
    puts "Terminated Acc: #{acc}"
    return true
  elsif visited.include? addr
    puts "Loop @ #{addr}!"
    return false
  else
    visited << addr
  end
  cmd = prog[addr][0]
  arg = prog[addr][1]
  case cmd
  when :nop
    exec(prog, visited, addr+1, acc)
  when :jmp
    exec(prog, visited, addr+arg, acc)
  when :acc
    exec(prog, visited, addr+1, acc+arg)
  end
end

PROGRAM.each_with_index do |line, index|
  prog = PROGRAM.map(&:clone)
  case line[0]
  when :nop
    if line[1] != 0
      prog[index][0] = :jmp
    end
  when :jmp
    prog[index][0] = :nop
  end
  success = exec(prog, [], 0, 0)
  return if success
end

puts PROGRAM
