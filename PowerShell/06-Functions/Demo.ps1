[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function ConvertTo-StudyHours {
  <#
  .SYNOPSIS
  Convert each pipeline minute value into a structured hours result.
  #>
  [CmdletBinding()]
  param(
    [Parameter(Mandatory, ValueFromPipeline)]
    [ValidateRange(0, 100000)]
    [double]$Minutes
  )
  process {
    # Return data on the success stream, one object per input.
    [pscustomobject]@{
      Minutes = $Minutes
      Hours = $Minutes / 60
    }
  }
}
30, 60, 90 | ConvertTo-StudyHours |
  ForEach-Object {
  '{0} minutes = {1} hours' -f $_.Minutes, $_.Hours
}
