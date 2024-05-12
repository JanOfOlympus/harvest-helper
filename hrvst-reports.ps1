function Show-Menu
{
     param (
           [string]$option = "My Menu"
     )
     Write-Host "1: Project based report."
     Write-Host "2: Task based report."
     Write-Host "Q: Quit."
}

$sow = Get-Date (Get-Date).AddDays(-4) -Format "yyyy-MM-dd"
$eow = Get-Date -Format "yyyy-MM-dd"

function GenerateProjectBasedReport {
    Write-Host "Report from $sow to $eow"
    hrvst reports time-reports projects-time-report --from $sow --to $eow
}

function GenerateTaskBasedReport {
    Write-Host "Report from $sow to $eow"
    hrvst reports time-reports tasks-time-report --from $sow --to $eow
}

do
{
     Show-Menu
     $choice = Read-Host "Please make a selection"
     switch ($choice)
     {
           '1' { GenerateProjectBasedReport } 
           '2' { GenerateTaskBasedReport} 
           'q' { return }
     }
     pause
}
until ($input -eq 'q')