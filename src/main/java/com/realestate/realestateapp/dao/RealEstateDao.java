package com.realestate.realestateapp.dao;

import com.realestate.realestateapp.model.RealEstate;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RealEstateDao extends JpaRepository<RealEstate, Long> {
    List<RealEstate> findAll();

    RealEstate findByInitPrice(Double initPrice);

/*    @Query("SELECT re FROM real_estates re WHERE re.nrooms = ?1")
    RealEstate findByNRooms(Byte nrooms);*/

    void deleteById(Long id);

    // ...

    RealEstate findById(Long id);

   // RealEstate save(RealEstate realEstate);
}
