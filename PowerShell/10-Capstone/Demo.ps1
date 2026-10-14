[CmdletBinding(SupportsShouldProcess)]
param(
  [ValidateSet('Help', 'List', 'Add', 'Complete', 'Remove')]
  [string]$Action = 'Help',
  [string]$Title,
  [int]$Id,
  [string]$BaseUri = 'http://127.0.0.1:5080'
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ($Action -eq 'Help') {
  Write-Output ('Start DotNet10/10-Capstone, then use -Action List, Add -Title text, ' +
      'Complete -Id n, or Remove -Id n.')
  return
}
$uri = $BaseUri.TrimEnd('/') + '/tasks'
switch ($Action) {
  'List' {
    Invoke-RestMethod -Uri $uri -Method Get
  }
  'Add' {
    if ([string]::IsNullOrWhiteSpace($Title)) {
      throw 'Supply -Title with nonempty text.'
    }
    if ($PSCmdlet.ShouldProcess($uri, 'Add task')) {
      $body = @{
        title = $Title
      } | ConvertTo-Json
      $request = @{
        Uri = $uri
        Method = 'Post'
        ContentType = 'application/json; charset=utf-8'
        Body = [System.Text.Encoding]::UTF8.GetBytes($body)
      }
      Invoke-RestMethod @request
    }
  }
  'Complete' {
    if ($Id -lt 1) {
      throw 'Supply a positive -Id.'
    }
    if ($PSCmdlet.ShouldProcess("$uri/$Id/complete", 'Complete task')) {
      Invoke-RestMethod -Uri "$uri/$Id/complete" -Method Put
    }
  }
  'Remove' {
    if ($Id -lt 1) {
      throw 'Supply a positive -Id.'
    }
    if ($PSCmdlet.ShouldProcess("$uri/$Id", 'Remove task')) {
      Invoke-RestMethod -Uri "$uri/$Id" -Method Delete
      Write-Output "Removed task $Id"
    }
  }
}
