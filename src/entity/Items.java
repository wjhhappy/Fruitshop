package entity;
public class Items {
	private int id; 
	private String name; 
	private String type;
	private String size;
	private String matures;
	private String city; 
	private String introduce;
	private Double price; 
	private String picture; 
	public Items()
	{
		
	}
	
	public Items(int id,String name,String type,String size,String matures,String city,String introduce,Double price,String picture)
	{
		this.id = id;
		this.type = type;
		this.name = name;
		this.size = size;
		this.matures = matures;
		this.city = city;
		this.introduce = introduce;
		this.price = price;
		this.picture = picture;
		
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}
	public String getMatures() {
		return matures;
	}

	public void setMatures(String matures) {
		this.matures =matures;
	}
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city= city;
	}
	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce=introduce;
	}
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return this.getId()+this.getName().hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(this==obj)
		{
			return true;
		}
		if(obj instanceof Items)
		{
			Items i = (Items)obj;
			if(this.getId()==i.getId()&&this.getName().equals(i.getName()))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}

	public String toString()
	{
		return "商品编号："+this.getId()+",商品名称："+this.getName();
	}

}
