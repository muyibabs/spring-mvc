package com.muyi.mymvc.controller;

import com.muyi.mymvc.dto.StudentDto;
import com.muyi.mymvc.dto.UserDto;
import com.muyi.mymvc.model.Student;
import com.muyi.mymvc.service.StudentService;
import com.muyi.mymvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MainController {
    //use session
    //transform dto
    private UserService userService;
    private StudentService studentService;

    @Autowired
    public MainController(UserService userService, StudentService studentService) {
        this.userService = userService;
        this.studentService = studentService;
    }

    @GetMapping({"/", "home", "index", "start"})
    public String handleHome(Model model){
        UserDto userDto = new UserDto();
        model.addAttribute("user", userDto);
        return "login";
    }

    @PostMapping("/login.do")
    public String validateUser(Model model, @ModelAttribute UserDto dto){
        dto = userService.validateUser(dto);

        if(dto==null || !dto.isValidated()) {
            model.addAttribute("user", dto);
            return "login";
        }

        model.addAttribute("userDto", dto);
        return "redirect:/dashboard";
    }

    @GetMapping("/delete.do")
    public String deleteUser(Model model, @RequestParam("id") Integer id){
        studentService.deleteStudentById(id);
        return "redirect:/dashboard";
    }

    @GetMapping("dashboard")
    private String updateModel(Model model){
        List<StudentDto> studentDtos = studentService.getAllStudents();
        model.addAttribute("students", studentDtos);
        return "dashboard";
    }

    @GetMapping("/addnew.do")
    public String addStudent(Model model){
        StudentDto studentDto = new StudentDto();
        model.addAttribute("student", studentDto);
        return "new_student";
    }

    @PostMapping("/save.do")
    public String saveStudent(@ModelAttribute StudentDto studentDto){
        studentService.saveStudent(studentDto);
        return "redirect:/dashboard";
    }

    @GetMapping("/edit.do/{id}")
    public String editUser(Model model, @PathVariable("id") Integer id){
        StudentDto stDto = studentService.getStudentById(id);
        //if(st==null) //go back to dash

        model.addAttribute("student", stDto);
        return "new_student";
    }
}
