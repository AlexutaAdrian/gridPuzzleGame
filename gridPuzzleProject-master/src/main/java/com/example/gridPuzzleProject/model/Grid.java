package com.example.gridPuzzleProject.model;

/**
 * Created by Dedi on 5/3/2018.
 */
public class Grid {
    private Integer id;
    private Integer size;
    private Integer[][] grid ;

    public Grid(Integer size, Integer[][] grid) {
        this.size = size;
        this.grid = grid;
    }

    public static Integer[][] populate( Integer size){
        Integer[][] randomGrid = new Integer[size][size];
        for (int i = 0; i <randomGrid.length ; i++) {
            for (int j = 0; j <randomGrid.length ; j++) {
                randomGrid[i][j] = NotRandomNrGenerator.randomIsh();
            }
        }
        return randomGrid;
    }

    public static Integer[][] recreateGrid(String gridCode, int size){
        Integer[][] newGrid = new Integer[size][size];

        String[] temp1 = gridCode.split("/");
        String[] temp2;
        for (int i = 0; i < temp1.length ; i++) {
            temp2 = temp1[i].split("");
            for (int j = 0; j < temp1.length ; j++) {
                newGrid[i][j]= Integer.parseInt(temp2[j]);
            }
        }
        return newGrid;
    }


    public Integer getId() {
        return id;
    }

    public Integer getSize() {
        return size;
    }
    public void setGrid(Integer[][] grid) {
        this.grid = grid;
    }

    public Integer[][] getGrid() {
        return grid;
    }
}
