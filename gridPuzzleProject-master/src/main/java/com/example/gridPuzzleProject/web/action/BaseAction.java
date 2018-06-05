package com.example.gridPuzzleProject.web.action;

import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.ActionBeanContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by user on 12-May-18.
 */
public class BaseAction implements ActionBean {

    protected ActionBeanContext context;
    protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected HttpSession session;

    @Override
    public void setContext(ActionBeanContext context) {

        this.context = context;
        this.request = context.getRequest();
        this.response = context.getResponse();
        this.session = this.request != null ? this.request.getSession() : null;

    }

    @Override
    public ActionBeanContext getContext() {
        return this.context;
    }
}
