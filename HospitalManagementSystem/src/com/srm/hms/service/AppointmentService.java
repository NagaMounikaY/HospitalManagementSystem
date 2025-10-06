package com.srm.hms.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import com.srm.hms.dao.AppointmentDao;
import com.srm.hms.model.Appointment;

public class AppointmentService {
    private AppointmentDao dao;

    public AppointmentService() {
        this.dao = new AppointmentDao();
    }

    // Step 1: Create draft appointment
    public boolean createDraft(Appointment appointment) throws SQLException {
        return dao.createDraft(appointment);
    }

    // Step 2: Update slot & mark as Pending
    public boolean updateSlot(int appointmentId, int slotId, Date slotDate) throws SQLException {
        return dao.updateSlot(appointmentId, slotId, slotDate);
    }

    // Admin: Assign doctor
    public boolean assignDoctor(int appointmentId, int doctorId) throws SQLException {
        return dao.assignDoctor(appointmentId, doctorId);
    }

    // Update status (e.g., Paid, Completed, Cancelled)
    public boolean updateStatus(int appointmentId, String status) throws SQLException {
        return dao.updateStatus(appointmentId, status);
    }

    // Get appointments by patient
    public List<Appointment> getAppointmentsByPatient(int patientId) throws SQLException {
        return dao.getAppointmentsByPatient(patientId);
    }

    // Get appointments by doctor
    public List<Appointment> getAppointmentsByDoctor(int doctorId) throws SQLException {
        return dao.getAppointmentsByDoctor(doctorId);
    }

    // Admin: get all paid appointments
    public List<Appointment> getPaidAppointments() throws SQLException {
        return dao.getPaidAppointments();
    }
}
