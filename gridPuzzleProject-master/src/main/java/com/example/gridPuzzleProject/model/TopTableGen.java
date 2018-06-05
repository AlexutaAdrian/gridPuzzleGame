package com.example.gridPuzzleProject.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by user on 14-May-18.
 */
public class TopTableGen {
    private Map<Integer, ArrayList<Integer>> multiMap;
    private Grid grid;
    private static Integer[][] column;

    public static Map<Integer, ArrayList<Integer>> topTableGen(Grid grid) {

        Map<Integer, ArrayList<Integer>> multiMap = new HashMap<>();

        if (grid.getSize() != null) {
            column = grid.getGrid();
            Integer key = 0;
            Integer gridSize = grid.getSize();
            for (int i = 0; i < gridSize; i++) {
                Integer checkPosition = 0;
                ArrayList<Integer> value = new ArrayList<>();

                for (int j = 0; j < gridSize; j++) {
                    if (column[j][i] != 0) {
                        checkPosition += column[j][i];
                    } else if ((column[j][i] != 0)&&(checkPosition != 0)) {
                        checkPosition += column[j][i];
                    } else {
                        if (checkPosition !=0) {
                            value.add(checkPosition);
                            checkPosition = 0;
                        }
                    }
                }
                if (checkPosition != 0) {
                    value.add(checkPosition);
                }
                multiMap.put(key, value);
                key++;
            }

            return multiMap;
        }
        return null;
    }
    public void setGrid(Grid grid) {
        this.grid = grid;
    }

    public Map<Integer, ArrayList<Integer>> getMultiMap() {
        return multiMap;
    }

    public void setMultiMap(Map<Integer, ArrayList<Integer>> multiMap) {
        this.multiMap = multiMap;
    }


}
