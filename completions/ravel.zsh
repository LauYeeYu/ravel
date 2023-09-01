#compdef ravel

local arguments
local weight_arguments

arguments=(
  '--oj-mode[online judge mode]'
  '(--input-file)'{--input-file=,--input-file}'[set the input file]:input file:_files'
  '(--output-file)'{--output-file=,--output-file}'[set the output file]:output file:_files'
  '--enable-cache[enable cache]'
  '--keep-debug-info[keep debug info]'
  '--print-instructions[print instructions]'
  '(--timeout)'--timeout='[set the limit of ticks]:number'
  '(-w)'-w+'[set the weight of instructions]:instruction type:->weight'
  '*:file or directory:_files'
)

_arguments -s -S $arguments && return 0

case $state in
  weight)
  weight_arguments=(
    'options for instruction type'
    'simple[set the weight of simple instructions]:number'
    'mul[set the weight of mul instructions]:number'
    'br[set the weight of br instructions]:number'
    'div[set the weight of div instructions]:number'
    'mem[set the weight of mem instructions]:number'
    'libcIO[set the weight of libcIO instructions]:number'
    'libcMem[set the weight of libcMem instructions]:number'
  )
  _values $weight_arguments && return 0
esac

return 1
