# Windows 11 Version 25H2 Security Configuration Profiles

This document lists the security configuration profiles and baseline settings available for Windows 11 version 25H2 in Microsoft Intune.

**Version:** Windows 11 25H2  
**Release Date:** September 2025  
**Last Updated:** November 2025

## Overview

The Windows 11 version 25H2 security baseline reflects Microsoft's recommended security configurations for enterprise environments. The baseline introduces changes focused on stronger network security, attack surface reduction, and legacy protocol elimination.

## Download Security Baseline

The complete security baseline package can be downloaded from:
- **Microsoft Security Compliance Toolkit:** https://aka.ms/SCT

## Key Changes in 25H2 Baseline

### Major Security Enhancements
1. **Print Spooler Security** - Adds "RESTRICTED SERVICES\PrintSpoolerService" to securely enable print service impersonation
2. **NTLM Auditing Improvements** - NTLM usage auditing enabled by default for better visibility into identity-related security risks
3. **Attack Surface Reduction** - New audit rule to "Block process creations originating from PSExec and WMI commands"
4. **Network Security** - Disables NetBIOS name resolution by default, retiring legacy protocol exposure
5. **Internet Explorer 11 Decommissioning** - Disables IE11 launch via COM automation
6. **Print Security** - Introduces "Require IPPS for IPP printers" to ensure encrypted communication with network printers

---

## Security Profile Categories

### 1. Attack Surface Reduction (ASR) Rules

ASR rules help prevent malware and potentially unwanted applications from running.

#### Policy Name: Block process creations originating from PSExec and WMI commands
- **GUID:** d1e49aac-8f56-4280-b9ba-993a6d77406c
- **Default Mode:** Audit
- **Options:**
  - Not Configured
  - Block
  - Audit
  - Warn
- **Description:** Helps detect suspicious remote activity and potential lateral movement by monitoring PSExec and WMI command execution

#### Policy Name: Block executable content from email client and webmail
- **Options:**
  - Not Configured
  - Block
  - Audit
  - Warn
- **Description:** Prevents Outlook and webmail from launching executable files

#### Policy Name: Block all Office applications from creating child processes
- **Options:**
  - Not Configured
  - Block
  - Audit
  - Warn
- **Description:** Prevents Office apps from creating potentially malicious child processes

#### Policy Name: Block Office applications from creating executable content
- **Options:**
  - Not Configured
  - Block
  - Audit
  - Warn
- **Description:** Prevents Office apps from creating executable content

#### Policy Name: Block Office applications from injecting code into other processes
- **Options:**
  - Not Configured
  - Block
  - Audit
  - Warn
- **Description:** Prevents code injection attacks via Office apps

#### Policy Name: Block JavaScript or VBScript from launching downloaded executable content
- **Options:**
  - Not Configured
  - Block
  - Audit
  - Warn
- **Description:** Prevents scripts from launching downloaded executables

#### Policy Name: Block execution of potentially obfuscated scripts
- **Options:**
  - Not Configured
  - Block
  - Audit
  - Warn
- **Description:** Detects and blocks suspicious obfuscated scripts

#### Policy Name: Block Win32 API calls from Office macros
- **Options:**
  - Not Configured
  - Block
  - Audit
  - Warn
- **Description:** Prevents Office macros from making dangerous Win32 API calls

#### Policy Name: Block credential stealing from the Windows local security authority subsystem (lsass.exe)
- **Options:**
  - Not Configured
  - Block
  - Audit
  - Warn
- **Description:** Protects against credential theft attacks

#### Policy Name: Block abuse of exploited vulnerable signed drivers
- **Options:**
  - Not Configured
  - Block
  - Audit
  - Warn
- **Description:** Prevents loading of known vulnerable drivers

#### Policy Name: Block Adobe Reader from creating child processes
- **Options:**
  - Not Configured
  - Block
  - Audit
  - Warn
- **Description:** Prevents Adobe Reader from spawning child processes

#### Policy Name: Block persistence through WMI event subscription
- **Options:**
  - Not Configured
  - Block
  - Audit
  - Warn
- **Description:** Prevents malware persistence via WMI

#### Policy Name: Block untrusted and unsigned processes that run from USB
- **Options:**
  - Not Configured
  - Block
  - Audit
  - Warn
- **Description:** Prevents execution of untrusted USB content

#### Policy Name: Block Office communication application from creating child processes
- **Options:**
  - Not Configured
  - Block
  - Audit
  - Warn
- **Description:** Prevents communication apps like Teams from creating child processes

#### Policy Name: Use advanced protection against ransomware
- **Options:**
  - Not Configured
  - Enable
  - Audit
- **Description:** Provides additional ransomware protection

---

### 2. Microsoft Defender Antivirus

Configuration policies for Windows Defender Antivirus protection.

#### Policy Name: Turn on real-time protection
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Enables continuous malware scanning

#### Policy Name: Turn on behavior monitoring
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Monitors system behavior for suspicious activity

#### Policy Name: Scan all downloaded files and attachments
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Scans all downloaded content

#### Policy Name: Turn on script scanning
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Scans scripts during execution

#### Policy Name: Configure cloud protection level
- **Options:**
  - Not Configured
  - Default
  - High
  - High+
  - Zero tolerance
- **Recommended:** High
- **Description:** Sets the aggressiveness of cloud-based protection

#### Policy Name: Configure extended cloud check
- **Options:**
  - Not Configured
  - 0 seconds (default)
  - 10-50 seconds
- **Recommended:** 50 seconds
- **Description:** Time allowed for cloud analysis of suspicious files

#### Policy Name: Turn on network protection
- **Options:**
  - Not Configured
  - Enabled (Block mode)
  - Enabled (Audit mode)
  - Disabled
- **Recommended:** Enabled (Block mode)
- **Description:** Prevents access to malicious domains and IP addresses

#### Policy Name: Enable tamper protection
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Prevents unauthorized changes to security settings

#### Policy Name: Configure Defender Exploit Guard network protection
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
  - Audit Mode
- **Recommended:** Enabled
- **Description:** Protects against network-based exploits

---

### 3. Microsoft Defender Firewall

Firewall configuration policies for different network profiles.

#### Policy Name: Domain Profile - Enable Firewall
- **Options:**
  - Not Configured
  - Yes
  - No
- **Recommended:** Yes
- **Description:** Enables firewall for domain networks

#### Policy Name: Private Profile - Enable Firewall
- **Options:**
  - Not Configured
  - Yes
  - No
- **Recommended:** Yes
- **Description:** Enables firewall for private networks

#### Policy Name: Public Profile - Enable Firewall
- **Options:**
  - Not Configured
  - Yes
  - No
- **Recommended:** Yes
- **Description:** Enables firewall for public networks

#### Policy Name: Domain Profile - Block all incoming connections
- **Options:**
  - Not Configured
  - Yes
  - No
- **Recommended:** No
- **Description:** Blocks all inbound connections regardless of rules

#### Policy Name: Domain Profile - Apply local firewall rules
- **Options:**
  - Not Configured
  - Yes
  - No
- **Recommended:** No (for centralized management)
- **Description:** Allows local administrators to create firewall rules

#### Policy Name: Domain Profile - Apply local connection security rules
- **Options:**
  - Not Configured
  - Yes
  - No
- **Recommended:** No (for centralized management)
- **Description:** Allows local administrators to create IPsec rules

#### Policy Name: Public Profile - Block all incoming connections
- **Options:**
  - Not Configured
  - Yes
  - No
- **Recommended:** Yes
- **Description:** Blocks all inbound connections on public networks

#### Policy Name: Public Profile - Apply local firewall rules
- **Options:**
  - Not Configured
  - Yes
  - No
- **Recommended:** No
- **Description:** Prevents local firewall rule creation on public networks

#### Policy Name: Disable NetBIOS name resolution on all network adapters
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Disables legacy NetBIOS protocol to reduce attack surface

---

### 4. BitLocker Drive Encryption

BitLocker configuration for drive encryption.

#### Policy Name: Require device encryption
- **Options:**
  - Not Configured
  - Require
- **Recommended:** Require
- **Description:** Enforces BitLocker encryption on capable devices

#### Policy Name: Require additional authentication at startup
- **Options:**
  - Not Configured
  - Allow TPM
  - Require TPM
  - Allow TPM + PIN
  - Require TPM + PIN
  - Allow TPM + Startup Key
  - Require TPM + Startup Key
- **Recommended:** Require TPM (minimum), TPM + PIN (high security)
- **Description:** Configures startup authentication requirements

#### Policy Name: Configure TPM startup PIN
- **Options:**
  - Not Configured
  - Allow
  - Require
  - Disallow
- **Recommended:** Allow or Require
- **Description:** Controls use of PIN for TPM startup

#### Policy Name: Configure encryption method for operating system drives
- **Options:**
  - Not Configured
  - AES 128-bit CBC
  - AES 256-bit CBC
  - AES 128-bit XTS
  - AES 256-bit XTS
- **Recommended:** AES 256-bit XTS
- **Description:** Sets encryption algorithm for OS drives

#### Policy Name: Configure encryption method for fixed data drives
- **Options:**
  - Not Configured
  - AES 128-bit CBC
  - AES 256-bit CBC
  - AES 128-bit XTS
  - AES 256-bit XTS
- **Recommended:** AES 256-bit XTS
- **Description:** Sets encryption algorithm for fixed drives

#### Policy Name: Configure encryption method for removable data drives
- **Options:**
  - Not Configured
  - AES 128-bit CBC
  - AES 256-bit CBC
  - AES 128-bit XTS
  - AES 256-bit XTS
- **Recommended:** AES 256-bit CBC (for compatibility)
- **Description:** Sets encryption algorithm for removable drives

#### Policy Name: Enable network unlock at startup
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled (for enterprise scenarios)
- **Description:** Allows automatic unlock when connected to trusted network

---

### 5. Credential Protection

Policies to protect user and system credentials.

#### Policy Name: Enable Windows Defender Credential Guard
- **Options:**
  - Not Configured
  - Enabled with UEFI lock
  - Enabled without lock
  - Disabled
- **Recommended:** Enabled with UEFI lock
- **Description:** Uses virtualization-based security to protect credentials

#### Policy Name: Prevent device metadata retrieval from the Internet
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled (for high security environments)
- **Description:** Prevents downloading device metadata

#### Policy Name: Turn off downloading of print drivers over HTTP
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Prevents downloading printer drivers via HTTP

#### Policy Name: Require IPPS for IPP printers
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Requires TLS encryption for network printers

---

### 6. User Rights Assignment

Configure user rights and privileges.

#### Policy Name: Access this computer from the network
- **Options:** User/Group list
- **Recommended:** Administrators, Authenticated Users
- **Description:** Controls who can access the computer from network

#### Policy Name: Act as part of the operating system
- **Options:** User/Group list
- **Recommended:** (None)
- **Description:** Powerful privilege, typically left empty

#### Policy Name: Allow log on locally
- **Options:** User/Group list
- **Recommended:** Administrators, Users
- **Description:** Controls who can log on at the device

#### Policy Name: Allow log on through Remote Desktop Services
- **Options:** User/Group list
- **Recommended:** Administrators, Remote Desktop Users
- **Description:** Controls Remote Desktop access

#### Policy Name: Back up files and directories
- **Options:** User/Group list
- **Recommended:** Administrators, Backup Operators
- **Description:** Allows backing up files and directories

#### Policy Name: Change the system time
- **Options:** User/Group list
- **Recommended:** Administrators, LOCAL SERVICE
- **Description:** Controls who can change system time

#### Policy Name: Create a token object
- **Options:** User/Group list
- **Recommended:** (None)
- **Description:** Powerful privilege, typically left empty

#### Policy Name: Debug programs
- **Options:** User/Group list
- **Recommended:** Administrators
- **Description:** Controls who can debug and analyze processes

#### Policy Name: Deny access to this computer from the network
- **Options:** User/Group list
- **Recommended:** Guests, Local account
- **Description:** Denies network access to specified accounts

#### Policy Name: Deny log on as a batch job
- **Options:** User/Group list
- **Recommended:** Guests
- **Description:** Prevents batch job execution

#### Policy Name: Deny log on as a service
- **Options:** User/Group list
- **Recommended:** Guests
- **Description:** Prevents service creation with specified accounts

#### Policy Name: Deny log on locally
- **Options:** User/Group list
- **Recommended:** Guests
- **Description:** Prevents local logon

#### Policy Name: Deny log on through Remote Desktop Services
- **Options:** User/Group list
- **Recommended:** Guests, Local account
- **Description:** Prevents Remote Desktop access

#### Policy Name: Impersonate a client after authentication
- **Options:** User/Group list
- **Recommended:** Administrators, LOCAL SERVICE, NETWORK SERVICE, SERVICE, PrintSpoolerService
- **Description:** Allows programs to impersonate users

#### Policy Name: Load and unload device drivers
- **Options:** User/Group list
- **Recommended:** Administrators
- **Description:** Controls driver installation

#### Policy Name: Manage auditing and security log
- **Options:** User/Group list
- **Recommended:** Administrators
- **Description:** Controls access to security logs

---

### 7. Auditing and Logging

Configure auditing policies for security events.

#### Policy Name: Audit Account Logon Events
- **Options:**
  - Not Configured
  - Success
  - Failure
  - Success and Failure
- **Recommended:** Success and Failure
- **Description:** Audits authentication attempts

#### Policy Name: Audit Account Management
- **Options:**
  - Not Configured
  - Success
  - Failure
  - Success and Failure
- **Recommended:** Success and Failure
- **Description:** Audits account creation/modification

#### Policy Name: Audit Detailed Tracking
- **Options:**
  - Not Configured
  - Success
  - Failure
  - Success and Failure
- **Recommended:** Success
- **Description:** Audits process creation and other detailed events

#### Policy Name: Audit Logon Events
- **Options:**
  - Not Configured
  - Success
  - Failure
  - Success and Failure
- **Recommended:** Success and Failure
- **Description:** Audits logon/logoff events

#### Policy Name: Audit Object Access
- **Options:**
  - Not Configured
  - Success
  - Failure
  - Success and Failure
- **Recommended:** Failure
- **Description:** Audits object access attempts

#### Policy Name: Audit Policy Change
- **Options:**
  - Not Configured
  - Success
  - Failure
  - Success and Failure
- **Recommended:** Success
- **Description:** Audits policy changes

#### Policy Name: Audit Privilege Use
- **Options:**
  - Not Configured
  - Success
  - Failure
  - Success and Failure
- **Recommended:** Failure
- **Description:** Audits privilege usage

#### Policy Name: Audit System Events
- **Options:**
  - Not Configured
  - Success
  - Failure
  - Success and Failure
- **Recommended:** Success and Failure
- **Description:** Audits system-level events

#### Policy Name: Audit Group Membership
- **Options:**
  - Not Configured
  - Success
  - Failure
  - Success and Failure
- **Recommended:** Success
- **Description:** Audits group membership information in logon tokens (NEW in 25H2)

#### Policy Name: Include command line in process creation events
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Logs command line parameters for process creation events

---

### 8. NTLM Security

NTLM authentication security policies.

#### Policy Name: Network security: Restrict NTLM: Audit NTLM authentication in this domain
- **Options:**
  - Not Configured
  - Enable all
  - Disable all
  - Enable for domain accounts to domain servers
  - Enable for domain accounts
  - Enable for domain servers
- **Recommended:** Enable all (NEW default in 25H2)
- **Description:** Audits NTLM authentication usage

#### Policy Name: Network security: Restrict NTLM: Outgoing NTLM traffic to remote servers
- **Options:**
  - Not Configured
  - Allow all
  - Audit all
  - Deny all
- **Recommended:** Audit all
- **Description:** Controls outgoing NTLM traffic

#### Policy Name: Network security: Restrict NTLM: Incoming NTLM traffic
- **Options:**
  - Not Configured
  - Allow all
  - Deny all domain accounts
  - Deny all accounts
- **Recommended:** Allow all (consider Deny for high security)
- **Description:** Controls incoming NTLM traffic

---

### 9. SMB/CIFS Security

Server Message Block security policies.

#### Policy Name: SMBv1 client driver
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
  - Automatic
- **Recommended:** Disabled
- **Description:** Controls SMBv1 client (legacy, insecure)

#### Policy Name: Configure SMB v1 server
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Disabled
- **Description:** Controls SMBv1 server (legacy, insecure)

#### Policy Name: Digitally sign communications (always)
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Requires digital signatures for SMB communication

#### Policy Name: Encrypt or sign all secure channel traffic (always)
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Requires encryption or signing for secure channels

#### Policy Name: SMB guest authentication
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Disabled
- **Description:** Prevents guest authentication to SMB servers

---

### 10. Application Control

Policies for controlling application execution.

#### Policy Name: Configure Windows Defender Application Control
- **Options:**
  - Not Configured
  - Enforce
  - Audit
- **Recommended:** Audit (initially), then Enforce
- **Description:** Controls which applications can run

#### Policy Name: Turn off app recommendations
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled (for enterprise)
- **Description:** Disables app suggestions in Start Menu

#### Policy Name: Prevent non-admin users from installing packaged Windows apps
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Restricts app installation to administrators

---

### 11. Windows AI and Privacy (NEW in 25H2)

Policies for Windows AI features including Recall.

#### Policy Name: Allow Recall enablement
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Configure based on organizational policy
- **Description:** Controls whether Recall feature can be enabled

#### Policy Name: Set maximum storage space for Recall snapshots
- **Options:** Size in GB
- **Recommended:** Configure based on organizational needs
- **Description:** Limits storage used by Recall snapshots

#### Policy Name: Disable settings agent
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Configure based on organizational policy
- **Description:** Disables AI-powered settings recommendations

#### Policy Name: Set deny app list for Recall
- **Options:** Application list
- **Recommended:** Configure sensitive applications
- **Description:** Prevents Recall from capturing specific applications

#### Policy Name: Let Apps Access System AI Models
- **Options:**
  - Not Configured
  - Force Allow
  - Force Deny
  - User in control
- **Recommended:** Configure based on organizational policy
- **Description:** Controls app access to system AI models

---

### 12. News, Widgets, and Start Menu (NEW in 25H2)

Policies for customizing user experience.

#### Policy Name: Disable Widgets Board
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled (for focused enterprise environment)
- **Description:** Disables Windows widgets feature

#### Policy Name: Disable Widgets on Lock Screen
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled (for security)
- **Description:** Prevents widgets from appearing on lock screen

#### Policy Name: Turn off abbreviated date/time format
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Description:** Controls date/time display format

#### Policy Name: Hide category view
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Description:** Hides category view in Start Menu

#### Policy Name: Configure Start pins
- **Options:** JSON configuration
- **Description:** Configures pinned items in Start Menu

#### Policy Name: Always show notification icon
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Description:** Controls notification icon visibility

---

### 13. Power Management (NEW in 25H2)

Power-related policies.

#### Policy Name: Enable Energy Saver
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Description:** Controls Energy Saver feature

#### Policy Name: Lid close action
- **Options:**
  - Do nothing
  - Sleep
  - Hibernate
  - Shut down
- **Recommended:** Sleep or Hibernate
- **Description:** Action when laptop lid closes

#### Policy Name: Power button action
- **Options:**
  - Do nothing
  - Sleep
  - Hibernate
  - Shut down
- **Recommended:** Sleep or Hibernate
- **Description:** Action when power button pressed

---

### 14. Windows Update

Windows Update configuration policies.

#### Policy Name: Configure automatic updates
- **Options:**
  - Not Configured
  - Auto download and notify for install
  - Auto download and schedule install
  - Auto download and install
  - Allow local admin to choose
  - Disabled
- **Recommended:** Auto download and schedule install
- **Description:** Controls automatic update behavior

#### Policy Name: Allow OOBE updates
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled (NEW in 25H2)
- **Description:** Allows updates during Out-of-Box Experience

#### Policy Name: Automatic update behavior
- **Options:**
  - Auto download and notify
  - Auto download and schedule install
  - Auto download and install
- **Recommended:** Auto download and schedule install
- **Description:** Sets update installation behavior

#### Policy Name: Active hours start/end
- **Options:** Time range
- **Recommended:** Configure based on business hours
- **Description:** Prevents restarts during specified hours

---

### 15. Microsoft Store (NEW in 25H2)

Microsoft Store configuration policies.

#### Policy Name: Remove default Microsoft Store packages
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Configure based on needs
- **Description:** Removes default store app packages (NEW in 25H2)

#### Policy Name: Configure MSIX Authentication Authorized Domains
- **Options:** Domain list
- **Description:** Configures authorized domains for MSIX app authentication (NEW in 25H2)

#### Policy Name: Require private store only
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled (for enterprise)
- **Description:** Restricts Store access to private store only

---

### 16. Human Presence Detection (NEW in 25H2)

Policies for devices with human presence sensors.

#### Policy Name: Force Onlooker Detection
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Description:** Forces onlooker detection when supported (NEW in 25H2)

#### Policy Name: Force Onlooker Detection Action
- **Options:**
  - Blur screen
  - Lock device
  - Do nothing
- **Description:** Action to take when onlooker detected (NEW in 25H2)

---

### 17. Printer Security (Enhanced in 25H2)

Enhanced printer security policies.

#### Policy Name: Require IPPS Policy
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Requires TLS encryption (IPPS) for IPP printers (NEW in 25H2)

#### Policy Name: Allow print spooler to accept client connections
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Disabled (for workstations)
- **Description:** Controls print spooler network listening

#### Policy Name: Point and Print Restrictions
- **Options:**
  - Not Configured
  - Enabled with options
  - Disabled
- **Recommended:** Enabled with strict restrictions
- **Description:** Controls driver installation from print servers

---

### 18. Windows Backup (NEW in 25H2)

Windows Backup configuration.

#### Policy Name: Enable Windows Backup
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Description:** Controls Windows Backup feature (NEW in 25H2)

#### Policy Name: Sync your settings
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Description:** Controls settings synchronization

---

### 19. Browser Security (Internet Explorer Decommissioning)

Enhanced browser security in 25H2.

#### Policy Name: Disable Internet Explorer 11
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Disables IE11 completely (Enhanced in 25H2)

#### Policy Name: Disable Internet Explorer 11 as a standalone browser
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled
- **Description:** Prevents launching IE11 directly

#### Policy Name: Disable IE11 launch via COM automation
- **Options:**
  - Not Configured
  - Enabled
  - Disabled
- **Recommended:** Enabled (NEW in 25H2)
- **Description:** Prevents IE11 launch through COM automation

---

## Settings Catalog - New Settings Summary

The following 36 new settings were added to the Intune Settings Catalog for Windows 11 25H2:

### Administrative Templates
1. App Package Deployment: Remove default Microsoft Store packages
2. Sync your settings: Enable Windows Backup

### Auditing
3. Account Logon/Logoff: Audit Group Membership

### Human Presence
4. Force Onlooker Detection Action
5. Force Onlooker Detection

### Microsoft App Store
6. Configure MSIX Authentication Authorized Domains

### News and Interests
7. Disable Widgets Board
8. Disable Widgets on Lock Screen

### Power
9. Enable Energy Saver

### Printers
10. Require IPPS Policy

### Privacy
11. Let Apps Access System AI Models

### Start Menu
12. Turn off abbreviated date/time format
13. Hide category view
14. Configure Start pins
15. Always show notification icon

### System
16. Allow OOBE updates

### Windows AI (Recall Feature)
17. Set maximum storage space for Recall snapshots
18. Disable settings agent
19. Allow Recall enablement
20. Set deny app list for Recall

---

## Deployment Best Practices

### 1. Testing and Pilot
- Always test baseline configurations in a pilot environment
- Start with audit mode for ASR rules before enabling block mode
- Monitor security logs for false positives

### 2. Gradual Rollout
- Deploy to pilot group first
- Monitor compliance and adjust as needed
- Roll out in phases to larger groups

### 3. Documentation
- Document any deviations from baseline
- Maintain change control records
- Update policies as new baselines are released

### 4. Monitoring
- Use Intune compliance reports to track policy application
- Monitor security events in Microsoft Defender for Endpoint
- Review ASR detections regularly

### 5. Customization
- Review all "Not Configured" settings and set appropriately
- Consider organizational requirements
- Balance security with user experience

---

## References and Resources

### Official Microsoft Documentation
- **Security Compliance Toolkit:** https://aka.ms/SCT
- **Windows 11 25H2 Security Baseline Blog:** https://techcommunity.microsoft.com/blog/microsoft-security-baselines/windows-11-version-25h2-security-baseline/4456231
- **Intune Security Baselines:** https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines
- **Settings Catalog Reference:** https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baseline-settings-mdm-all
- **Attack Surface Reduction Rules:** https://learn.microsoft.com/en-us/defender-endpoint/attack-surface-reduction-rules-reference

### Community Resources
- **4sysops Guide:** https://4sysops.com/archives/download-and-import-windows-11-25h2-security-baseline/
- **TechCommunity Intune Blog:** https://techcommunity.microsoft.com/blog/intunecustomersuccess/microsoft-intune-settings-catalog-updated-to-support-new-windows-11-version-25h2/4462927

---

## Import Instructions

To import these baseline configurations into your Intune environment:

1. Download the Security Compliance Toolkit from https://aka.ms/SCT
2. Use Intune's Group Policy Analytics to import GPO-based settings
3. Create Settings Catalog profiles for the new 25H2-specific settings
4. Assign to appropriate device/user groups
5. Monitor compliance and adjust as needed

For automated import, consider using the IntuneManagement tool:
- **IntuneManagement by Micke-K:** https://github.com/Micke-K/IntuneManagement

---

## Version History

**Version 1.0** - November 2025
- Initial documentation of Windows 11 25H2 security profiles
- Documented 36 new settings added to Settings Catalog
- Included all major security baseline categories
- Added references and deployment guidance

---

## License

This documentation is provided for informational purposes. Always refer to official Microsoft documentation for the most current and accurate information. Test all configurations in a non-production environment before deployment.

---

**Maintained by:** IntuneBaselines Community  
**Contact:** baselines@wolkenman.nl  
**Repository:** https://github.com/IntuneAdmin/IntuneBaselines
