While (1)
{
    Clear-Host
    function transformeValeur($choix)
    {
        if ($choix -eq 1) {return "Pierre"}
        elseif ($choix -eq 2) {return "Feuille"}
        elseif ($choix -eq 3) {return "Ciseaux"}
    }

    function quiAGagne($choixM,$choixJ) 
    {

        <#
            0 : Egalité
            1 : joueur Gagne
            2 : Machine gagne
        #>
        if($choixM -eq 1)
        {
            if($choixJ -eq 1)
            {
                return 0
            }
            elseif($choixJ -eq 2)
            {
                return 1
            }
            elseif($choixJ -eq 3)
            {
                return 2
            }
        }
        elseif($choixM -eq 2)
        {
            if($choixJ -eq 1)
            {
                return 2
            }
            elseif($choixJ -eq 2)
            {
                return 0
            }
            elseif($choixJ -eq 3)
            {
                return 1
            }
        }
        elseif($choixM -eq 3)
        {
            
            if($choixJ -eq 1)
            {
                return 1
            }
            elseif($choixJ -eq 2)
            {
                return 2
            }
            elseif($choixJ -eq 3)
            {
                return 0
            }

        }
    }

    $pointJoueur = 0
    $pointMachine = 0
    while(($pointJoueur -lt 3) -and ($pointMachine -lt 3))
    {
        Clear-host
        Write-Host "#############################################################################"
        Write-Host "`n                    Pierre Feuille Ciseaux !"
        Write-Host "`n#############################################################################"

        Write-Host "`n                    Pierre   : 1"
        Write-Host "`n                    Feuille  : 2"
        Write-Host "`n                    Ciseaux  : 3"
        Write-Host "`n#############################################################################"
        Write-Host "`nPoints Joueur = $pointJoueur"
        Write-Host "`nPoints Machine = $pointMachine`n`n"

        [INT]$choixMachine = Get-Random -Minimum 1 -Maximum 4
        [INT]$choixJoueur = Read-Host "Faites votre choix"

        while(($choixJoueur -lt 1) -or ($choixJoueur -gt 3))
        {
            $choixJoueur = Read-host "Arrête de faire ça... Choisis une vraie valeur..."
        }

        $valeurTransformeeJoueur = transformeValeur($choixJoueur)
        $valeurTransformeeMachine = transformeValeur($choixMachine)
        Write-Host "Votre Choix : $valeurTransformeeJoueur"
        Start-Sleep 1
        Write-Host "Choix machine : $valeurTransformeeMachine"
        Start-Sleep 1
        $victoire = quiAGagne $choixMachine $choixJoueur
        if($victoire -eq 0)
        {
            Write-Host "Egalite !"
            Start-Sleep 5
        }
        elseif($victoire -eq 1)
        {
            Write-Host "Félicitations !"
            $pointJoueur++
            Start-Sleep 5
        }
        elseif($victoire -eq 2)
        {
            Write-Host "Dommage... Essaie Encore !"
            $pointMachine++
            Start-Sleep 5
        }
    }

    if($pointJoueur -eq 3)
    {
        Write-Host "Bon... Ok... T'as Gagné..."
        Write-Host  -ForegroundColor Green "`n888"                                     
        Write-Host  -ForegroundColor Green "888"                                     
        Write-Host  -ForegroundColor Green "888"                                     
        Write-Host  -ForegroundColor Green "88888b. 888d888 8888b. 888  888 .d88b."  
        Write-Host  -ForegroundColor Green "888  88b888P        88b888  888d88  88b" 
        Write-Host  -ForegroundColor Green "888  888888    .d888888Y88  88P888  888" 
        Write-Host  -ForegroundColor Green "888 d88P888    888  888 Y8bd8P Y88..88P" 
        Write-Host  -ForegroundColor Green "88888P  888    Y888888   Y88P    Y88P"
        Read-Host "`n`nAppuyer sur une touche pour recommencer"
    }
    elseif($pointMachine -eq 3)
    {
        Clear-host
        Write-Host "`nPoints Joueur = $pointJoueur"
        Write-Host "`nPoints Machine = $pointMachine`n`n"
        Write-Host "J'ai toujours su que la machine était supérieur à l'homme..."
        Read-Host "`n`nAppuyer sur une touche pour recommencer"
    }
}