# playsounds
Static playsound files

# Importing/Adding playsounds from this repository

Check out the [import-files](./import-files) directory and run the whole file or parts of it
to add the playsounds stored in this repository.

Command to import a single sample:

    !add playsound doot https://pajbot.github.io/playsounds/files/common/doot.ogg

Command to import an entire file:

    !eval bot.eval_from_file(event, 'https://pajbot.github.io/playsounds/import-files/import-file.txt')

# Add a file as a pull request

Clone the repository and run in a bash terminal:

    ./add-playsound.bash playsoundname https://www.example.com/audio.mp3

Then commit all the changes and make a pull request

Please keep the playsound name under 20 characters and lowercase letters only.
