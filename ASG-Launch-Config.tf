/*
resource "aws_launch_configuration" "ad-asg-lc" {
  image_id = "ami-006512796f4bc41da"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.allow-all.id}"]
  user_data = <<EOF
  <powershell>
    Start-Sleep -s 1200
    net user Administrator "Password2008" /y
    winrm quickconfig -q
    net stop winrm
    sc.exe config winrm start=auto
    net start winrm
    Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 34.219.242.4
    Install-WindowsFeature -Name AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools
    Install-WindowsFeature DNS -IncludeManagementTools
    $pwd = ConvertTo-SecureString 'Password2008' -AsPlainText -Force
    $Username = "jag\Administrator"
    $SecurePassword = ConvertTo-SecureString "Password2008" -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential($Username, $SecurePassword)
    Install-ADDSDomainController -NoGlobalCatalog:$false -CriticalReplicationOnly:$false -DatabasePath "C:\Windows\NTDS" -DomainName "jag.local" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -SysvolPath "C:\Windows\SYSVOL" -Force:$true -SafeModeAdministratorPassword $pwd -ReadOnlyReplica:$false -SiteName Default-First-Site-Name -Credential $credential
    </powershell>
  EOF
  lifecycle {
    create_before_destroy = true
  }
}*/
