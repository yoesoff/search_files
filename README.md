# search_files
Here’s a Bash script that searches for files containing specific words in a given folder. It will list the file names and the lines where the words appear. The script is flexible, allowing you to specify multiple words (comma-separated) as arguments.

Explanation:

    Input Parameters
        The first parameter is the folder path.
        The second parameter is a comma-separated list of words.
    Validation
        The script checks if at least two arguments are given.
        It verifies whether the folder exists.
    Search Process
        The words are converted into a regex pattern (word1|word2|word3...).
        The grep command is used recursively (-r), case-insensitively (-i), and with line numbers (-n).
        The output is formatted with colors for better readability.
Usage
./search_files.sh /path/to/folder error,fail,exception
