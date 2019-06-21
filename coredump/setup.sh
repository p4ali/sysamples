#!/bin/bash

compile() {
  gcc -o main main.cc
}

load() {
  gdb ./main /tmp/core.main.xxxxx # path to the core file
}

enablecoredump() {
  sudo sysctl -w kernel.core_pattern=/tmp/core.%e.%p.%t
  # the size of the coredump
  ulimit -c 512000
} 
