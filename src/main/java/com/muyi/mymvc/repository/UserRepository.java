package com.muyi.mymvc.repository;

import com.muyi.mymvc.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query("from User where username=?1 and password=?2")
    public User getUserByUnamePwd(String uname, String pwd);

    public User findByUsernameAndPassword(String uname, String pwd);
}
