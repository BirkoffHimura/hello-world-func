using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "Hello world."
if ($env:SampleVariable) {
  Write-Host $env:SampleVariable
  $myValue = $env:SampleVariable
} else {
  $myValue = "default"
}

$body = "Hello World!: $myValue"

Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})
