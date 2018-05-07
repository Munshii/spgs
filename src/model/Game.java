package model;

public class Game {

	private String gameID;
	private String gameTitle;
	private String image;
	private double price;
	private int quantity;
	
	public Game(String gameID, String gameTitle, String image, double price,
			int quantity) {
		super();
		this.gameID = gameID;
		this.gameTitle = gameTitle;
		this.image = image;
		this.price = price;
		this.quantity = quantity;
	}
	public Game(){
		
	}
	
	
	public String getGameID() {
		return gameID;
	}
	public void setGameID(String gameID) {
		this.gameID = gameID;
	}
	public String getGameTitle() {
		return gameTitle;
	}
	public void setGameTitle(String gameTitle) {
		this.gameTitle = gameTitle;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
