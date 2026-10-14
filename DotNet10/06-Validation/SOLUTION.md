# 06-Validation exercise solution

Make two requests: one valid and one with minutes=0. Catch the expected client exception for the invalid request.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
try {
  $body = @{
    topic = 'CSharp'
    minutes = 0
  } | ConvertTo-Json
  $request = @{
    Uri = 'http://127.0.0.1:5082/sessions'
    Method = 'Post'
    ContentType = 'application/json'
    Body = $body
  }
  Invoke-RestMethod @request
} catch {
  Write-Output "Expected validation failure: $($_.Exception.Message)"
}
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
