package com.realestate.realestateapp.dao;

import com.realestate.realestateapp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserDao extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findByEmail(String email);
    User findById(Long id);
    List<User> findAll();
    void deleteById(Long id);

}
