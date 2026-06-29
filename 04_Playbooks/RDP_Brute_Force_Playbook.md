**RDP Brute Force Detection and Response
Created: 23.06.2026**

**DESCRIPTION**

This playbook covers the detection and response to RDP brute force attacks.

**PREREQUISITES**

- Access to Windows Event Logs (Security)
- Sysmon installed on endpoints
- Network firewall logs
- SIEM access
  
**DETECTION**

- Event ID 4625 (failed logons) > 10 in 5 minutes from same source
- Source IP connecting to multiple accounts
- Unusual RDP traffic patterns
  
**TRIAGE**

- Verify if source IP is internal or external
- Check if any successful logons (4624) occurred
- Identify targeted accounts
- Determine if targeted accounts have privileged access

**ANALYSIS**

- Extract all 4625 events from source IP
- Build timeline of events
- Check for post-exploitation activities:
    - Event 4688 (process creation)
    - Event 7045 (service installation)
    - Sysmon Event 1 (suspicious processes)

**CONTAINMENT**

- Block source IP at firewall
- If internal, isolate affected system (disable NIC)
- Reset passwords for targeted accounts
- Enforce MFA if possible

**ERADICATION**

- Check for installed backdoors
- Review scheduled tasks (Event 4698)
- Review services (Event 7045)
- Scan for malware

**RECOVERY**

- Restore from clean backup if compromised
- Apply patches if vulnerability was exploited
- Monitor for re-infection (30-day monitoring period)

**12. LESSONS LEARNED**
- Was MFA enabled?
- Are RDP ports exposed unnecessarily?
- Should RDP be restricted to VPN only?
- Update playbook based on findings

