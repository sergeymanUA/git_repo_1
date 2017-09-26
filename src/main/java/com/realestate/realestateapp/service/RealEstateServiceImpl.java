package com.realestate.realestateapp.service;

import com.realestate.realestateapp.dao.RealEstateDao;
import com.realestate.realestateapp.model.RealEstate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RealEstateServiceImpl implements RealEstateService {

    @Autowired
    private RealEstateDao realEstateDao;

    @Override
    public List<RealEstate> findAll() {
        return realEstateDao.findAll();
    }

    @Override
    public RealEstate findById(Long id) {
        return null;
    }

    @Override
    public RealEstate findByInitPrice(Double initPrice) {
        return null;
    }

    @Override
    public RealEstate findByNRooms(int nrooms) {
        return null;
    }

    @Override
    public void deleteById(Long id) {

    }

    @Override
    public RealEstate save(RealEstate realEstate) {

        return null;
    }
}
