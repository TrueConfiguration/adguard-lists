# Defines path to hostlist-compiler
$HOSTLIST_COMPILER = "hostlist-compiler.cmd"

# Defines input and output paths
$CONFIGS_DIR = ".\configs"
$COMPILED_DIR = ".\compiled"
$TEMP_DIR = ".\temp"

# Checks if ./temp exists, hostlist-compiler will fail otherwise.
if (-not (Test-Path -Path $TEMP_DIR -PathType Container)) {
    New-Item -Path $TEMP_DIR -ItemType Directory | Out-Null
}

# Loop files in ./configs
foreach ($CONFIG_FILE in Get-ChildItem -Path "$CONFIGS_DIR\*.json") {
    # Defines output file names
    $OUTPUT_FILE = [System.IO.Path]::GetFileNameWithoutExtension($CONFIG_FILE.Name) + ".txt"

    # Runs hostlist-compiler with config and output parameters
    & $HOSTLIST_COMPILER -c $CONFIG_FILE.FullName -o "$TEMP_DIR\$OUTPUT_FILE"
}

# Loop files in ./temp
foreach ($file in Get-ChildItem -Path $TEMP_DIR) {
    $filename = $file.Name

    # Checks if file already exists in ./compiled
    if (Test-Path -Path "$COMPILED_DIR\$filename") {
        # Compares files in ./temp and ./compiled
        $diff_output = Compare-Object -ReferenceObject (Get-Content -Path $file.FullName) -DifferenceObject (Get-Content -Path "$COMPILED_DIR\$filename")

        # Counts diff lines (because hostlist-compiler will always update created date to match fetch date)
        $num_lines_diff = ($diff_output | Where-Object { $_.InputObject -match '^\d' }).Count

        # Checks if there is more than one line updated (date line)
        if ($num_lines_diff -gt 1) {
            Copy-Item -Path $file.FullName -Destination "$COMPILED_DIR\$filename"
            Write-Host "The file $filename was copied to the compiled folder."
        }
    }
    else {
        # If file doesn't exist, create it
        Copy-Item -Path $file.FullName -Destination "$COMPILED_DIR\$filename"
        Write-Host "The file $filename was created in the compiled folder."
    }
}
