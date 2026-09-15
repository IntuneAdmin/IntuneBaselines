# Microsoft Edge Security Baseline – Policy-overzicht

> **Bron:** aangeleverde screenshot van de Microsoft Edge Security Baseline.
>
> Dit document bevat de policies die in de screenshot als **Enabled / Configured** staan, inclusief de waarde die in de baseline is ingesteld. Waar een URL of waarde in de screenshot niet volledig leesbaar is, is dit expliciet aangegeven.

## Scareware Blocker settings

| Policy | Waarde |
|---|---|
| Configure Microsoft Edge Scareware blocker protection | **Enabled** |
| Configure Microsoft Edge Scareware blocker to block sites detected as potential tech scams | **Enabled** |

## SmartScreen settings

| Policy | Waarde |
|---|---|
| Configure Microsoft Defender SmartScreen | **Enabled** |
| Configure Microsoft Defender SmartScreen to block potentially unwanted apps | **Enabled** |
| Prevent bypassing Microsoft Defender SmartScreen prompts for sites | **Enabled** |
| Prevent bypassing Microsoft Defender SmartScreen warnings about downloads | **Enabled** |
| Prevent bypassing Microsoft Defender SmartScreen warnings | **Enabled** |

## Startup, home page and new tab page

| Policy | Waarde |
|---|---|
| Allow users to load Microsoft Edge preloading | **Enabled** |
| Allow users to load Microsoft Edge startup boost | **Open at all times** |
| Configure the new tab page URL | **Enabled** |
| New tab page URL | `https://<waarde uit screenshot>` |
| Set the home page URL | **Enabled** |
| Show Home button on toolbar | **Enabled** |
| Action to take on startup | **Enabled** |
| Sites to open when the browser starts | **Enabled** |
| Sites to open when the browser starts (URLs) | `https://<waarde uit screenshot>` |

## WebRTC settings

| Policy | Waarde |
|---|---|
| Prevent peer-to-peer connections over WebRTC | **Enabled** |

## Extensions

| Policy | Waarde |
|---|---|
| Configure allowed list of extensions | **Enabled** |

## HTTP authentication

| Policy | Waarde |
|---|---|
| Windows Hello For HTTP Auth Enabled | **Enabled** |

## Identity and sign-in

| Policy | Waarde |
|---|---|
| Use Primary Refresh Token (PRT) to ... | **Enabled** |

> **Opmerking:** de volledige omschrijving van deze policy is in de aangeleverde afbeelding niet scherp genoeg om betrouwbaar over te nemen.

## Performance

| Policy | Waarde |
|---|---|
| Configure when energy saver (previously named efficiency mode) should become active | **Efficiency mode is active when the device is unplugged and the battery is low** |

## Scareware Blocker settings – aanvullende instelling

| Policy | Waarde |
|---|---|
| Configure Microsoft Edge Scareware blocker protection | **Enabled** |
| Configure Microsoft Edge Scareware blocker to block sites detected as potential tech scams | **Enabled** |

## Sleeping Tabs settings

| Policy | Waarde |
|---|---|
| Set the background tab inactivity timeout for Sleeping Tabs | **5 minutes of inactivity** |
| Configure Sleeping Tabs | **Enabled** |
| Set the background tab inactivity timeout for Sleeping Tabs | **Enabled** |

## Microsoft Edge – Additional settings

| Policy | Waarde |
|---|---|
| Provide feedback to ... Microsoft Edge browser | **Enabled** |

---

## Samenvatting

De baseline in de screenshot richt zich hoofdzakelijk op:

- **SmartScreen hardening** – SmartScreen is ingeschakeld en gebruikers kunnen waarschuwingen voor websites en downloads niet omzeilen.
- **Scareware protection** – Edge Scareware Blocker is ingeschakeld en gedetecteerde tech-scam websites worden geblokkeerd.
- **Browser start/configuratie** – startup-, home-page- en new-tab-instellingen worden centraal beheerd.
- **WebRTC** – peer-to-peer WebRTC-verbindingen worden geblokkeerd.
- **HTTP authentication** – Windows Hello/Windows Credential UI voor HTTP-authenticatie is ingeschakeld.
- **Performance** – Edge Efficiency Mode wordt geconfigureerd.
- **Sleeping Tabs** – achtergrondtabs worden na een ingestelde periode inactief.
- **Extensions** – extensiebeheer wordt centraal afgedwongen.

## Belangrijk

Dit document is een **transcriptie van de aangeleverde screenshot**. De screenshot is relatief laag in resolutie. De policies en waarden die niet volledig leesbaar zijn, zijn daarom als zodanig gemarkeerd en moeten vóór gebruik als formele baseline-documentatie worden gecontroleerd tegen de daadwerkelijke Intune Settings Catalog-configuratie of de geëxporteerde policy.

### Microsoft documentatie

De actuele Microsoft Edge policy-documentatie is beschikbaar via Microsoft Learn:

- Microsoft Edge policies
- Microsoft Defender SmartScreen settings
- Microsoft Edge Scareware Blocker policies
