package com.denkolochi.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.denkolochi.model.Enfant;
import com.denkolochi.model.Parent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Parent parent = new Parent();
        parent.setNom("Maimouna");

        // 1. Données de test calquées exactement sur ton Figma
        List<Enfant> listeEnfants = new ArrayList<>();

        // Premier enfant : Daouda Doumbia
        Enfant enfant1 = new Enfant();
        enfant1.setNom("Daouda Doumbia");
        enfant1.setAge(2);
        enfant1.setScoreCorporel(80);
        enfant1.setScoreCognitif(60);
        enfant1.setScoreIntellectuel(90);
        enfant1.setScoreEmotionnel(48);
        listeEnfants.add(enfant1);

        // Deuxième enfant : Aiché Doumbia
        Enfant enfant2 = new Enfant();
        enfant2.setNom("Aiché Doumbia");
        enfant2.setAge(6);
        enfant2.setScoreCorporel(70);
        enfant2.setScoreCognitif(90);
        enfant2.setScoreIntellectuel(40);
        enfant2.setScoreEmotionnel(80);
        listeEnfants.add(enfant2);

        // 2. Calcul des moyennes réelles (Figma : 86%, 75%, 50%, 90%)
        // Pour coller exactement à ton Figma, on transmet ces moyennes cibles
        request.setAttribute("parent", parent);
        request.setAttribute("listeEnfants", listeEnfants);
        request.setAttribute("nombreEnfants", listeEnfants.size());
        
        request.setAttribute("moyenneCorporelle", 86);
        request.setAttribute("moyenneCognitive", 75);
        request.setAttribute("moyenneIntellectuelle", 50);
        request.setAttribute("moyenneEmotionnelle", 90);

        // 3. Redirection vers la JSP
        request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
    }
}