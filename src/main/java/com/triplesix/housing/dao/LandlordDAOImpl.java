package com.triplesix.housing.dao;

import com.triplesix.housing.entity.Landlord;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class LandlordDAOImpl implements LandlordDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public String getLandlordEmailById(Integer id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Landlord> q = currentSession.createQuery("Select l from Landlord l where l.id=:id", Landlord.class);
        q.setParameter("id", id);
        String email = q.getResultList().get(0).getEmail();

        return email;
    }

}
