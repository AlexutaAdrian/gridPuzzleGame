package com.example.gridPuzzleProject.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by user on 13-May-18.
 */
public class SideTableGen {
    private Grid grid;
    private Map<Integer, ArrayList<Integer>> multiMap;
    private static Integer[][] tempGrid ;

    public static Map<Integer, ArrayList<Integer>>  sideTableGen(Grid grid) {

        Map<Integer, ArrayList<Integer>> multiMap = new HashMap<>();

        if (grid.getSize() != null) {
            Integer gridSize = grid.getSize();
            tempGrid = grid.getGrid();
            Integer key = 0;
            for (int j = 0; j < gridSize; j++) {
                Integer checkPosition = 0;
                ArrayList<Integer> value = new ArrayList<>();
                Integer[] row = tempGrid[j];

                for (Integer i : row) {

                    if (i != 0) {
                        checkPosition += i;

                    } else if((i != 0) && (checkPosition != 0)){
                        checkPosition += i;
                    } else {
                        if(checkPosition != 0) {
                            value.add(checkPosition);
                        }
                        checkPosition = 0;
                    }
                }
                if(checkPosition != 0) {
                    value.add(checkPosition);
                }
                multiMap.put(key, value);
                key++;

            }
            return multiMap;
        }
        return null;
    }
    public Map<Integer, ArrayList<Integer>> getMultiMap() {
        return multiMap;
    }

    public void setMultiMap(Map<Integer, ArrayList<Integer>> multiMap) {
        this.multiMap = multiMap;
    }

}
