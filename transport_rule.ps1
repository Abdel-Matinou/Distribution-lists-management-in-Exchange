
#Replace the following values
$DLs_Emailaddresses = "Value1", "value 2"
$AllowedDomains = "Value", "Value2", "Add your own domains + external domains"
$Addressfor_IncidentReport = "Type an email address"
$TransportRule_Name = "Type the transportRule name"

# The following command will put any message to the DL in Quarantine or Delete the message without NDR, expect emails coming from allowed domains

New-TransportRule 
    -name $TransportRule_Name
    -AnyOfToCcHeader $DLs_Emailaddresses 
    -Quarantine <Boolean>   # True or False - choose if you want the message to be quarantined
    -DeleteMessage <Boolean>  # True or False - choose if you want the message to be deleted without notifying the sender, I recommend this setting ON to prevent external senders to know if the email exists or not
    -ExceptIfSenderDomainIs $AllowedDomains 
    -Mode "Auditandnotify | Enforce" # Testmode or Apply the rule, First test and use Set-TransportRule to change the settings
    -GenerateIncidentReport $Addressfor_IncidentReport
    -IncidentReportContent ruledetections, sender, recipients, cc, attachOriginalMail #this will parameter allows you to include all the details needed in the delivery report.
