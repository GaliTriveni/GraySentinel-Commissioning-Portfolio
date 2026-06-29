# Reconnaissance Report 

**Date:** 2026-06-15  
**Analyst:** Triveni 

## Objective
Perform reconnaissance using Nmap to identify open ports, services, and potential attack surfaces.  
Demonstrate use of different scan types, NSE scripts, and evasion techniques.

## Findings
- **TCP Ports:** 135 (MSRPC), 139 (NetBIOS), 445 (SMB) → confirmed open.  
- **UDP Ports:** 137 open, 138 open|filtered → NetBIOS services detected.  
- **SMB Enumeration:** Port 445 active, but enumeration blocked (no OS/share/user info).  
- **RDP Enumeration:** Port 3389 closed → RDP not exploitable.  
- **Vulnerability Scan:** No confirmed exploitable SMB vulnerabilities, but SMB remains the main attack surface.  
- **Firewall Behavior:** Dropped non-standard probes (FIN, NULL, XMAS), allowed normal TCP connections.  
  
## Evidence 
<img width="810" height="467" alt="Evasion Technique Logs" src="https://github.com/user-attachments/assets/a4d506ad-6ab5-4bc9-bb4d-f2993f5df32e" />
  
  *Execution of custom `nmap_automator.sh` script against 192.168.56.102, listing open ports and SMB negotiation results.*
<img width="810" height="576" alt="smb_enum" src="https://github.com/user-attachments/assets/d9996160-aa61-4448-9d12-8eb921436790" />
  
  *Demonstrates SMB service exposure on port 445 with blocked enumeration attempts.*
<img width="687" height="227" alt="udp_scan" src="https://github.com/user-attachments/assets/8af8e36e-7a7d-44ff-b0ed-253c3da7dd0c" />
  
  *Shows UDP ports 137 open and 138 open|filtered, confirming NetBIOS activity.*

## Conclusion
Reconnaissance revealed that the host is hardened against certain probes but still exposes **SMB services** as the primary attack surface.  
Future exploitation attempts should focus on SMB misconfigurations or credential attacks.  
#Place Holder file
