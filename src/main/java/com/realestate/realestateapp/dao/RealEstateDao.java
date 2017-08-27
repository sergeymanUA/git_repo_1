package com.realestate.realestateapp.dao;

import com.realestate.realestateapp.model.RealEstate;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RealEstateDao extends JpaRepository<RealEstate, Long> {
    List<RealEstate> findAll();

    RealEstate findByInitPrice(String email);
    //RealEstate findByNRooms(Long id);
    void deleteById(Long id);

    // ...
}
