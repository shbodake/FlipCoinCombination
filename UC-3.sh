#! /bin/bash
echo "Enter number of times to flip a combination:" 
read nflips
declare -A doublet=( [HH]=0 [HT]=0 [TH]=0 [TT]=0 )
for(( flip = 1; flip <= nflips; flip++ ))
do
    echo "Flip-$flip is "
    (( coin_1 = RANDOM % 2 ))
    (( coin_2 = RANDOM % 2 ))
    case $coin1$coin2 in
        00)
            echo "Heads Heads"
            (( doublet[HH]++ )) 
            ;;
        01)
            echo "Heads Tails"
            (( doublet[HT]++ ))
            ;;
        10)
            echo "Tails Heads"
            (( doublet[TH]++ ))
            ;;
        11)
            echo "Tails Tails"
            (( doublet[TT]++ ))
            ;;
    esac
done

for combination in ${!doublet[@]}
do
    percentage=$(( ${doublet[$combination]}  * 100 / nflips ))
    doublet[$combination]=$percentage
    echo "percentage of $combination is ${doublet[$combination]}%"
done
