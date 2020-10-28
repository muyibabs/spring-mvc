package com.muyi.mymvc.service;

import com.muyi.mymvc.dto.UserDto;
import com.muyi.mymvc.model.User;
import com.muyi.mymvc.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public UserDto validateUser(String username, String password){

//        User user = userRepository.getUserByUnamePwd(username, password);
        User user = userRepository.findByUsernameAndPassword(username, password);
        if(user==null)
            return null;
        System.out.println(user);
        UserDto dto = new UserDto(user.getName(), user.getUsername(), user.getDob(), "");
        return dto;
    }

    public UserDto validateUser(UserDto userDto){

//        User user = userRepository.getUserByUnamePwd(username, password);
        User user = userRepository.findByUsernameAndPassword(userDto.getUsername(), userDto.getPassword());
        if(user==null)
            return userDto;
        System.out.println(user);
        userDto = new UserDto(user.getName(), user.getUsername(), user.getDob(), "");
        userDto.setValidated(true);
        return userDto;
    }
}
