package com.shunicom.visualize;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

public class processMap {
	private List<rectangle> locations;
	
	public processMap(String filename){
		locations = populate(filename);
	}
	
	private ArrayList<rectangle> populate(String file){
		ArrayList<rectangle> toReturn = new ArrayList<rectangle>();
		try{
			FileReader fr = new FileReader(file);
			BufferedReader br = new BufferedReader(fr);
            String lineTxt = null;
            String[][] lineGroup = new String[4][4];
            while((lineTxt = br.readLine()) != null){
            	String[] line = lineTxt.split(",");
            	if (line[1].equals("1")){
            		lineGroup[0] = line;
            	} else if (line[1].equals("2")){
            		lineGroup[1] = line;
            	} else if (line[1].equals("3")){
            		lineGroup[2] = line;
            	} else if (line[1].equals("4")){
            		lineGroup[3] = line;
            		toReturn.add(initRect(lineGroup));
            	} else {
            		System.out.println("invalid");
            	};
            }
            br.close();
		}catch (Exception e){
			System.out.println("failed");
		}
		return toReturn;
	}
	
	private rectangle initRect(String[][] lineGroup){
		if (isConsistent(lineGroup)){
			String gridID = lineGroup[0][0];
			rectangle toReturn = new rectangle(gridID);
			toReturn.setSW(lineGroup[0]);
			toReturn.setSE(lineGroup[1]);
			toReturn.setNE(lineGroup[2]);
			toReturn.setNW(lineGroup[3]);
			return toReturn;
		} else {
			System.out.println("cannot initiate");
			return null;
		}
	}
	
	private boolean isConsistent(String[][] lineGroup){
		if (lineGroup.length != 4){
			return false;
		} else {
			boolean result = true;
			String first = lineGroup[0][0];
			for (int i = 1; i < 4; i ++){
				result = result && (first.equals(lineGroup[i][0]));
			}
			return result;
		}
	}
	
	public List<rectangle> getList(){
		return locations;
	}
	

}
