package com.example.gridPuzzleProject.web;

import com.example.gridPuzzleProject.dao.BaseDao;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

/**
 * Created by user on 12-May-18.
 */
public class ApplicationServlet extends HttpServlet{

    public void init(ServletConfig config) throws ServletException {

        super.init(config);

        BaseDao.init("com.postgresql.Driver", "jdbc:postgresql://localhost/restaurant", "postgres", "postgres");
        System.out.println("Application initialized successfully");

    }

}
