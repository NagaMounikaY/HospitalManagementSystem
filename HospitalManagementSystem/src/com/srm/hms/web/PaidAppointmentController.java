package com.srm.hms.web;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.srm.hms.model.Appointment;
import com.srm.hms.model.Users;
import com.srm.hms.service.AppointmentService;
import com.srm.hms.service.UserService;

@WebServlet("/paidAppointments")
public class PaidAppointmentController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AppointmentService appointmentService;
    private UserService userService;

    public void init() {
        appointmentService = new AppointmentService();
        userService =new UserService();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "list":
                    listPaidAppointments(request, response);
                    break;
                case "assignDoctor":
                    assignDoctor(request, response);
                    break;
                default:
                    listPaidAppointments(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("Customer/error-page.jsp").forward(request, response);
        }
    }

    private void listPaidAppointments(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Appointment> paidList = appointmentService.getPaidAppointments();
            request.setAttribute("paidList", paidList);

            List<Users> doctors = userService.getAllDoctors();
            request.setAttribute("doctorList", doctors);

            RequestDispatcher rd = request.getRequestDispatcher("Admin/paidAppointments.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void assignDoctor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));

        try {
            boolean updated = appointmentService.assignDoctor(appointmentId, doctorId);
            if (updated) {
                response.sendRedirect(request.getContextPath() + "/paidAppointments?action=list");
            } else {
                request.setAttribute("errorMessage", "Failed to assign doctor.");
                listPaidAppointments(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            listPaidAppointments(request, response);
        }
    }
}
