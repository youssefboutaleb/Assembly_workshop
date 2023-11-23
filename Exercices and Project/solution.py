import random


def generer_code():
    """Génère un code secret de 4 chiffres différents."""
    chiffres = [str(i) for i in range(10)]
    random.shuffle(chiffres)
    return chiffres[:4]


def evaluer_proposition(code_secret, proposition):
    """Évalue une proposition et retourne le nombre de vaches et de taureaux."""
    vaches = taureaux = 0
    for i in range(len(code_secret)):
        if proposition[i] == code_secret[i]:
            taureaux += 1
        elif proposition[i] in code_secret:
            vaches += 1
    return vaches, taureaux


def jouer():
    """Fonction principale pour jouer au jeu."""
    code_secret = generer_code()
    print("Bienvenue dans le jeu Vache Teraux!")
    print("Essayez de deviner le code secret de 4 chiffres.")
    print("Les chiffres sont compris entre 0 et 9, et ils sont tous différents.")

    essais = 0
    while True:
        proposition = input("Entrez votre proposition de 4 chiffres : ")

        if len(proposition) != 4 or not proposition.isdigit():
            print("Veuillez entrer une proposition valide de 4 chiffres.")
            continue

        essais += 1

        vaches, taureaux = evaluer_proposition(code_secret, proposition)
        print(f"Résultat : {vaches} vache(s) et {taureaux} taureau(x).")

        if taureaux == 4:
            print(f"Félicitations ! Vous avez trouvé le code en {essais} essais.")
            break


if __name__ == "__main__":
    jouer()
