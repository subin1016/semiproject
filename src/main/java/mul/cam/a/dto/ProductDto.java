package mul.cam.a.dto;

public class ProductDto {
	
	private String title;
	private String price;
	private String imgurl;
	
	public ProductDto() {
	}

	public ProductDto(String title, String price, String imgurl) {
		super();
		this.title = title;
		this.price = price;
		this.imgurl = imgurl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	@Override
	public String toString() {
		return "ProductDto [title=" + title + ", price=" + price + ", imgurl=" + imgurl + "]";
	}

}
