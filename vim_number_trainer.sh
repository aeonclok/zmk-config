#!/bin/bash

# Define a mapping for numbers to specific keys
declare -A key_mapping=(
  [0]="j" [1]="f" [2]="k" [3]="d" [4]="l"
  [5]="s" [6]="ö" [7]="a" [8]="n" [9]="v"
)

# Counter for correct responses
correct_count=0
target_count=50

# Function to convert a number to corresponding keys
convert_to_keys() {
  local num=$1
  local key_sequence=""

  # Split the number into digits and map each one
  while IFS= read -r -n1 digit; do
    key_sequence+="${key_mapping[$digit]}"
  done < <(echo -n "$num")

  echo "$key_sequence"
}

# Main loop until the user has entered 50 correct key sequences
while [ $correct_count -lt $target_count ]; do
  # Generate a random number between 0 and 79
  random_number=$((RANDOM % 80))

  # Convert the number to the corresponding key sequence
  expected_keys=$(convert_to_keys "$random_number")

  # Loop until the user enters the correct key sequence or number
  while true; do
    # Output the instruction
    echo "Type the corresponding key sequence or number for: $random_number"

    # Read the user's input
    read -p "Enter the keys or number: " user_input

    # Check if the user input matches either the expected keys or the actual number
    if [[ "$user_input" == "$expected_keys" || "$user_input" == "$random_number" ]]; then
      echo "Correct!"
      ((correct_count++))
      echo "Correct responses: $correct_count/$target_count"
      break
    else
      echo "Incorrect, try again."
    fi
  done
done

echo "Congratulations! You have completed 50 correct key sequences!"
