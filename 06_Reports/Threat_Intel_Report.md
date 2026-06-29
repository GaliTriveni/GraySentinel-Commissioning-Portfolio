**Date:** 2026-06-22  
**Analyst:** Triveni  

---

## Objective
Analyze Windows Security logs and Sysmon events to identify adversary tactics, techniques, and procedures (TTPs).  
Correlate findings with MITRE ATT&CK framework and provide actionable intelligence for detection and response.

---

## Findings
- **Failed Logon Attempts (Event ID 4625):**  
  - Multiple failed logons detected for user *emma*.  
  - Source network address not recorded, logon type 3 (network logon).  
  - Indicates possible brute force or credential misuse.  

- **Sysmon Installation:**  
  - Sysmon64 service running successfully, providing enhanced process and file logging.  

- **Encoded PowerShell Commands:**  
  - Detected suspicious PowerShell execution with `-EncodedCommand`.  
  - Example: `VwByAGkAdABlAC0ASABvAHMAdAAgACcARwByAGEAeQBTAGUAbgB0AGkAbgBlAGwAJwA=`  
  - Indicates obfuscation attempts by adversaries.  

- **Timeline Reconstruction:**  
  - Combined Security (4624, 4625, 4688) and Sysmon (ID 1) events.  
  - Revealed sequence of successful logons followed by PowerShell execution.  

- **Sysmon Collector Script:**  
  - `sysmon_collector.ps1` executed successfully.  
  - Collected 20 events in the last hour, including 3 PowerShell-related events.  
  - Report saved to `sysmon_events_20260622_234517.csv`.  

---

## Evidence
Screenshots uploaded and referenced:

  <img width="765" height="287" alt="Failed logon" src="https://github.com/user-attachments/assets/caf7e9df-043f-4a0e-add3-218962268ad7" />
 
  *Shows Event ID 4625 with failed logon for user emma.*

  <img width="567" height="131" alt="Sysmon status" src="https://github.com/user-attachments/assets/f9f87f5c-416f-4cd5-953b-abf91a346030" />

  *Confirms Sysmon64 service running successfully.*

  <img width="812" height="532" alt="Encoded Powershell" src="https://github.com/user-attachments/assets/39094e3a-e140-47e3-a455-0d97658255c8" />

  *Evidence of obfuscated PowerShell execution with `-EncodedCommand`.*

 <img width="746" height="532" alt="Timeline Construction" src="https://github.com/user-attachments/assets/c3060b0e-8dc2-47cf-ac7d-de237ca8019a" />
 
  *Displays combined Security and Sysmon events for attack correlation.*

  <img width="747" height="142" alt="Sysmon collector script" src="https://github.com/user-attachments/assets/00530696-b6ec-47c9-9ed7-624ee3463bd9" />

  *Shows execution of `sysmon_collector.ps1` and event collection results.*


---

## Conclusion
Threat intelligence analysis revealed:  
- **Credential Access:** Failed logons suggest brute force attempts.  
- **Execution:** Encoded PowerShell commands indicate obfuscation and possible malware execution.  
- **Persistence/Discovery:** Timeline reconstruction shows adversary activity chaining logons with PowerShell.  

### Recommendations
- Implement account lockout policies to mitigate brute force attempts.  
- Monitor for PowerShell `-EncodedCommand` usage.  
- Use Sysmon to enrich detection of suspicious process creation.  
- Regularly review timeline correlations to identify multi-stage attacks.  

