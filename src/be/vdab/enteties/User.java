package be.vdab.enteties;

@SuppressWarnings("ALL")
public class User {

	private long id;
	private String prename;
	private String lastname;
	private String street;
	private String streetnr;
	private String zipcode;
	private String city;
	private String username;
	private String email;
	private String password;

	public User(long id, String prename, String lastname, String street, String streetnr, String zipcode, String city, String username, String email, String password) {
		this.id = id;
		this.prename = prename;
		this.lastname = lastname;
		this.street = street;
		this.streetnr = streetnr;
		this.zipcode = zipcode;
		this.city = city;
		this.username = username;
		this.email = email;
		this.password = password;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getPrename() {
		return prename;
	}

	public void setPrename(String prename) {
		this.prename = prename;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getStreetnr() {
		return streetnr;
	}

	public void setStreetnr(String streetnr) {
		this.streetnr = streetnr;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		User user = (User) o;

		if (id != user.id) return false;
		return username.equals(user.username) && email.equals(user.email);
	}

	@Override
	public int hashCode() {
		int result = (int) (id ^ (id >>> 32));
		result = 31 * result + username.hashCode();
		result = 31 * result + email.hashCode();
		return result;
	}

	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", prename='" + prename + '\'' +
				", lastname='" + lastname + '\'' +
				", street='" + street + '\'' +
				", streetnr='" + streetnr + '\'' +
				", zipcode='" + zipcode + '\'' +
				", city='" + city + '\'' +
				", username='" + username + '\'' +
				", email='" + email + '\'' +
				", password='" + password + '\'' +
				'}';
	}
}