package com.example.gridPuzzleProject.web.action;

import com.example.gridPuzzleProject.model.*;
import com.example.gridPuzzleProject.model.Grid;
import net.sourceforge.stripes.action.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static java.lang.Integer.parseInt;

/**
 * Created by Dedi on 5/10/2018.
 */

@UrlBinding("/RandomGrid.action")
public class RandomGridAction extends BaseAction {


    private Grid grid;
    private Map<Integer, ArrayList<Integer>> sideMap;
    private Map<Integer, ArrayList<Integer>> topMap;

    @DefaultHandler
    public Resolution view() {
        Integer size = 8;
//        try {
//            size = Integer.parseInt(this.request.getParameter("size"));
//
//        } catch (Exception exception) {
//            System.err.println("Exception parsing id: " + exception.getMessage());
//        }

        if (size != null) {
            Integer[][] randomGrid = Grid.populate(size);
            this.grid = new Grid(size, randomGrid);
            this.request.getSession().setAttribute("grid", grid);
        }

        return new ForwardResolution("/pages/randomGrid.jsp");
    }

    public Map<Integer, ArrayList<Integer>> getSideTableGen() {
        return sideMap = SideTableGen.sideTableGen(grid);
    }

    public Map<Integer, ArrayList<Integer>> getTopTableGen() {
        return topMap = TopTableGen.topTableGen(grid);
    }

    public Grid getRandomGrid() {
        return grid;
    }

    public Integer getGridSize() {
        return grid.getSize();
    }

    @HandlesEvent("check")
    public Resolution check() {
        String nr = this.request.getParameter("nr");
            return new StreamingResolution("text/plain", nr);
    }

//    @DefaultHandler
//    @HandlesEvent("check")

    //
//    public Map<Integer, Integer> getTestMap() {
//        Map<Integer, Integer> randomMap = new HashMap<>();
//        randomMap.put(1, 1);
//        randomMap.put(2, 3);
//        randomMap.put(3, 5);
//        randomMap.put(4, 7);
//
//        return randomMap;
//    }

    //
}



