#!/bin/bash

sum() {
    local numbers=$@
    local total=0
    for number in $numbers; do
        total=$(bc <<<$number+$total)
    done

    echo $total
}
