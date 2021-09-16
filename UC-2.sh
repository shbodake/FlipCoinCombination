#!/bin/bash
echo "Enter number of times to flip a combination:" 
read nflips
declare -A singlet=( [H]=0 [T]=0 )
for(( flip = 1; flip <= nflips; flip++ ))
do
    echo "Flip-$flip is "
    (( toss = RANDOM % 2 ))
    case $toss in 
        0)
            echo "Heads"
            (( singlet[H]++ ))
            ;;
        1)
            echo "Tails"
            (( singlet[T]++ ))
    esac
done

for combination in ${!singlet[@]}
do
    percentage=$(( ${singlet[$combination]}  * 100 / nflips ))
    singlet[$combination]=$percentage
    echo "percentage of $combination is ${singlet[$combination]}%"
done
