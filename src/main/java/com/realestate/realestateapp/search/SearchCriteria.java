package com.realestate.realestateapp.search;

public class SearchCriteria {
    private String priceFrom;
    private String priceTo;
    private String roomsNumber;

    public SearchCriteria() {
        this.priceFrom = "";
        this.priceTo = "";
        this.roomsNumber = "";
    }

    public SearchCriteria(String priceFrom, String priceTo, String roomsNumber) {
        this.priceFrom = priceFrom;
        this.priceTo = priceTo;
        this.roomsNumber = roomsNumber;
    }

    public String getPriceFrom() {
        return priceFrom;
    }

    public String getPriceTo() {
        return priceTo;
    }

    public String getRoomsNumber() {
        return roomsNumber;
    }

    public void setPriceFrom(String priceFrom) {
        this.priceFrom = priceFrom;
    }

    public void setPriceTo(String priceTo) {
        this.priceTo = priceTo;
    }

    public void setRoomsNumber(String roomsNumber) {
        this.roomsNumber = roomsNumber;
    }
}
