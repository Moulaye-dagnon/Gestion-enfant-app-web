package com.denkolochi.model;

import java.time.LocalDate;

public class Enfant {

    private int id;
    private String nom;
    private String prenom;
    private LocalDate date_naissance;
    private String sexe;
    private String photo;
    private int scoreCorporel;
    private int scoreCognitif;
    private int scoreIntellectuel;
    private int scoreEmotionnel;
    private int id_parent;
    private int age;

    // Constructeur avec paramètres
    public Enfant(int id, String nom, String prenom, LocalDate date_naissance, String sexe, int id_parent) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.date_naissance = date_naissance;
        this.sexe = sexe;
        this.id_parent = id_parent;
    }
    
    // Constructeur vide (JavaBean)
    public Enfant() {
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    } 
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getPrenom() {
        return prenom;
    }
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    public LocalDate getDate_naissance() {
        return date_naissance;
    }
    public void setDate_naissance(LocalDate date_naissance) {
        this.date_naissance = date_naissance;
    }
    public String getSexe() {
        return sexe;
    }
    public void setSexe(String sexe) {
        this.sexe = sexe;
    }
    
    // Correction ici : Un getter et un setter propre pour l'âge
    public int getAge(){
        return age;
    }
    public void setAge(int age){
        this.age = age;
    }

    public int getid_parent(){
        return id_parent;
    }
    public void setid_parent(int id_parent){
        this.id_parent = id_parent;
    }

	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getScoreCorporel() {
		return scoreCorporel;
	}
	public void setScoreCorporel(int scoreCorporel) {
		this.scoreCorporel = scoreCorporel;
	}
	public int getScoreCognitif() {
		return scoreCognitif;
	}
	public void setScoreCognitif(int scoreCognitif) {
		this.scoreCognitif = scoreCognitif;
	}
	public int getScoreIntellectuel() {
		return scoreIntellectuel;
	}
	public void setScoreIntellectuel(int scoreIntellectuel) {
		this.scoreIntellectuel = scoreIntellectuel;
	}
	public int getScoreEmotionnel() {
		return scoreEmotionnel;
	}
	public void setScoreEmotionnel(int scoreEmotionnel) {
		this.scoreEmotionnel = scoreEmotionnel;
	}
}