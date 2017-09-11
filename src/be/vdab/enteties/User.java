package be.vdab.enteties;

public class User {

	private long id;
	private String gebruikersnaam;
	private String email;
	private String pass;

	public User(long id,String gebruikersnaam, String email, String pass) {
		this.id = id;
		setGebruikersnaam(gebruikersnaam);
		this.email = email;
		this.pass = pass;
	}

	public long getId() {
		return id;
	}

	public void setId(long id){
		this.id = id;
	}

	public String getGebruikersnaam() {
		return gebruikersnaam;
	}

	private void setGebruikersnaam(String gebruikersnaam) {
		if (gebruikersnaam != null && !gebruikersnaam.isEmpty()) {
			this.gebruikersnaam = gebruikersnaam;
		}
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
}