# Fetch remote
& git fetch

# Check for local changes
$gitStatus = & git status --porcelain

if (-not [string]::IsNullOrWhiteSpace($gitStatus)) {
    # Add local changes
    & git add .

    # Set commit message
    $commit_message = "Updated in $((Get-Date).ToString('yyyy-MM-dd'))"

    # Commit changes
    & git commit -S -m $commit_message

    # Push changes
    & git push
}
