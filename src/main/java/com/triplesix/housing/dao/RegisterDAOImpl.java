package com.triplesix.housing.dao;

import com.triplesix.housing.entity.Landlord;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class RegisterDAOImpl implements RegisterDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public void register(String username, String password, String gender, String fullname) {
        Landlord landlord = new Landlord(username, password, gender, fullname);
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.persist(landlord);
    }
}
