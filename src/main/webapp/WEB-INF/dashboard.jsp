
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
    <title>Dashboard Parent</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="css/Dashboard.css">
</head>

<body>
<div class="conteneur">
    <!-- Barre de gauche -->
    <aside class="barreLaterale">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/images/iconedenkolochi.png" alt="logo">
        </div>
        <nav>
            <ul>
                <li class="actif">
                    <i class="fa-solid fa-house"></i>
                    <span>Tableau de bord</span>
                </li>
                <li>
                    <i class="fa-solid fa-users"></i>
                    <span>Mes enfants</span>
                </li>
                <li>
                    <i class="fa-solid fa-image"></i>
                    <span>Activités</span>
                </li>
                <li>
                    <i class="fa-solid fa-clock"></i>
                    <span>Progrès</span>
                </li>
                <li>
                    <i class="fa-solid fa-table-cells"></i>
                    <span>Recommandations</span>
                </li>
                <li>
                    <i class="fa-regular fa-bell"></i>
                    <span>Notifications</span>
                </li>
                <li>
                    <i class="fa-solid fa-gear"></i>
                    <span>Paramètres</span>
                </li>
            </ul>
        </nav>
    </aside>

    <!-- contenu principal -->
    <main class="contenuPrincipal">

        <!-- HEADER -->
        <header class="entete">
            <div>
                <h2>
                    Coucou ${parent.nom} !
                    <i id="main" class="fa-solid fa-hand"></i>
                </h2>
                <p>Voici un aperçu du développement de vos enfants</p>
            </div>
            <div class="iconeNotification">
                <i class="fa-regular fa-bell"></i>
            </div>
        </header>

        <!-- statistiques -->
        <section class="grilleStatistiques">
            <div class="carte carteEnfants">
                <div class="titreCarte">
                    <i class="fa-solid fa-users"></i>
                    <h3>${nombreEnfants} Enfants</h3>
                </div>
                <p>Suivez le développement de vos enfants</p>
                <button>Voir tous vos enfants</button>
            </div>

            <!-- Moyennes Globales -->
            <div class="carteMoyenne">
                <div class="hautMoyenne">
                    <i class="fa-solid fa-person"></i>
                    <span>${moyenneCorporelle}%</span>
                </div>
                <p>Moyenne corporelle</p>
            </div>

            <div class="carteMoyenne orange">
                <div class="hautMoyenne">
                    <i class="fa-solid fa-brain"></i>
                    <span>${moyenneCognitive}%</span>
                </div>
                <p>Moyenne cognitive</p>
            </div>

            <div class="carteMoyenne clair">
                <div class="hautMoyenne">
                    <i class="fa-solid fa-book"></i>
                    <span>${moyenneIntellectuelle}%</span>
                </div>
                <p>Moyenne intellectuelle</p>
            </div>

            <div class="carteMoyenne bleu">
                <div class="hautMoyenne">
                    <i class="fa-solid fa-heart"></i>
                    <span>${moyenneEmotionnelle}%</span>
                </div>
                <p>Moyenne emotionnelle</p>
            </div>
        </section>

        <!-- section enfants -->
        <section class="sectionEnfants">
            <h3>Mes enfants</h3>
            <div class="listeEnfants">
                
    <% 
        java.util.List<com.denkolochi.model.Enfant> enfants = 
            (java.util.List<com.denkolochi.model.Enfant>) request.getAttribute("listeEnfants");
        
        // Sécurité si la servlet n'a pas encore chargé la liste
        if (enfants == null || enfants.isEmpty()) {
            enfants = new java.util.ArrayList<>();
            
            com.denkolochi.model.Enfant e1 = new com.denkolochi.model.Enfant();
            e1.setNom("Daouda Doumbia"); e1.setAge(2);
            e1.setScoreCorporel(80); e1.setScoreCognitif(60); e1.setScoreIntellectuel(90); e1.setScoreEmotionnel(48);
            enfants.add(e1);
            
            com.denkolochi.model.Enfant e2 = new com.denkolochi.model.Enfant();
            e2.setNom("Aiché Doumbia"); e2.setAge(6);
            e2.setScoreCorporel(70); e2.setScoreCognitif(90); e2.setScoreIntellectuel(40); e2.setScoreEmotionnel(80);
            enfants.add(e2);
        }

        for (com.denkolochi.model.Enfant enfant : enfants) {
    %>
        <div class="carteEnfant">
            <img src="${pageContext.request.contextPath}/images/<%= enfant.getNom().contains("Aiché") ? "bebe noir.jpg" : "garcon.jpg" %>" alt="enfant">
            
            <div class="infosEnfant">
                <h4><%= enfant.getNom() %></h4>
                <p class="ageText"><%= enfant.getAge() %> ans</p>

                <div class="scores">
                    <span class="scoreItem"><i id="iconeVert" class="fa-solid fa-person"></i> <%= enfant.getScoreCorporel() %>%</span>
                    <span class="scoreItem"><i id="iconeOrange" class="fa-solid fa-brain"></i> <%= enfant.getScoreCognitif() %>%</span>
                    <span class="scoreItem"><i id="iconeClair" class="fa-solid fa-book"></i> <%= enfant.getScoreIntellectuel() %>%</span>
                    <span class="scoreItem"><i id="iconeBleu" class="fa-solid fa-heart"></i> <%= enfant.getScoreEmotionnel() %>%</span>
                </div>
            </div>
        </div>
    <% 
        } 
    %>   

    <div class="ajouterEnfant">
        <i class="fa-solid fa-user-plus"></i>
        <span>Ajouter un enfant</span>
    </div>
</div>
        </section>

        <!-- Actions à faire -->
        <section class="sectionActions">
            <h3>Que voudriez-vous faire aujourd'hui ?</h3>
            <div class="grilleActions">
                <div class="carteAction quiz">
                    <h4><i class="fa-solid fa-clipboard-question"></i> Faire un quiz</h4>
                    <p>Stimulez les capacités cognitives de votre enfant</p>
                    <button>Démarrer un quiz</button>
                </div>
                
                <div class="carteAction exercices">
                    <h4><i class="fa-solid fa-brain"></i> Exercices éducatifs</h4>
                    <p>Trouver des exercices adaptés à l'âge de votre enfant</p>
                    <button>Explorer</button>
                </div>

                <div class="carteAction jeux">
                    <h4><i class="fa-solid fa-gamepad"></i> Jeux éducatifs</h4>
                    <p>Jouer à des activités interactives adaptées</p>
                    <button>Jouez</button>
                </div>

                <div class="carteAction progres">
                    <h4><i class="fa-solid fa-chart-line"></i> Suivre les progrès</h4>
                    <p>Consulter les progrès et performances détaillés</p>
                    <button>Voir progrès</button>
                </div>
            </div>
        </section>

        <!-- ACTIVITES -->
        <section class="activites">
            <div class="hautActivites">
                <h3>Activités récentes</h3>
                <a href="#">Tout voir</a>
            </div>

            <div class="activite">
                <div>
                    <h4><i id="iconeQuiz" class="fa-solid fa-clipboard-question"></i> Quiz logique</h4>
                    <p>Daouda a complété ce quiz</p>
                </div>
                <div class="detailsActivite">
                    <span>03 Novembre 2025</span>
                    <span class="complete">Complété</span>
                </div>
            </div>

            <div class="activite">
                <div>
                    <h4><i id="iconeMemoire" class="fa-solid fa-brain"></i> Exercice de mémoire</h4>
                    <p>Daouda doit revoir cet exercice</p>
                </div>
                <div class="detailsActivite">
                    <span>12 Janvier 2026</span>
                    <span class="revoir">A revoir</span>
                    <img id="imgFooter" src="${pageContext.request.contextPath}/images/fem.jpg" alt="photo">
                </div>
            </div>
        </section>
    </main>
</div>
</body>
</html>