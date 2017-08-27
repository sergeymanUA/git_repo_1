package com.realestate.realestateapp.service;

import com.realestate.realestateapp.model.User;

import java.util.List;

public interface UserService {

    void save(User user);

    User findByUsername(String username);

    User findByEmail(String email);

    User findById(Long id);

    List<User> findAll();

    void deleteById(Long id);

}
