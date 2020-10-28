package com.muyi.mymvc.service;

import com.muyi.mymvc.converter.StudentConverter;
import com.muyi.mymvc.dto.StudentDto;
import com.muyi.mymvc.model.Student;
import com.muyi.mymvc.repository.StudentRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class StudentService {

    StudentRepository studentRepository;
    StudentConverter converter;

    @Autowired
    public StudentService(StudentRepository studentRepository, StudentConverter converter) {
        this.studentRepository = studentRepository;
        this.converter = converter;
    }

    public List<StudentDto> getAllStudents(){
        List<Student> all = studentRepository.findAll();
        if(all.size()==0)
            return new ArrayList<StudentDto>();
        return converter.studentToDtoList(all);
    }

    public void deleteStudentById(Integer id){
        studentRepository.deleteById(id);
    }

    public void saveStudent(StudentDto stDto){
        Student st = converter.dtoToStudent(stDto);
        studentRepository.save(st);
    }

    public StudentDto getStudentById(Integer id){
        Student st = null;
        Optional<Student> optional = studentRepository.findById(id);
        if(optional.isPresent())
            st = optional.get();

        StudentDto stDto = new StudentDto();
        BeanUtils.copyProperties(st, stDto); //converter.studentToDto(st);
        return stDto;
    }
}
