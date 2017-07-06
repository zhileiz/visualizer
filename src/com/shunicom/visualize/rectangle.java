package com.shunicom.visualize;

public class rectangle {
	public String gridID;
	public double swlng;
	public double swlat;
	public double selng;
	public double selat;
	public double nwlng;
	public double nwlat;
	public double nelng;
	public double nelat;
	
	public rectangle(String gridID){
		this.gridID = gridID;
	}
	
	public void setSW(String[] line){
		this.swlng = Double.parseDouble(line[2]);
		this.swlat = Double.parseDouble(line[3]);
	}
	
	public void setSE(String[] line){
		this.selng = Double.parseDouble(line[2]);
		this.selat = Double.parseDouble(line[3]);
	}
	
	public void setNW(String[] line){
		this.nwlng = Double.parseDouble(line[2]);
		this.nwlat = Double.parseDouble(line[3]);
	}
	
	public void setNE(String[] line){
		this.nelng = Double.parseDouble(line[2]);
		this.nelat = Double.parseDouble(line[3]);
	}
	
	public String getString(){
		return "{\"id\":\"" + gridID + "\",\"swlng\":\"" + swlng + "\",\"swlat\":\"" + swlat + "\",\"selng\":\"" + selng + "\",\"selat\":\"" + selat 
				+ "\",\"nwlng\":\"" + nwlng + "\",\"nwlat\":\"" + nwlat + "\",\"nelng\":\"" + nelng + "\",\"nelat\":\"" + nelat + "\"},";
	}
	
	

	
}
