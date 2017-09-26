package com.realestate.realestateapp.model;

import javax.persistence.*;

import java.sql.Date;

@Entity
@Table(name = "real_estates")
public class RealEstate {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "type", unique = true, nullable = false, length = 100)
    private String type;

    @Column(name = "area", unique = false, nullable = false)
    private Double area;

    @Column(name = "nrooms", unique = false, nullable = false)
    private Byte nrooms;

    @Temporal(TemporalType.DATE)
    @Column(name = "dateIn", unique = false, nullable = false)
    private Date dateIn;

    @Column(name = "initPrice", nullable = false, precision = 10, scale = 2)
    private Double initPrice;

    @Column(name = "userDesc", unique = true, nullable = false, length = 300)
    private String userDescription;

    @Column(name = "photoName", unique = true, nullable = false, length = 300)
    private String photoName;

    @Column(name = "fullAddress", unique = true, nullable = false, length = 300)
    private String fullAddress;

    @ManyToOne
    @JoinColumn(name = "owner_id")
    private User owner;

    public RealEstate() {}

    public RealEstate(Long id, String type, Double area, Byte nrooms, Date dateIn, Double initPrice, String userDescription, String photoName, String fullAddress, User owner) {
        this.id = id;
        this.type = type;
        this.area = area;
        this.nrooms = nrooms;
        this.dateIn = dateIn;
        this.initPrice = initPrice;
        this.userDescription = userDescription;
        this.photoName = photoName;
        this.fullAddress = fullAddress;
        this.owner = owner;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Byte getNrooms() {
        return nrooms;
    }

    public void setNrooms(Byte nrooms) {
        this.nrooms = nrooms;
    }

    public Date getDateIn() {
        return dateIn;
    }

    public void setDateIn(Date dateIn) {
        this.dateIn = dateIn;
    }

    public Double getInitPrice() {
        return initPrice;
    }

    public void setInitPrice(Double initPrice) {
        this.initPrice = initPrice;
    }

    public String getUserDescription() {
        return userDescription;
    }

    public void setUserDescription(String userDescription) {
        this.userDescription = userDescription;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public String getFullAddress() {
        return fullAddress;
    }

    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {

        if (!(object instanceof RealEstate)) {
            return false;
        }
        RealEstate other = (RealEstate) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "RealEstate{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", area=" + area +
                ", nrooms=" + nrooms +
                ", dateIn=" + dateIn +
                ", initPrice=" + initPrice +
                ", userDescription='" + userDescription + '\'' +
                ", photoName='" + photoName + '\'' +
                ", fullAddress='" + fullAddress + '\'' +
                ", owner=" + owner +
                '}';
    }
}
