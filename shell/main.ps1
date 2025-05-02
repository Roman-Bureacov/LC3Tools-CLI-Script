$assembler = "../core/assembler.exe" # assembler and binary converter
$simulator = "../core/simulator.exe"
$bin = "../working/bin"
$asm = "../working/asm"

function Assemble-File {
    param (
        [string]$working_dir,
        [string]$file_name,
        [string]$extension
        ) 

    $full_path = Join-Path $working_dir "$file_name$extension"
    # does this fiel exist?
    if (Test-Path $full_path) {
        Write-Host "Calling Assembler..."
        & $assembler $full_path
    } else {
        Write-Host "Failed to find file: $full_path"
        return
    }

    # did this file construct?
    $file_obj = Join-Path $working_dir "$file_name.obj"
    if (Test-Path $file_obj) {
        # open simulator in new window
        Write-Host "Opening simulator...`n"
        Start-Process powershell.exe -ArgumentList "-Command", $simulator, $file_obj
    } else {
        Write-Host "object file not found: $file_obj"
    }

}

# program start

Write-Host "Welcome!"

$userInput = Read-Host "Provide the file name ('fileName [bin|asm]')"

do {

    # analyze input, is it bin or asm?
    $input_split = $userInput.split(' ', 2) # split into two parts
    $file_name = $input_split[0].toLower().split('.', 2)[0] # get the file name without extension
    $file_type = if ($input_split.Count -eq 2) { $input_split[1].ToLower() } else { "asm" }


    switch ($file_type) {
        "asm" { 
            Assemble-File $asm $file_name ".asm"
        }
        "bin" {
            Assemble-File $bin $file_name ".bin"
        }
        Default { Write-Host "Unrecognize file type, must be 'bin' or 'asm'" }
    }

    $userInput = Read-Host "Provide the file name ('filName [bin|asm]') or q to quit"

} while ($userInput -ine "q") # while insensitive case not-equal to q



