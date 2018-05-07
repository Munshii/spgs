package model;

public class Cart {
	private String gameTitle = "";
	private int quantity = 0;
	private double price = 0;

	
	
	public Cart(String gameTitle, int quantity, double price) {
		super();
		this.gameTitle = gameTitle;
		this.quantity = quantity;
		this.price = price;
	}

	public String getGameTitle() {
		return gameTitle;
	}

	public void setGameTitle(String gameTitle) {
		this.gameTitle = gameTitle;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
}
