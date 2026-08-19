# Task 4 - Research Report: Common Network Security Threats

## Introduction

Network security threats are a major concern because modern organizations depend on networks and Internet services to communicate, store information, and provide services to users. Attackers can target the availability, confidentiality, and integrity of network communications in several ways. Common threats include Denial-of-Service (DoS) and Distributed Denial-of-Service (DDoS) attacks, Man-in-the-Middle (MITM) attacks, IP spoofing, and DNS poisoning or spoofing. Understanding how these attacks work and applying appropriate security controls can help network administrators reduce the risk of service disruption, data theft, and unauthorized access.

---

# 1. DoS and DDoS Attacks

## What is a DoS Attack?

A Denial-of-Service (DoS) attack attempts to make a computer, server, website, or network service unavailable to legitimate users.

The attacker may send a very large number of requests or packets to the target. The target can become overloaded and may no longer have enough resources to respond to normal users.

A Distributed Denial-of-Service (DDoS) attack is similar, but the traffic comes from many different systems at the same time. These systems may be compromised computers, IoT devices, or abused Internet services.

## How the Attack Works

A typical DDoS attack can work as follows:

1. The attacker identifies a target service.
2. The attacker obtains access to many systems or publicly accessible services that can generate traffic.
3. These systems send large amounts of traffic toward the target.
4. The target's bandwidth, CPU, memory, or application resources become overloaded.
5. Legitimate users experience slow performance or complete service unavailability.

DDoS attacks can also use reflection and amplification. In an amplification attack, the attacker sends a relatively small request while the response sent toward the victim is much larger.

## Real-World Example

In February 2018, GitHub experienced a major DDoS attack that reached approximately 1.35 Tbps. The attack used exposed memcached servers for amplification and involved spoofed source IP addresses. GitHub's automated mitigation system detected the attack and redirected traffic through a DDoS mitigation service.

This incident demonstrated how amplification attacks can generate extremely large traffic volumes without requiring the attacker to directly control a traditional botnet.

Source: GitHub Incident Report and WIRED coverage of the 2018 GitHub DDoS attack.

## Impact

DDoS attacks can cause:

- Website downtime
- Loss of availability
- Slow network performance
- Loss of revenue
- Increased infrastructure costs
- Disruption of business operations
- Damage to an organization's reputation

## Mitigation Strategies

### 1. DDoS Protection Services

Organizations can use dedicated DDoS protection services and traffic-scrubbing systems to detect and filter malicious traffic before it reaches the main infrastructure.

### 2. Rate Limiting and Traffic Filtering

Firewalls, load balancers, and network devices can limit excessive requests and block suspicious traffic patterns.

### 3. Source Address Validation

Network operators can implement Source Address Validation (SAV), access-control lists, and technologies such as unicast Reverse Path Forwarding (uRPF) to reduce traffic using forged source addresses.

NIST recommends source-address validation and other filtering mechanisms as part of DDoS mitigation.

---

# 2. Man-in-the-Middle (MITM) Attacks

## What is a MITM Attack?

A Man-in-the-Middle attack occurs when an attacker secretly places themselves between two communicating systems.

Instead of communicating directly with each other, the systems unknowingly send their traffic through the attacker.

The attacker may be able to observe, modify, or redirect the communication.

## How the Attack Works

A MITM attack can occur in several ways, including:

- ARP poisoning on a local network
- Rogue Wi-Fi access points
- DNS manipulation
- Compromised network devices
- Fraudulent or improperly trusted certificates

For example, in an ARP poisoning attack, an attacker can manipulate ARP information so that a victim sends network traffic to the attacker's machine instead of the legitimate destination.

CISA documentation explains that ARP manipulation can force traffic through an attacker's system, allowing traffic to be captured or modified.

## Real-World Example

The DigiNotar certificate breach in 2011 demonstrated the danger of compromised certificate authorities.

Attackers obtained fraudulent certificates, including a certificate for Google. The fraudulent certificate was reportedly used to enable Man-in-the-Middle interception of Gmail traffic.

The incident caused browsers and major technology companies to lose trust in DigiNotar's certificates, and the company eventually went bankrupt.

Source: WIRED coverage of the DigiNotar breach.

## Impact

MITM attacks can result in:

- Theft of login credentials
- Exposure of confidential information
- Session hijacking
- Modification of transmitted information
- Monitoring of network traffic
- Redirection to malicious websites

## Mitigation Strategies

### 1. Use HTTPS and TLS

Web applications should use HTTPS instead of unencrypted HTTP. TLS encrypts communications and helps authenticate the intended server.

### 2. Secure Local Networks

Organizations should use secure Wi-Fi configurations, network segmentation, strong authentication, and protections against ARP spoofing.

### 3. Certificate Validation

Applications and browsers should properly validate TLS certificates and users should not ignore certificate warnings.

---

# 3. IP Spoofing

## What is IP Spoofing?

IP spoofing occurs when an attacker changes the source IP address in network packets so that the packets appear to come from another system.

NIST defines spoofing as falsifying the sending address of a transmission or otherwise impersonating another source.

The attacker does not necessarily have control of the system whose address is being impersonated.

## How the Attack Works

A simplified IP spoofing process is:

1. The attacker creates a network packet.
2. The attacker places a forged source IP address in the packet.
3. The packet is transmitted toward the target.
4. The target sees the forged source address instead of the attacker's actual address.

IP spoofing is commonly associated with reflection and amplification attacks because the attacker can make third-party systems send responses toward a victim.

## Real-World Example

The 2018 GitHub DDoS attack used spoofed IP addresses together with exposed memcached servers.

The attacker sent requests with the victim's IP address as the apparent source. The memcached servers then sent much larger responses toward GitHub, creating an amplification effect.

This contributed to the extremely large traffic volume observed during the attack.

Source: GitHub's incident report and WIRED's coverage of the attack.

## Impact

IP spoofing can be used to:

- Hide the true source of network traffic
- Support DDoS attacks
- Enable reflection attacks
- Bypass weak source-address controls
- Make incident investigation more difficult

IP spoofing by itself does not automatically provide access to another computer, but it can be an important component of larger attacks.

## Mitigation Strategies

### 1. Source Address Validation

Network operators should verify whether packets contain valid source addresses.

### 2. Ingress and Egress Filtering

Routers and firewalls can filter packets that contain source addresses that should not appear on a particular network.

### 3. Network Monitoring

Organizations should monitor unusual traffic patterns and investigate unexpected source addresses or abnormal packet behavior.

NIST recommends Source Address Validation and filtering mechanisms to help reduce IP spoofing and DDoS-related risks.

---

# 4. DNS Poisoning and DNS Spoofing

## What is DNS?

The Domain Name System (DNS) translates human-readable domain names such as example.com into IP addresses that computers can use to communicate.

## What is DNS Poisoning?

DNS poisoning occurs when false DNS information is introduced into a DNS resolver's cache or another part of the DNS resolution process.

As a result, users may be directed to an incorrect or malicious IP address.

DNS spoofing is a broader term that can describe attempts to provide false DNS information to redirect users.

## How the Attack Works

A simplified DNS poisoning attack can work as follows:

1. A user requests the IP address of a domain.
2. A DNS resolver processes the request.
3. An attacker attempts to provide false DNS information.
4. The resolver accepts the malicious information.
5. Users may then be redirected to an attacker-controlled server.

The attacker may use the redirection to perform phishing, collect credentials, or intercept traffic.

## Real-World Example

In 2008, security researcher Dan Kaminsky discovered a serious DNS vulnerability that could allow attackers to perform DNS cache poisoning.

The vulnerability could allow attackers to cause DNS servers to accept false information and redirect users toward malicious destinations.

The discovery resulted in coordinated security updates from major DNS software and technology vendors.

Source: WIRED coverage of the Kaminsky DNS vulnerability.

Another example occurred during DNS infrastructure tampering campaigns reported by CISA in 2019. Attackers compromised DNS-related accounts and changed DNS records, allowing traffic to be redirected and intercepted.

## Impact

DNS poisoning or spoofing can result in:

- Redirection to malicious websites
- Phishing attacks
- Credential theft
- Traffic interception
- Email redirection
- Loss of trust in network services

## Mitigation Strategies

### 1. DNSSEC

DNS Security Extensions (DNSSEC) can provide authentication and integrity protection for DNS responses, helping users and resolvers detect forged DNS information.

### 2. Protect DNS Accounts

Organizations should use strong passwords, multi-factor authentication, and strict access controls for accounts that can modify DNS records.

CISA recommends reviewing DNS records, changing DNS account passwords, and enabling multi-factor authentication.

### 3. Monitor DNS Changes

Organizations should monitor DNS records and investigate unexpected modifications.

Certificate Transparency logs can also help organizations identify suspicious certificates associated with their domains.

---

# 5. Comparison Table

| Threat | Attack Vector | Who is at Risk? | Difficulty to Execute | Ease of Mitigation |
|---|---|---|---|---|
| DoS/DDoS | Large volumes of malicious traffic or requests | Websites, servers, businesses, online services | Medium to High | Medium |
| MITM | Network interception, ARP manipulation, rogue networks, certificate abuse | Network users and organizations | Medium to High | Medium |
| IP Spoofing | Forged source IP addresses | Networks, servers, DDoS targets | Medium | Medium |
| DNS Poisoning/Spoofing | Manipulated DNS responses or DNS records | Websites, users, DNS infrastructure | Medium to High | Medium |

---

# 6. Security Observations

Several common security principles can reduce the impact of these threats.

First, organizations should use encryption whenever sensitive information is transmitted. HTTPS and TLS make it much harder for attackers to read or modify web traffic.

Second, network infrastructure should use filtering and validation mechanisms. Source address validation, ingress filtering, firewalls, and access-control rules can reduce spoofed traffic.

Third, DNS infrastructure should be protected carefully because DNS manipulation can redirect users to attacker-controlled systems.

Finally, continuous monitoring is important. Detecting unusual traffic, DNS changes, connection patterns, or routing behavior can allow security teams to respond before an attack causes significant damage.

---

# 7. Conclusion

The three key takeaways for a network administrator are:

1. **Protect availability:** Use DDoS protection, traffic filtering, rate limiting, monitoring, and scalable infrastructure to reduce the impact of denial-of-service attacks.

2. **Protect communication:** Use HTTPS/TLS, secure Wi-Fi, strong authentication, and network security controls to reduce the risk of Man-in-the-Middle attacks.

3. **Validate network information:** Use source-address validation, DNS security, access controls, monitoring, and secure routing practices to reduce IP spoofing and DNS manipulation.

Network security requires multiple layers of protection rather than relying on a single security mechanism.

---

# 8. References

1. **NIST - SP 800-189: Resilient Interdomain Traffic Exchange: BGP Security and DDoS Mitigation**  
   National Institute of Standards and Technology (NIST).  
   Used for information about DDoS mitigation, IP spoofing prevention, Source Address Validation, uRPF, and network filtering.

2. **CISA - Mitigate DNS Infrastructure Tampering**  
   Cybersecurity and Infrastructure Security Agency (CISA).  
   Used for information about DNS infrastructure attacks, DNS record protection, account security, and multi-factor authentication.

3. **CISA - UDP-Based Amplification Attacks**  
   Cybersecurity and Infrastructure Security Agency (CISA).  
   Used for information about reflection and amplification-based DDoS attacks.

4. **WIRED - GitHub Survived the Biggest DDoS Attack Ever Recorded**  
   Used as a real-world example of the 2018 GitHub memcached DDoS attack.

5. **GitHub - February 28th DDoS Incident Report**  
   GitHub Engineering / GitHub Blog.  
   Used for the technical details and response to the 2018 GitHub DDoS incident.

6. **WIRED - DigiNotar Certificate Breach**  
   Used as a real-world example of certificate abuse enabling Man-in-the-Middle interception.

7. **WIRED - Kaminsky DNS Vulnerability**  
   Used as a real-world example of DNS cache poisoning.

8. **NIST CSRC Glossary - Spoofing**  
   National Institute of Standards and Technology.  
   Used for the definition of spoofing and forged source information.

---

# 9. Ethics

This report is intended for cybersecurity education and defensive security awareness.

The techniques discussed are described at a conceptual level and should only be tested on systems and networks where the tester has explicit authorization.

Unauthorized interception, traffic manipulation, denial-of-service attacks, or network exploitation can be illegal and can cause serious damage.
