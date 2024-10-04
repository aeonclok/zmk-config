#!/bin/bash

# Array of commands and motions
commands=("d" "c" "x" "y")
motions=("j" "k" "w" "e" "b")

# Counter for correct commands
correct_count=0
target_count=50

# Loop until the user has entered 50 correct commands
while [ $correct_count -lt $target_count ]; do
  # Randomly select a command from the array
  command=${commands[$RANDOM % ${#commands[@]}]}

  # Randomly select a number between 2 and 59
  number=$((RANDOM % 58 + 2))

  # Randomly select a motion from the array
  motion=${motions[$RANDOM % ${#motions[@]}]}

  # Construct the vim command
  vim_command="$command$number$motion"

  # Loop until the user enters the correct command
  while true; do
    # Output the command
    echo "Type this Vim command: $vim_command"

    # Read the user's input
    read -p "" user_input

    # Check if the user input matches the generated command
    if [[ "$user_input" == "$vim_command" ]]; then
      echo "Correct!"
      ((correct_count++))
      echo "Correct commands: $correct_count/$target_count"
      break
    else
      echo "Incorrect, try again."
    fi
  done
done

echo "Congratulations! You have completed 50 correct Vim commands!"
