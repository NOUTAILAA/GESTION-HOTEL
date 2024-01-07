import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

public class Reservation {
    private final SimpleIntegerProperty id;
    private final SimpleStringProperty cin;
    private final SimpleStringProperty nomClient;
    private final SimpleStringProperty dateDebut;
    private final SimpleStringProperty dateFin;
    private final SimpleIntegerProperty nbrChambres;
    private final SimpleStringProperty typeChambre;

    public Reservation(int id, String cin, String nomClient ,String dateDebut, String dateFin, int nbrChambres, String typeChambre) {
        this.id = new SimpleIntegerProperty(id);
        this.cin = new SimpleStringProperty(cin);
        this.nomClient = new SimpleStringProperty(nomClient);
        this.dateDebut = new SimpleStringProperty(dateDebut);
        this.dateFin = new SimpleStringProperty(dateFin);
        this.nbrChambres = new SimpleIntegerProperty(nbrChambres);
        this.typeChambre = new SimpleStringProperty(typeChambre);
    }

    public int getId() {
        return id.get();
    }
    public String getCin() {
        return cin.get();
    }
    public String getNomClient() {
        return nomClient.get();
    }

    public String getDateDebut() {
        return dateDebut.get();
    }

    public String getDateFin() {
        return dateFin.get();
    }

    public int getNbrChambres() {
        return nbrChambres.get();
    }

    public String getTypeChambre() {
        return typeChambre.get();
    }

    public SimpleIntegerProperty idProperty() {
        return id;
    }

    public SimpleStringProperty nomClientProperty() {
        return nomClient;
    }

    public SimpleStringProperty dateDebutProperty() {
        return dateDebut;
    }
    public SimpleStringProperty CinProperty() {
        return cin;
    }
    public SimpleStringProperty dateFinProperty() {
        return dateFin;
    }

    public SimpleIntegerProperty nbrChambresProperty() {
        return nbrChambres;
    }

    public SimpleStringProperty typeChambreProperty() {
        return typeChambre;
    }
    public boolean matchesCin(String searchCin) {
        return getCin().toLowerCase().contains(searchCin.toLowerCase());
    }

}
