package com.shunicom.visualize;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;

public class processCount {
	private HashMap<String, Integer> countMap = new HashMap<String,Integer>();
	
	public processCount(String file){
		countMap = readCSV(file);
	}
	
	private HashMap<String, Integer> readCSV(String file){
		HashMap<String, Integer> toReturn = new HashMap<String,Integer>();
		try{
			FileReader fr = new FileReader(file);
			BufferedReader br = new BufferedReader(fr);
            String lineTxt = null;
            while((lineTxt = br.readLine()) != null){
            	String[] line = lineTxt.split(",");
                toReturn.put(line[0], Integer.parseInt(line[1]));
            }
            br.close();
		}catch (Exception e){
			System.out.println("failed");
		}
		return toReturn;
	}
	
	public HashMap<String,Integer> getMap(){
		return countMap;
	}
}
