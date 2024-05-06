package vo;

public class ProductVO {
	private String name;
	private String image_url;
	private int price;
	private int size_up_price;
	private int shot_price;
	private boolean shot_available;
	
	// 디폴트 생성자
	public ProductVO() {}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSize_up_price() {
		return size_up_price;
	}
	public void setSize_up_price(int size_up_price) {
		this.size_up_price = size_up_price;
	}
	public int getShot_price() {
		return shot_price;
	}
	public void setShot_price(int shot_price) {
		this.shot_price = shot_price;
	}
	public boolean isShot_available() {
		return shot_available;
	}
	public void setShot_available(boolean shot_available) {
		this.shot_available = shot_available;
	}
}
