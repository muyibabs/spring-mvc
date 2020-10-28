package com.muyi.mymvc.converter;

import com.muyi.mymvc.dto.StudentDto;
import com.muyi.mymvc.model.Student;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class StudentConverter {

    public Student dtoToStudent(StudentDto studentDto){
        Student student = new Student();
        student.setId(studentDto.getId());
        student.setName(studentDto.getName());
        student.setAge(studentDto.getAge());
        return student;
    }

    public StudentDto studentToDto(Student st){
        StudentDto dto = new StudentDto();
        dto.setId(st.getId());
        dto.setName(st.getName());
        dto.setAge(st.getAge());
        return dto;
    }

    public List<Student> dtoToStudentList(List<StudentDto> dtos){
        return dtos.stream().map(dto -> dtoToStudent(dto)).collect(Collectors.toList());
    }

    public List<StudentDto> studentToDtoList(List<Student> students){
        return students.stream().map(st -> studentToDto(st)).collect(Collectors.toList());
    }
}
