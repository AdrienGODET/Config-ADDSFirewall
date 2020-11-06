<#

# Rédacteur : Adrien GODET 
# Contact : Godet.Adrien@outlook.fr

.SYNOPSIS

Permet la création des règles de FireWall nécessaire au fonctionnement de l'Active Directory

.DESCRIPTION

Le script Config-AddsFirewall.ps1 permet la création des règles nécessaires au fonctionnement
du rôle Active Directory Domain Services dans un contexte de LAB. 
Veillez toujours à vérifier le contenu d'un script avant de l'exécuter 

.INPUTS

Aucune. Le script ne récupère aucune information Config-AddsFirewall.ps1

.OUTPUTS

Aucune. Le script ne génére rien

.EXAMPLE

PS> .\Update-Month.ps1

#>
Write-Host "--------------------------------------------------------------------" -ForegroundColor Green
Write-Host "Configuration des règles de Firewall nécessaire à l'active directory" -ForegroundColor Green
Write-Host "--------------------------------------------------------------------" -ForegroundColor Green

# Création de la règles Port 25 TCP pour la réplication - SMTP

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 25 TCP - ADDS - Replication" -Direction Inbound -LocalPort 25 -Protocol TCP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 25 TCP - ADDS - Replication Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 25 TCP - ADDS - Replication Echoué" -ForegroundColor red
}

# Création de la règles Port 135 TCP pour la réplication - RPM, EPM

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 135 TCP - ADDS - Replication" -Direction Inbound -LocalPort 135 -Protocol TCP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 135 TCP - ADDS - Replication Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 135 TCP - ADDS - Replication Echoué" -ForegroundColor red
}

# Création de la règles Port 137 TCP pour la résolution de nom NetBios - NetBIOS

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 137 TCP - ADDS - Résolution de nom NETBIOS" -Direction Inbound -LocalPort 137 -Protocol TCP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 137 TCP - ADDS - Résolution de nom NETBIOS Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 137 TCP - ADDS - Résolution de nom NETBIOS Echoué" -ForegroundColor red
}

# Création de la règles Port 139 TCP pour l'authentification

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 139 TCP - ADDS - Authentification" -Direction Inbound -LocalPort 139 -Protocol TCP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 139 TCP - ADDS - Authentification Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 139 TCP - ADDS - Authentification Echoué" -ForegroundColor red
}

# Création de la règles Port 389 TCP/UDP pour le trafique LDAP

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 389 TCP - ADDS - LDAP" -Direction Inbound -LocalPort 389 -Protocol TCP -Action Allow | Out-Null
    New-NetFirewallRule -DisplayName "Autorisation Port 389 UDP - ADDS - LDAP" -Direction Inbound -LocalPort 389 -Protocol UDP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 389 TCP/UDP - ADDS - LDAP Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 389 TCP/UDP - ADDS - LDAP Echoué" -ForegroundColor red
}

# Création de la règles Port 636 TCP pour le trafique LDAP SSL

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 636 TCP - ADDS - LDAP SSL" -Direction Inbound -LocalPort 636 -Protocol TCP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 636 TCP - ADDS - LDAP SSL Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 636 TCP - ADDS - LDAP SSL Echoué" -ForegroundColor red
}

# Création de la règles Port 3268 TCP pour le trafique LDAP GC

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 3268 TCP - ADDS - LDAP GC" -Direction Inbound -LocalPort 3268 -Protocol TCP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 3268 TCP - ADDS - LDAP GC Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 3268 TCP - ADDS - LDAP GC Echoué" -ForegroundColor red
}

# Création de la règles Port 3269 TCP pour le trafique LDAP GC SSL

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 3269 TCP - ADDS - LDAP GC SSL" -Direction Inbound -LocalPort 3269 -Protocol TCP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 3269 TCP - ADDS - LDAP GC SSL Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 3269 TCP - ADDS - LDAP GC SSL Echoué" -ForegroundColor red
}
#
# Création de la règles Port 88 TCP/UDP pour le trafique Kerberos

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 88 TCP - ADDS - Kerberos" -Direction Inbound -LocalPort 88 -Protocol TCP -Action Allow | Out-Null
    New-NetFirewallRule -DisplayName "Autorisation Port 88 UDP - ADDS - Kerberos" -Direction Inbound -LocalPort 88 -Protocol UDP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 88 TCP/UDP - ADDS - Kerberos Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 88 TCP/UDP - ADDS - Kerberos Echoué" -ForegroundColor red
}

# Création de la règles Port 53 TCP/UDP pour le trafique DNS

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 53 TCP - ADDS - DNS" -Direction Inbound -LocalPort 53 -Protocol TCP -Action Allow | Out-Null
    New-NetFirewallRule -DisplayName "Autorisation Port 53 UDP - ADDS - DNS" -Direction Inbound -LocalPort 53 -Protocol UDP -Action Allow | Out-Null

    Write-Host "Création de la règles : Autorisation Port 53 TCP/UDP - ADDS - DNS Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 53 TCP/UDP - ADDS - DNS Echoué" -ForegroundColor red
}

# Création de la règles Port 445 TCP/UDP pour le trafique SMB

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 445 TCP - ADDS - SMB" -Direction Inbound -LocalPort 445 -Protocol TCP -Action Allow | Out-Null
    New-NetFirewallRule -DisplayName "Autorisation Port 445 UDP - ADDS - SMB" -Direction Inbound -LocalPort 445 -Protocol UDP -Action Allow | Out-Null

    Write-Host "Création de la règles : Autorisation Port 445 TCP/UDP - ADDS - SMB Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 445 TCP/UDP - ADDS - SMB Echoué" -ForegroundColor red
}

# Création de la règles Port 9389 TCP pour le trafique SOAP

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 9389 TCP - ADDS - SOAP" -Direction Inbound -LocalPort 9389 -Protocol TCP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 9389 TCP - ADDS - SOAP Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 9389 TCP - ADDS - SOAP Echoué" -ForegroundColor red
}

# Création de la règles Port 5722 TCP pour le trafique SYSVOL

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 5722 TCP - ADDS - SYSVOL" -Direction Inbound -LocalPort 5722 -Protocol TCP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 5722 TCP - ADDS - SYSVOL Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 5722 TCP - ADDS - SYSVOL Echoué" -ForegroundColor red
}

# Création de la règles Port 464 TCP/UDP pour le trafique Kerberos MDP

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 464 TCP - ADDS - Kerberos MDP" -Direction Inbound -LocalPort 464 -Protocol TCP -Action Allow | Out-Null
    New-NetFirewallRule -DisplayName "Autorisation Port 464 UDP - ADDS - Kerberos MDP" -Direction Inbound -LocalPort 464 -Protocol UDP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 464 TCP/UDP - ADDS - Kerberos MDP Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 464 TCP/UDP - ADDS - Kerberos MDP Echoué" -ForegroundColor red
}

# Création de la règles Port 123 UDP pour le trafique Windows Time

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 123 UDP - ADDS - Windows Time" -Direction Inbound -LocalPort 123 -Protocol UDP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 123 UDP - ADDS - Windows Time Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 123 UDP - ADDS - Windows Time Echoué" -ForegroundColor red
}

# Création de la règles Port 137 UDP pour le trafique authentification

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 137 UDP - ADDS - Authentification" -Direction Inbound -LocalPort 137 -Protocol UDP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 137 UDP - ADDS - authentification Réussi" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 137 UDP - ADDS - authentification Echoué" -ForegroundColor red
}

# Création de la règles Port 138 UDP pour le trafique Groupe Policy

Try
{
    New-NetFirewallRule -DisplayName "Autorisation Port 138 UDP - ADDS - trafique Groupe Policy" -Direction Inbound -LocalPort 138 -Protocol UDP -Action Allow | Out-Null
    Write-Host "Création de la règles : Autorisation Port 138 UDP - ADDS - trafique Groupe Policy" -ForegroundColor Green
}catch{
    Write-Host "Création de la règles : Autorisation Port 138 UDP - ADDS - trafique Groupe Policy" -ForegroundColor red
}