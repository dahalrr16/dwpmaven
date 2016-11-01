package obj.domain;

public class Color {
	
private String colorName;
private String colorCode;
public Color(String s1, String s2) {
	this.colorName=s1;
	this.colorCode=s2;
	
}
public Color() {
	// TODO Auto-generated constructor stub
}
public String getColorName() {
	return colorName;
}
public void setColorName(String colorName) {
	this.colorName = colorName;
}
public String getColorCode() {
	return colorCode;
}
public void setColorCode(String colorCode) {
	this.colorCode = colorCode;
}

}
