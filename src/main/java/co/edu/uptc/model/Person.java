package co.edu.uptc.model;

public class Person {
    private String name;
    private String lastName;
    private String email;
    private int id;
    private int contact;
    private String rol;

    // constructor bacio

    public Person() {

    }

    // contructor lleno
    public Person(String name, String lastName, String email, int id, int contact, String rol) {
        this.name = name;
        this.lastName = lastName;
        this.email = email;
        this.id = id;
        this.contact = contact;
        this.rol = rol;
    }

    // set y get
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getContact() {
        return contact;
    }

    public void setContact(int contact) {
        this.contact = contact;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

}
