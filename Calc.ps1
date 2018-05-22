while (1) {
    cls
    Write-Host "####################################################################################"
    Write-Host
    Write-Host "                                Calculatrice !!!!                                   "
    Write-Host
    Write-Host "####################################################################################"
    Write-Host
    [float]$nombre1 = Read-Host "Quel est le premier nombre à utiliser ?" 
    [float]$nombre2 = Read-Host "Quel est le deuxieme nombre à utiliser ?"

    if (($nombre1 -is [float]) -and ($nombre2 -is [float]))
    {
        Write-Host
        Write-Host "Quelle sera l'opération ?"
        Write-Host "Pour Addition taper 1"
        Write-Host "Pour Soustraction taper 2"
        Write-Host "Pour Multiplication taper 3"
        Write-Host "Pour Division taper 4"
        Write-Host

        [int]$operation = Read-Host "Votre Choix"

        Switch($operation)  {
            1 {
            $resultat = $nombre1 + $nombre2 
            Write-Host "$nombre1 + $nombre2 = $resultat"
            }
            2 {
            $resultat = $nombre1 - $nombre2 
            Write-Host "$nombre1 - $nombre2 = $resultat"
            }    
            3 {
            $resultat = $nombre1 * $nombre2 
            Write-Host "$nombre1 * $nombre2 = $resultat"
            }
            4 {
            $resultat = $nombre1 / $nombre2 
            Write-Host "$nombre1 / $nombre2 = $resultat"
            }
            default {
            Write-Host "Tu t'es planté dans l'operation à effectuer, recommence grand"
            }
        }
        $blabla = Read-host "Pressez une touche pour continuer..."
    }
    else
    {
        Write-Host "Tu sais ce que c'est un nombre ?..."
        Write-Host "Aller c'est pas grave, recommence"
        Start-Sleep -t -1
    }
}