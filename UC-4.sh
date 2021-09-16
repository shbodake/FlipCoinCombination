#! /bin/bash
echo "Enter number of times to flip a combination:" 
read nflips
declare -A triplet=( [HHT]=0 [HTH]=0 [HTT]=0 [THH]=0 [THT]=0 [TTH]=0 [TTT]=0 )
for(( flip = 1; flip <= nflips; flip++ ))
do
    echo -n "Flip-$flip is "
    (( coin1 = RANDOM % 2 ))
    (( coin2 = RANDOM % 2 ))
    (( coin3 = RANDOM % 2 ))
    case $coin1$coin2$coin3 in
        000)
            echo "Heads Heads Heads"
            (( triplet[HHH]++ )) ;;
        001)
            echo "Heads Heads Tails"
            (( triplet[HHT]++ )) ;;
        010)
            echo "Heads Tails Heads"
            (( triplet[HTH]++ )) ;;
        011)
            echo "Heads Tails Tails"
            (( triplet[HTT]++ )) ;;
        100)
            echo "Tails Heads Heads"
            (( triplet[THH]++ )) ;;
        101)
            echo "Tails Heads Tails"
            (( triplet[THT]++ )) ;;
        110)
            echo "Tails Tails Heads"
            (( triplet[TTH]++ )) ;;
        111)
           echo "Tails Tails Tails"
            (( triplet[TTT]++ )) ;;
    esac
done
for combination in ${!triplet[@]}
do
    percentage=$(( ${triplet[$combination]}  * 100 / nflips ))
    triplet[$combination]=$percentage
    echo "percentage of $combination is ${triplet[$combination]}%"
done
