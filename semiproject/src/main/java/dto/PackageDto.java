package dto;

public class PackageDto {
	
	private String title;
	private int cost;
	private String imageurl;
	
	public PackageDto() {
	}

	public PackageDto(String title, int cost, String imageurl) {
		super();
		this.title = title;
		this.cost = cost;
		this.imageurl = imageurl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public String getImageurl() {
		return imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	@Override
	public String toString() {
		return "PackageDto [title=" + title + ", cost=" + cost + ", imageurl=" + imageurl + "]";
	}

}
