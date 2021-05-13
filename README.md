**HOW TO MANAGE O365 DISTRIBUTION LISTS WITH A LEVEL OF SECURITY**

It's important to prevent sometimes distribution lists to be publically available and reachable. 
To comply with this kind of policies, Microsoft (in Exchange) allows admins to block external senders to email the distributions list (DL). 
The downside is sometime some departments or business OU need the DL to be openened for external senders. In this situation, there are 3 paths :

   **- PATH 1 :** Unblock the DL and allow all external senders to email the DL. Secure and only internal - Downside, if some OU wants external com. they have to use shared mailboxes

   **- PATH 2 :** Leave the DL blocked and only allow some known senders to email the DL by adding the known senders as Mail Contacts in EAC. This scenario is best if the specific senders are known and their number will not grow in significant way in the future. Mail contacts are considered as internal but cannot access company ressources.

   **- PATH 3 :** Allow external senders, but use Mail flow rules to only allow emails from specific domains and targeted DLs. This is suitable in sutuation where the organisation will have lot of exchange with a partner, and where emails could be sent by anyone in the other organisation. The code attached explain how to do it from Powershell. 

What are other paths that you could or maybe have looked for :

   _- USING REMOTE DOMAINS :_
    A remote domain allows admins to add a domain that Exchange will treat as internal and overide some settings such as :
        - Out of office messages
        - Automatic replies
        - Automatic forwarding
        - Delivery reports
        - Content filtering and matching
    However, Remote domain cannot override the blockage to receive emails on DLs and thus emails coming from a Remote domain will be blocked by the DL policy. 

   _- USE MAIL FLOW TO FILTER AND BYBASS THE BLOCKAGE ON A DL :_
    Somehow, the setting on a DL to block external emails have a high a priority level that cannot be seen in the mail flow trace, and will be treated before any transport rule you can create in the mail flow. Hence, if you leave the setting to receive external emails OFF and create a rule to accept emails only from a given domain, the rule won't work and the incoming email will be rejected even if the email matches the rule. ###Only workaround is to allow external senders on the DL, then use a Transport rule in mail flow to filter the emails reaching the DL.

   _- USE A RANDOM INTERNAL MAILBOX AS BRIDGE :_
    One good idea could be to use a mailbox to receive the emails, then apply mailflow rule on the mailbox, then once received emails are filtered forward them to the DL. Unfortunately, the automatic forward/or redirect from a mailbox to DL will not work as the forwarding feature keeps the original sender in the message propreties, therefore the DL setting will block the incoming email. 

In the attached code, You will find the code for PATH 3 and that will resolve your problem. 
I will be happy to read your contributions or comments. 
