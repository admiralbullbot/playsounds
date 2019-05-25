## To convert all of a single streamer's playsounds at once:

    ./mysql-dump.bash database_name
    ./format-add.bash $(date +%Y-%m-%d) edit > streamername.edits.tmp

You can then copy paste each line of the `streamername.edits.tmp` file into chat
if the line count is low, or alternatively put the contents on
[pastebin.com](https://pastebin.com) and then, as the bot operator, run in chat,
inserting your pastebin raw link in the command:

    !eval bot.eval_from_file(event, 'https://pastebin.com/raw/linkid')

And the bot will update all playsound links!
