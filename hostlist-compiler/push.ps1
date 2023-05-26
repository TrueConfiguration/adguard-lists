# Fetch remote
& "C:\Program Files\Git\cmd\git.exe" fetch

# Check for local changes
$gitStatus = & "C:\Program Files\Git\cmd\git.exe" status --porcelain

if (-not [string]::IsNullOrWhiteSpace($gitStatus)) {
    # Add local changes
    & "C:\Program Files\Git\cmd\git.exe" add .

    # Set commit message
    $commit_message = "Updated in $((Get-Date).ToString('yyyy-MM-dd'))"

    # Commit changes
    & "C:\Program Files\Git\cmd\git.exe" commit -S -m $commit_message

    # Push changes
    & "C:\Program Files\Git\cmd\git.exe" push
}
