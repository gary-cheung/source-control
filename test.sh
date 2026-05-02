#!/bin/bash
g++ -o solution solution.cpp

pass=0
fail=0

check() {
    input="$1"
    expected="$2"
    output=$(echo "$input" | ./solution)
    if [ "$output" = "$expected" ]; then
        echo "PASS: input='$input' => output='$output'"
        pass=$((pass+1))
    else
        echo "FAIL: input='$input' => got '$output', expected '$expected'"
        fail=$((fail+1))
    fi
}

check "3 5" "8"
check "10 20" "30"
check "0 0" "0"
check "100 200" "300"

echo ""
echo "Results: $pass passed, $fail failed"
if [ $fail -gt 0 ]; then exit 1; fi
