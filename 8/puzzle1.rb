PROGRAM = File.readlines('input').map do |cmd|
  cmd = cmd.split(' ')
  cmd[0] = cmd[0].to_sym
  cmd[1] = cmd[1].to_i
  cmd
end

VISITED = []

def exec(addr, acc)
  if VISITED.include? addr
    puts "Loop @ #{addr}!"
    puts "Acc: #{acc}"
    return
  else
    VISITED << addr
  end
  cmd = PROGRAM[addr][0]
  arg = PROGRAM[addr][1]
  puts "exec @ #{addr}(#{acc}) #{cmd}(#{arg})"
  case cmd
  when :nop
    exec(addr+1, acc)
  when :jmp
    exec(addr+arg, acc)
  when :acc
    exec(addr+1, acc+arg)
  end
end


puts PROGRAM.inspect

exec(0,0)
