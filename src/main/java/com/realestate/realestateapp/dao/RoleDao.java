package com.realestate.realestateapp.dao;

import com.realestate.realestateapp.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleDao extends JpaRepository<Role, Long> {
}
