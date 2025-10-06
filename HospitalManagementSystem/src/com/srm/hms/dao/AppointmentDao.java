package com.srm.hms.dao;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import com.srm.hms.model.Appointment;
import com.srm.hms.util.JdbcUtils;

public class AppointmentDao {

    // Step 1: Create draft appointment
    public boolean createDraft(Appointment appointment) {
        String sql = "INSERT INTO appointments (patient_id, description, status) VALUES (?, ?, 'Draft')";
        try (Connection con = JdbcUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, appointment.getPatientId());
            ps.setString(2, appointment.getDescription());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                ResultSet keys = ps.getGeneratedKeys();
                if (keys.next()) {
                    appointment.setAppointmentId(keys.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            JdbcUtils.printSQLException(e);
        }
        return false;
    }

    // Step 2: Update slot
    public boolean updateSlot(int appointmentId, int slotId, Date slotDate) {
        String sql = "UPDATE appointments SET slot_id=?, slot_date=?, status='Pending' WHERE appointment_id=?";
        try (Connection con = JdbcUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, slotId);
            ps.setDate(2, slotDate);
            ps.setInt(3, appointmentId);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            JdbcUtils.printSQLException(e);
            return false;
        }
    }

    // Assign doctor (Admin)
    public boolean assignDoctor(int appointmentId, int doctorId) {
        String sql = "UPDATE appointments SET doctor_id=?, status='Assigned' WHERE appointment_id=?";
        try (Connection con = JdbcUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, doctorId);
            ps.setInt(2, appointmentId);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            JdbcUtils.printSQLException(e);
            return false;
        }
    }

    // Update status
    public boolean updateStatus(int appointmentId, String status) {
        String sql = "UPDATE appointments SET status=? WHERE appointment_id=?";
        try (Connection con = JdbcUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, appointmentId);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            JdbcUtils.printSQLException(e);
            return false;
        }
    }

    // Get by patient
    public List<Appointment> getAppointmentsByPatient(int patientId) {
        List<Appointment> list = new ArrayList<>();
        String sql = "SELECT * FROM appointments WHERE patient_id=?";
        try (Connection con = JdbcUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, patientId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResult(rs));
            }
        } catch (SQLException e) {
            JdbcUtils.printSQLException(e);
        }
        return list;
    }

    // Get by doctor
    public List<Appointment> getAppointmentsByDoctor(int doctorId) {
        List<Appointment> list = new ArrayList<>();
        String sql = "SELECT * FROM appointments WHERE doctor_id=?";
        try (Connection con = JdbcUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, doctorId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResult(rs));
            }
        } catch (SQLException e) {
            JdbcUtils.printSQLException(e);
        }
        return list;
    }

    // Admin view Paid appointments
    public List<Appointment> getPaidAppointments() {
        List<Appointment> list = new ArrayList<>();
        String sql = "SELECT a.appointment_id, a.patient_id, a.doctor_id, a.description, a.slot_date, a.status, "
                + "u.user_first_name, u.user_last_name, "
                + "t.slot_id, t.slot_time "
                + "FROM appointments a "
                + "JOIN users u ON a.patient_id = u.user_id "
                + "JOIN time_slots t ON a.slot_id = t.slot_id "
                + "WHERE a.status = 'Paid'";

        try (Connection con = JdbcUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResult(rs));
            }
        } catch (SQLException e) {
            JdbcUtils.printSQLException(e);
        }
        return list;
    }

    private Appointment mapResult(ResultSet rs) throws SQLException {
        Appointment a = new Appointment();

        a.setAppointmentId(rs.getInt("appointment_id"));
        a.setPatientId(rs.getInt("patient_id"));
        a.setDoctorId(rs.getInt("doctor_id"));
        a.setDescription(rs.getString("description"));
        a.setSlotDate(rs.getDate("slot_date"));
        a.setStatus(rs.getString("status"));

        // Patient name for display
        a.setPatientName(rs.getString("user_first_name") + " " + rs.getString("user_last_name"));

        // Slot time for display
        a.setSlotTime(rs.getTime("slot_time"));

        return a;
    }
}
