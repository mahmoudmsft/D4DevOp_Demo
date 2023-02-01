$AppId       = "c8133ef8-8bdc-4234-96e7-2723efad8c03"
$TenantId    = "6211a3ef-ba64-4a3e-ad9e-af39498729cf"
$AppSecret   = "l-17Q~-BgqX1cimjt3KTpQw_MV1f3g2ydiaLT"


$resource = "https://graph.microsoft.com"


$Body = @{    
Grant_Type    = "client_credentials"
Scope         = "https://graph.microsoft.com/.default"
client_Id     = $AppId
Client_Secret = $AppSecret
} 

$ConnectGraph = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token" `
-Method POST -Body $Body

$token = $ConnectGraph.access_token

# uri for Microsoft graph

$uri = "https://graph.microsoft.com/v1.0/users/1efcd431-60d9-443b-9666-a7614594e66c"

# uri for Azure AD graph ?? Azure AD graph is deprecated >> more info:  https://docs.microsoft.com/en-us/graph/migrate-azure-ad-graph-planning-checklist

$uri = "https://management.azure.com/subscriptions/caf16bab-b20f-449e-a538-7a1882ce6d37/providers/Microsoft.Security/securityContacts/default?api-version=2020-01-01-preview"

$Users = Invoke-RestMethod -Headers @{Authorization = "Bearer $($token)"} -Uri $uri -Method Get -ContentType 'application/json'


$list = Invoke-RestMethod -Headers @{Authorization = "Bearer $($token)"} -Uri $uri -Method Get -ContentType 'application/json'
