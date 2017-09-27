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
    public List<House> getLandlordHouses(Integer id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<House> q = currentSession.createQuery("from House", House.class);
        List<House> houses = q.getResultList();
        return houses;
    }
}
