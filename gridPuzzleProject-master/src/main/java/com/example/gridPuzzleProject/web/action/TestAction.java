package com.example.gridPuzzleProject.web.action;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.StreamingResolution;
import net.sourceforge.stripes.action.UrlBinding;

/**
 * Created by user on 12-May-18.
 */

@UrlBinding("/test.action")
public class TestAction extends BaseAction {

    @DefaultHandler
    public Resolution view(){
        return new StreamingResolution("text/plain", "test");
    }

}
