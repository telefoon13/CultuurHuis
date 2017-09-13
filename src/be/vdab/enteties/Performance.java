package be.vdab.enteties;

public class Performance {

	private long id;
	private String title;
	private String performers;
	private String date;
	private long genreid;
	private double price;
	private int freeseats;

	public Performance(long id, String title, String performers, String date, long genreid, double price, int freeseats) {
		this.id = id;
		this.title = title;
		this.performers = performers;
		this.date = date;
		this.genreid = genreid;
		this.price = price;
		this.freeseats = freeseats;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPerformers() {
		return performers;
	}

	public void setPerformers(String performers) {
		this.performers = performers;
	}

	public String getDate() {
		String date2 = date.substring(0, date.length() - 5);
		return date2;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public long getGenreid() {
		return genreid;
	}

	public void setGenreid(long genreid) {
		this.genreid = genreid;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getFreeseats() {
		return freeseats;
	}

	public void setFreeseats(int freeseats) {
		this.freeseats = freeseats;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		Performance that = (Performance) o;

		if (id != that.id) return false;
		if (genreid != that.genreid) return false;
		return title.equals(that.title);
	}

	@Override
	public int hashCode() {
		int result = (int) (id ^ (id >>> 32));
		result = 31 * result + title.hashCode();
		result = 31 * result + (int) (genreid ^ (genreid >>> 32));
		return result;
	}

	@Override
	public String toString() {
		return "Performance{" +
				"id=" + id +
				", title='" + title + '\'' +
				", performers='" + performers + '\'' +
				", date=" + date +
				", genreid=" + genreid +
				", price=" + price +
				", freeseats=" + freeseats +
				'}';
	}
}
