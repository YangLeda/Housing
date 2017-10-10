package com.triplesix.housing.dao;

import com.triplesix.housing.entity.House;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class HouseDAOImpl implements HouseDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<House> getHouses() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<House> q = currentSession.createQuery("from House", House.class);
        List<House> houses = q.getResultList();
        return houses;
    }

    @Override
    @Transactional
    public List<House> searchHouses(Integer minBedrooms, Integer minBathrooms, Integer minCarparks,
                                    Integer minPrice, Integer maxPrice) {
        Session currentSession = sessionFactory.getCurrentSession();

        String query = "Select h from House h where " +
                "h.bedrooms >= :minBedrooms and " +
                "h.bathrooms >= :minBathrooms and " +
                "h.carparks > :minCarparks and " +
                "h.price between :minPrice and :maxPrice";

        Query<House> q = currentSession.createQuery(query, House.class);
        q.setParameter("minBedrooms", minBedrooms);
        q.setParameter("minBathrooms", minBathrooms);
        q.setParameter("minCarparks", minCarparks);
        q.setParameter("minPrice", minPrice);
        q.setParameter("maxPrice", maxPrice);

        List<House> houses = q.getResultList();

        return houses;
    }

    @Override
    @Transactional
    public List<House> getLandlordHouses(Integer id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<House> q = currentSession.createQuery("Select h from House h where h.landlordid=:id", House.class);
        q.setParameter("id", id);
        List<House> houses = q.getResultList();
        return houses;
    }

    @Override
    @Transactional
    public House getHouseById(Integer id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<House> q = currentSession.createQuery("Select h from House h where h.id=:id", House.class);
        q.setParameter("id", id);
        House house = q.getResultList().get(0);
        return house;
    }

    @Override
    @Transactional
    public Integer addHouse(String address, String description, Integer price, Integer bedrooms, Integer bathrooms, Integer carparks, String pic, Integer landlordid) {
        House house = new House(address, description, price, bedrooms, bathrooms, carparks, pic, landlordid);
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.persist(house);
        currentSession.flush();
        return house.getId();
    }

    @Override
    @Transactional
    public void deleteHouseById(Integer id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery("delete from House where id=:id");
        query.setParameter("id", id);
        query.executeUpdate();
    }

}
