package com.example.gridPuzzleProject.model;

import java.util.Random;

/**
 * Created by Dedi on 5/3/2018.
 */
public class NotRandomNrGenerator {

    public static int randomIsh(){
        Random random = new Random();

        int[] randomnChoice = {0,0,1,1,1,1};

        return randomnChoice[random.nextInt(6)];
    }

}
