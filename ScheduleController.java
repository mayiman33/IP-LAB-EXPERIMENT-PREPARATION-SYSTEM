package com.labsystem.app.controller;

import com.labsystem.app.model.Booking;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.Arrays;
import java.util.List;

@Controller
public class ScheduleController {

    @GetMapping("/schedule")
    public String showSchedule(Model model) {
        // Dummy data to populate the timetable view
        List<Booking> bookings = Arrays.asList(
                new Booking("Chem Lab Bench 3", "2025-12-05 10:00 - 12:00", "Dr. A. Smith"),
                new Booking("Microscope Area", "2025-12-05 13:00 - 15:00", "Student Group B"),
                new Booking("Fume Hood 1", "2025-12-06 09:00 - 11:00", "Research Team C"));

        // Adds the list object required by the timetable.html th:each="booking :
        // ${bookingList}"
        model.addAttribute("bookingList", bookings);
        return "timetable";
    }
}