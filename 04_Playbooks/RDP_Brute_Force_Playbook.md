**RDP Brute Force Detection and Response
Created: 23.06.2026**

**1. DESCRIPTION**
This playbook covers the detection and response to RDP brute force attacks.

**3. PREREQUISITES**
- Access to Windows Event Logs (Security)
- Sysmon installed on endpoints
- Network firewall logs
- SIEM access
  
**3. DETECTION**
- Event ID 4625 (failed logons) > 10 in 5 minutes from same source
- Source IP connecting to multiple accounts
- Unusual RDP traffic patterns
  
**4. TRIAGE**
a. Verify if source IP is internal or external
b. Check if any successful logons (4624) occurred
c. Identify targeted accounts
d. Determine if targeted accounts have privileged access

**6. ANALYSIS**
a. Extract all 4625 events from source IP
b. Build timeline of events
c. Check for post-exploitation activities:
  - Event 4688 (process creation)
  - Event 7045 (service installation)
  - Sysmon Event 1 (suspicious processes)

**6. CONTAINMENT**
a. Block source IP at firewall
b. If internal, isolate affected system (disable NIC)
c. Reset passwords for targeted accounts
d. Enforce MFA if possible

**8. ERADICATION**
a. Check for installed backdoors
b. Review scheduled tasks (Event 4698)
c. Review services (Event 7045)
d. Scan for malware

**10. RECOVERY**
a. Restore from clean backup if compromised
b. Apply patches if vulnerability was exploited
c. Monitor for re-infection (30-day monitoring period)

**12. LESSONS LEARNED**
a. Was MFA enabled?
b. Are RDP ports exposed unnecessarily?
c. Should RDP be restricted to VPN only?
d. Update playbook based on findings

