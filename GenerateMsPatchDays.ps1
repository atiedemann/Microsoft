# Define output file
"Date" | Out-File -FilePath MSPatchDays.csv -Force

# Generate Microsoft patch days for the next X month
0..150 | ForEach-Object {
    $FindNthDay = 2
    $WeekDay = 'Tuesday'
    # Get date of month
    $DateX = Get-Date -Date (Get-Date).AddMonths($_)  -Day 1 -Hour 0 -Minute 0 -Second 0

    # find next Tuesday
    while ($DateX.DayofWeek -ine $WeekDay)
    { 
        $DateX = $DateX.AddDays(1) 
    }

    # Output date of Microsoft patchday
    Get-Date -Date ($DateX.AddDays(7 * ($FindNthDay - 1))) -Format 'yyyy-MM-dd' | Out-File -Append -FilePath MSPatchDays.csv
}
