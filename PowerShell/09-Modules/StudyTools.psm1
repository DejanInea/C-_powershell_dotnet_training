# Summarize validated study-session objects without formatting their output.
Set-StrictMode -Version Latest
function Get-StudySummary {
  <#
  .SYNOPSIS
  Group sessions by topic and calculate counts and total minutes.
  .DESCRIPTION
  Accept pipeline objects with a nonblank Topic and nonnegative integer Minutes.
  Emit summary objects with Topic, Sessions, and TotalMinutes properties.
  #>
  [CmdletBinding()]
  param(
    [Parameter(Mandatory, ValueFromPipeline)]
    [psobject]$Session
  )
  begin {
    $items = New-Object 'System.Collections.Generic.List[object]'
  }
  process {
    if ([string]::IsNullOrWhiteSpace([string]$Session.Topic)) {
      throw 'Topic is required.'
    }
    $parsedMinutes = 0
    if (-not [int]::TryParse([string]$Session.Minutes, [ref]$parsedMinutes) -or $parsedMinutes -lt 0) {
      throw 'Minutes must be a nonnegative whole number.'
    }
    $items.Add([pscustomobject]@{
        Topic = [string]$Session.Topic
        Minutes = $parsedMinutes
    })
  }
  end {
    foreach ($group in ($items | Group-Object Topic | Sort-Object Name)) {
      [pscustomobject]@{
        Topic = $group.Name
        Sessions = $group.Count
        TotalMinutes = ($group.Group | Measure-Object -Property Minutes -Sum).Sum
      }
    }
  }
}
Export-ModuleMember -Function Get-StudySummary
