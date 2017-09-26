package com.realestate.realestateapp.service;

import com.realestate.realestateapp.model.RealEstate;

import java.util.List;

public interface RealEstateService {

    List<RealEstate> findAll();

    RealEstate findById(Long id);

    RealEstate findByInitPrice(Double initPrice);

    RealEstate findByNRooms(int nrooms);

    void deleteById(Long id);

    RealEstate save(RealEstate realEstate);


}
