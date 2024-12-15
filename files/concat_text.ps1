# Define the directory containing the .txt files
$sourceDirectory = "C:\Users\blah\Desktop\chats\"

# Define the path for the output file
$outputFile = "C:\Users\blah\Desktop\output.txt"

# Get all .txt files in the directory
$txtFiles = Get-ChildItem -Path $sourceDirectory -Filter *.txt

# Initialize an empty string to store concatenated text
$combinedText = ""

# Loop through each file, read the content, and append it to the combined text
foreach ($file in $txtFiles) {
    $fileContent = Get-Content -Path $file.FullName
    $combinedText += $fileContent + "`n" # Add a newline after each file's content
}

# Write the combined text to the output file
Set-Content -Path $outputFile -Value $combinedText

# Print the combined text to the console
Write-Output $combinedText
