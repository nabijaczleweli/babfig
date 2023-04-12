DB/PK/KEK imported into their respective variables.

Really, this could just be a self-signed DB/MoK and https://dsa.debian.org/secure-boot-ca in DB as well.


/etc/dkms/framework.conf:
  sign_file="/usr/local/libexec/dkms-sign-file-nss"

  mok_signing_key="pkcs11:token=NSS%20Certificate%20DB;object=babtop%20DB%202023"
  mok_certificate=/root/secureboot/cert9.db



$ certutil -S -d sql:secureboot -n "babtop CA" -s "C=PL,L=Kraków,CN=babtop.nabijaczleweli.xyz SecureBoot CA" -t ,,CT -x -v 360 -12567 root@babtop.nabijaczleweli.xyz,nabijaczleweli/babtop@nabijaczleweli.xyz -8 babtop.nabijaczeleweli.xyz

A random seed must be generated that will be used in the
creation of your key.  One of the easiest ways to create a
random seed is to use the timing of keystrokes on a keyboard.

To begin, type keys on the keyboard until this progress meter
is full.  DO NOT USE THE AUTOREPEAT FUNCTION ON YOUR KEYBOARD!


Continue typing until the progress meter is full:

|************************************************************|

Finished.  Press enter to continue:


Generating key.  This may take a few moments...

                0 - Digital Signature
                1 - Non-repudiation
                2 - Key encipherment
                3 - Data encipherment
                4 - Key agreement
                5 - Cert signing key
                6 - CRL signing key
                Other to finish
 > 0
                0 - Digital Signature
                1 - Non-repudiation
                2 - Key encipherment
                3 - Data encipherment
                4 - Key agreement
                5 - Cert signing key
                6 - CRL signing key
                Other to finish
 > 5
                0 - Digital Signature
                1 - Non-repudiation
                2 - Key encipherment
                3 - Data encipherment
                4 - Key agreement
                5 - Cert signing key
                6 - CRL signing key
                Other to finish
 > 9
Is this a critical extension [y/N]?
y
                0 - Server Auth
                1 - Client Auth
                2 - Code Signing
                3 - Email Protection
                4 - Timestamp
                5 - OCSP Responder
                6 - Step-up
                7 - Microsoft Trust List Signing
                Other to finish
 > 2
                0 - Server Auth
                1 - Client Auth
                2 - Code Signing
                3 - Email Protection
                4 - Timestamp
                5 - OCSP Responder
                6 - Step-up
                7 - Microsoft Trust List Signing
                Other to finish
 > 9
Is this a critical extension [y/N]?

Is this a CA certificate [y/N]?
y
Enter the path length constraint, enter to skip [<0 for unlimited path]: > -1
Is this a critical extension [y/N]?
y
                0 - SSL Client
                1 - SSL Server
                2 - S/MIME
                3 - Object Signing
                4 - Reserved for future use
                5 - SSL CA
                6 - S/MIME CA
                7 - Object Signing CA
                Other to finish
 > 0
                0 - SSL Client
                1 - SSL Server
                2 - S/MIME
                3 - Object Signing
                4 - Reserved for future use
                5 - SSL CA
                6 - S/MIME CA
                7 - Object Signing CA
                Other to finish
 > 1
                0 - SSL Client
                1 - SSL Server
                2 - S/MIME
                3 - Object Signing
                4 - Reserved for future use
                5 - SSL CA
                6 - S/MIME CA
                7 - Object Signing CA
                Other to finish
 > 2
                0 - SSL Client
                1 - SSL Server
                2 - S/MIME
                3 - Object Signing
                4 - Reserved for future use
                5 - SSL CA
                6 - S/MIME CA
                7 - Object Signing CA
                Other to finish
 > 3
                0 - SSL Client
                1 - SSL Server
                2 - S/MIME
                3 - Object Signing
                4 - Reserved for future use
                5 - SSL CA
                6 - S/MIME CA
                7 - Object Signing CA
                Other to finish
 > 5
                0 - SSL Client
                1 - SSL Server
                2 - S/MIME
                3 - Object Signing
                4 - Reserved for future use
                5 - SSL CA
                6 - S/MIME CA
                7 - Object Signing CA
                Other to finish
 > 6
                0 - SSL Client
                1 - SSL Server
                2 - S/MIME
                3 - Object Signing
                4 - Reserved for future use
                5 - SSL CA
                6 - S/MIME CA
                7 - Object Signing CA
                Other to finish
 > 7
                0 - SSL Client
                1 - SSL Server
                2 - S/MIME
                3 - Object Signing
                4 - Reserved for future use
                5 - SSL CA
                6 - S/MIME CA
                7 - Object Signing CA
                Other to finish
 > 9
Is this a critical extension [y/N]?
y


$ certutil -L -d sql:secureboot/ -n 'babtop CA' -a | openssl x509 -text
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: 3204067578 (0xbefa30fa)
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: CN = babtop.nabijaczleweli.xyz SecureBoot CA, L = Krak\C3\B3w, C = PL
        Validity
            Not Before: Mar 26 18:09:47 2023 GMT
            Not After : Mar 26 18:09:47 2053 GMT
        Subject: CN = babtop.nabijaczleweli.xyz SecureBoot CA, L = Krak\C3\B3w, C = PL
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                RSA Public-Key: (2048 bit)
                Modulus:
                    00:de:57:4e:22:04:b9:d5:59:ab:23:13:d4:64:44:
                    57:c1:42:49:3f:7c:ea:66:55:0b:e2:a2:51:ec:9d:
                    0a:9f:ae:8e:e4:cb:0d:64:67:be:1d:42:8d:74:6e:
                    02:ab:b1:60:fa:83:e0:fb:5b:d4:6c:43:44:22:7f:
                    62:c7:75:5f:31:a4:28:c6:2a:64:ad:61:81:58:97:
                    13:b8:e9:6f:b1:62:2d:71:16:d1:2b:58:a8:29:73:
                    4e:6e:6c:45:60:7a:8f:2a:72:b4:55:f6:7c:61:0a:
                    aa:a2:0e:03:e7:0c:7e:e3:54:0b:4b:21:8e:aa:bc:
                    b5:7c:63:bb:9e:b8:07:d1:a5:3f:83:aa:a8:6e:63:
                    a0:14:fa:19:c4:8d:50:28:01:98:c7:d1:be:27:81:
                    e6:b6:55:8a:0f:63:40:71:c0:15:99:dc:41:43:cd:
                    3f:ff:b4:f1:69:2f:db:d5:2a:71:ef:79:d5:9e:60:
                    8c:4c:e2:8f:aa:14:32:e4:0e:48:11:54:c6:48:c2:
                    65:14:10:c5:47:76:f6:bf:78:61:f4:9a:43:30:0f:
                    3c:bc:05:f8:ee:51:08:2f:0d:47:ed:e2:d8:fd:99:
                    41:3f:db:78:fd:a0:58:11:bb:cf:9b:92:65:21:b7:
                    c1:22:7d:90:f3:09:65:a9:f2:2e:3e:67:2e:26:ff:
                    da:c3
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Subject Alternative Name:
                email:root@babtop.nabijaczleweli.xyz, email:nabijaczleweli/babtop@nabijaczleweli.xyz, DNS:babtop.nabijaczeleweli.xyz
            Netscape Cert Type: critical
                SSL Client, SSL Server, S/MIME, Object Signing, SSL CA, S/MIME CA, Object Signing CA
            X509v3 Basic Constraints: critical
                CA:TRUE
            X509v3 Extended Key Usage:
                Code Signing
            X509v3 Key Usage: critical
                Digital Signature, Certificate Sign
    Signature Algorithm: sha256WithRSAEncryption
         16:cc:a4:2d:d6:82:48:56:04:ed:e4:00:11:c5:2a:a4:22:e8:
         68:01:94:45:42:17:52:ca:4d:62:1d:e3:fd:81:cd:bf:31:0f:
         06:66:4d:94:78:b3:8b:aa:17:86:17:c2:b3:02:e2:3f:4b:a3:
         a8:bc:83:76:3d:b5:25:89:e7:b8:a1:be:43:6e:70:cc:3d:49:
         4f:29:f7:e6:db:ab:be:8b:fc:91:9f:4b:56:85:ad:ff:0a:62:
         14:d7:81:75:3d:6b:7f:45:34:52:28:9d:3a:9d:84:e1:0e:bd:
         38:eb:e7:9c:a3:07:92:63:fd:63:5d:26:b0:02:6a:10:3a:04:
         e9:0c:4e:91:25:0a:90:3e:f0:64:0e:de:2e:73:46:26:a8:ed:
         08:4d:70:cc:1f:ed:6d:12:7d:df:21:21:67:49:fc:04:e6:d0:
         88:db:ce:a4:0d:09:b6:78:47:26:ca:f2:d4:d8:1c:67:f1:9d:
         0f:73:ab:57:30:da:10:fa:ef:a6:ea:1d:9b:91:fe:7c:75:27:
         73:f2:66:40:87:15:38:77:ea:24:06:dc:87:68:0f:6f:66:c9:
         cf:e5:20:63:40:ed:97:eb:4f:84:08:47:75:27:ae:ce:10:7a:
         9a:f0:0b:11:a6:7c:cb:a3:99:55:45:53:02:b0:fa:44:ca:40:
         e5:24:c0:3a
-----BEGIN CERTIFICATE-----
MIID5DCCAsygAwIBAgIFAL76MPowDQYJKoZIhvcNAQELBQAwUTEwMC4GA1UEAxMn
YmFidG9wLm5hYmlqYWN6bGV3ZWxpLnh5eiBTZWN1cmVCb290IENBMRAwDgYDVQQH
DAdLcmFrw7N3MQswCQYDVQQGEwJQTDAgFw0yMzAzMjYxODA5NDdaGA8yMDUzMDMy
NjE4MDk0N1owUTEwMC4GA1UEAxMnYmFidG9wLm5hYmlqYWN6bGV3ZWxpLnh5eiBT
ZWN1cmVCb290IENBMRAwDgYDVQQHDAdLcmFrw7N3MQswCQYDVQQGEwJQTDCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAN5XTiIEudVZqyMT1GREV8FCST98
6mZVC+KiUeydCp+ujuTLDWRnvh1CjXRuAquxYPqD4Ptb1GxDRCJ/Ysd1XzGkKMYq
ZK1hgViXE7jpb7FiLXEW0StYqClzTm5sRWB6jypytFX2fGEKqqIOA+cMfuNUC0sh
jqq8tXxju564B9GlP4OqqG5joBT6GcSNUCgBmMfRvieB5rZVig9jQHHAFZncQUPN
P/+08Wkv29Uqce951Z5gjEzij6oUMuQOSBFUxkjCZRQQxUd29r94YfSaQzAPPLwF
+O5RCC8NR+3i2P2ZQT/beP2gWBG7z5uSZSG3wSJ9kPMJZanyLj5nLib/2sMCAwEA
AaOBwDCBvTBvBgNVHREEaDBmgR5yb290QGJhYnRvcC5uYWJpamFjemxld2VsaS54
eXqBKG5hYmlqYWN6bGV3ZWxpL2JhYnRvcEBuYWJpamFjemxld2VsaS54eXqCGmJh
YnRvcC5uYWJpamFjemVsZXdlbGkueHl6MBQGCWCGSAGG+EIBAQEB/wQEAwIA9zAP
BgNVHRMBAf8EBTADAQH/MBMGA1UdJQQMMAoGCCsGAQUFBwMDMA4GA1UdDwEB/wQE
AwIChDANBgkqhkiG9w0BAQsFAAOCAQEAFsykLdaCSFYE7eQAEcUqpCLoaAGURUIX
UspNYh3j/YHNvzEPBmZNlHizi6oXhhfCswLiP0ujqLyDdj21JYnnuKG+Q25wzD1J
Tyn35turvov8kZ9LVoWt/wpiFNeBdT1rf0U0UiidOp2E4Q69OOvnnKMHkmP9Y10m
sAJqEDoE6QxOkSUKkD7wZA7eLnNGJqjtCE1wzB/tbRJ93yEhZ0n8BObQiNvOpA0J
tnhHJsry1NgcZ/GdD3OrVzDaEPrvpuodm5H+fHUnc/JmQIcVOHfqJAbch2gPb2bJ
z+UgY0Dtl+tPhAhHdSeuzhB6mvALEaZ8y6OZVUVTArD6RMpA5STAOg==
-----END CERTIFICATE-----


$ certutil -S -d sql:secureboot -c "babtop CA" -n 'babtop KEK 2023' -s "C=PL,L=Kraków,CN=babtop.nabijaczleweli.xyz SecureBoot KEK 2023" -t ,,  -v 12 -26

A random seed must be generated that will be used in the
creation of your key.  One of the easiest ways to create a
random seed is to use the timing of keystrokes on a keyboard.

To begin, type keys on the keyboard until this progress meter
is full.  DO NOT USE THE AUTOREPEAT FUNCTION ON YOUR KEYBOARD!


Continue typing until the progress meter is full:

|************************************************************|

Finished.  Press enter to continue:


Generating key.  This may take a few moments...

                0 - Server Auth
                1 - Client Auth
                2 - Code Signing
                3 - Email Protection
                4 - Timestamp
                5 - OCSP Responder
                6 - Step-up
                7 - Microsoft Trust List Signing
                Other to finish
 > 2
                0 - Server Auth
                1 - Client Auth
                2 - Code Signing
                3 - Email Protection
                4 - Timestamp
                5 - OCSP Responder
                6 - Step-up
                7 - Microsoft Trust List Signing
                Other to finish
 > 9
Is this a critical extension [y/N]?

Is this a CA certificate [y/N]?

Enter the path length constraint, enter to skip [<0 for unlimited path]: >
Is this a critical extension [y/N]?

$ certutil -L -d sql:secureboot/ -n 'babtop KEK 2023' -a | openssl x509 -text -nameopt utf8
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: 3204100322 (0xbefab0e2)
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: CN=babtop.nabijaczleweli.xyz SecureBoot CA, L=Kraków, C=PL
        Validity
            Not Before: Mar 26 22:55:54 2023 GMT
            Not After : Mar 26 22:55:54 2024 GMT
        Subject: CN=babtop.nabijaczleweli.xyz SecureBoot KEK 2023, L=Kraków, C=PL
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                RSA Public-Key: (2048 bit)
                Modulus:
                    00:f5:1b:95:12:3a:d4:e5:4f:69:24:b6:d3:98:db:
                    ba:7e:5b:4d:7f:ae:e8:f5:ff:31:fa:70:4e:ba:cf:
                    4d:63:59:84:10:2f:cd:60:a5:24:f7:9b:c0:d2:7b:
                    fe:dc:16:56:c8:c8:ce:f8:07:a3:53:d7:85:d1:83:
                    68:94:65:76:ee:81:d2:31:5d:96:a4:98:69:09:4b:
                    01:2f:53:52:62:98:04:e5:b0:62:d1:87:06:8f:08:
                    c1:38:b1:0f:32:04:ca:9a:14:2c:e2:46:3d:62:1b:
                    81:81:1b:36:47:33:bf:47:23:74:08:4e:e6:8e:19:
                    0c:36:5b:92:90:51:17:29:c8:69:40:8a:f0:4f:2c:
                    f7:99:02:45:be:b9:a2:64:b0:d0:8d:67:0a:61:55:
                    43:31:79:1d:ae:5e:ae:7d:40:ae:20:b0:63:4b:1a:
                    e7:cd:63:ef:c4:92:09:94:6c:16:b8:c7:69:b6:72:
                    61:4e:e2:7d:0d:a7:08:10:3c:0a:90:ba:76:52:21:
                    3e:68:a0:81:94:1a:2f:9b:9c:67:09:ff:e5:f2:21:
                    64:e9:87:ba:e9:66:19:8b:1e:7a:5e:9a:1c:d3:f2:
                    3b:cf:5d:d6:dd:9d:82:bb:8d:8d:7c:8f:a7:f5:20:
                    5b:bd:a8:6a:57:ac:d7:2b:aa:36:83:dc:f2:e5:40:
                    0f:0f
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Basic Constraints:
                CA:FALSE
            X509v3 Extended Key Usage:
                Code Signing
    Signature Algorithm: sha256WithRSAEncryption
         72:0e:8b:0d:83:c0:67:0b:ab:4f:3b:9a:4f:63:55:64:3b:aa:
         11:34:e4:b7:e7:67:5b:55:2a:72:a8:5d:f5:e8:f7:cd:ca:66:
         f6:81:b9:6c:79:95:40:7e:ad:d2:55:37:cb:63:7f:51:5a:d7:
         c2:2d:e4:e3:03:c4:63:a6:1a:f6:44:b5:0b:f3:c5:f5:ee:b6:
         39:a6:20:9a:21:ee:6c:6b:d3:97:a0:39:23:82:e3:3f:7e:ed:
         fb:15:f7:e6:e9:3c:92:6a:e4:2c:34:08:f6:87:aa:11:89:7e:
         5e:77:95:de:cd:5a:5e:a6:68:2b:27:b5:4c:e5:a3:87:76:5e:
         54:2a:44:bb:e7:01:7c:f1:1a:ac:7c:1d:d6:a2:b2:39:b9:a3:
         a4:9d:eb:e1:5f:a5:b6:a3:00:9b:65:e3:9d:fa:45:36:7f:d8:
         c7:2d:a1:c7:c4:f4:b4:4b:17:9a:02:cf:c3:d1:07:ab:dc:bf:
         5d:ca:03:9b:43:4e:e5:ef:dd:6d:47:04:3b:a5:1a:c9:be:ca:
         81:49:35:1f:22:d2:4e:43:af:70:13:f9:af:60:e7:4a:88:6a:
         fd:b7:d2:5c:ad:9a:26:0b:f9:7a:bb:31:43:14:73:2c:b0:43:
         62:92:2e:1b:18:ae:c9:6f:65:fc:3e:99:62:f2:2a:d9:4f:63:
         84:24:0b:9e
-----BEGIN CERTIFICATE-----
MIIDSTCCAjGgAwIBAgIFAL76sOIwDQYJKoZIhvcNAQELBQAwUTEwMC4GA1UEAxMn
YmFidG9wLm5hYmlqYWN6bGV3ZWxpLnh5eiBTZWN1cmVCb290IENBMRAwDgYDVQQH
DAdLcmFrw7N3MQswCQYDVQQGEwJQTDAeFw0yMzAzMjYyMjU1NTRaFw0yNDAzMjYy
MjU1NTRaMFcxNjA0BgNVBAMTLWJhYnRvcC5uYWJpamFjemxld2VsaS54eXogU2Vj
dXJlQm9vdCBLRUsgMjAyMzEQMA4GA1UEBwwHS3Jha8OzdzELMAkGA1UEBhMCUEww
ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQD1G5USOtTlT2kkttOY27p+
W01/ruj1/zH6cE66z01jWYQQL81gpST3m8DSe/7cFlbIyM74B6NT14XRg2iUZXbu
gdIxXZakmGkJSwEvU1JimATlsGLRhwaPCME4sQ8yBMqaFCziRj1iG4GBGzZHM79H
I3QITuaOGQw2W5KQURcpyGlAivBPLPeZAkW+uaJksNCNZwphVUMxeR2uXq59QK4g
sGNLGufNY+/EkgmUbBa4x2m2cmFO4n0NpwgQPAqQunZSIT5ooIGUGi+bnGcJ/+Xy
IWTph7rpZhmLHnpemhzT8jvPXdbdnYK7jY18j6f1IFu9qGpXrNcrqjaD3PLlQA8P
AgMBAAGjIjAgMAkGA1UdEwQCMAAwEwYDVR0lBAwwCgYIKwYBBQUHAwMwDQYJKoZI
hvcNAQELBQADggEBAHIOiw2DwGcLq087mk9jVWQ7qhE05LfnZ1tVKnKoXfXo983K
ZvaBuWx5lUB+rdJVN8tjf1Fa18It5OMDxGOmGvZEtQvzxfXutjmmIJoh7mxr05eg
OSOC4z9+7fsV9+bpPJJq5Cw0CPaHqhGJfl53ld7NWl6maCsntUzlo4d2XlQqRLvn
AXzxGqx8Hdaisjm5o6Sd6+FfpbajAJtl4536RTZ/2MctocfE9LRLF5oCz8PRB6vc
v13KA5tDTuXv3W1HBDulGsm+yoFJNR8i0k5Dr3AT+a9g50qIav230lytmiYL+Xq7
MUMUcyywQ2KSLhsYrslvZfw+mWLyKtlPY4QkC54=
-----END CERTIFICATE-----



(same for DB and PK)
DB also -5 and Object Signing and -1 and Digital Signature

$ certutil -L -d sql:secureboot/

Certificate Nickname                                         Trust Attributes
                                                             SSL,S/MIME,JAR/XPI

babtop CA                                                    u,u,Cu
babtop KEK 2023                                              u,u,u
babtop DB 2023                                               u,u,u
babtop PK 2023                                               u,u,u



$ certutil -L -d sql:secureboot/  -n 'babtop KEK 2023' -r > kek2023.der
$ certutil -L -d sql:secureboot/  -n 'babtop DB 2023'  -r > db2023.der
$ certutil -L -d sql:secureboot/  -n 'babtop PK 2023'  -r > pk2023.der
$ certutil -L -d sql:secureboot/  -n 'babtop CA'  -r > ca.der
