package com.triplesix.housing.dao;

import com.google.common.hash.Hashing;
import com.triplesix.housing.entity.Landlord;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.nio.charset.StandardCharsets;

@Repository
public class RegisterDAOImpl implements RegisterDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public void register(String username, String password, String fullname, String email) {

        // Create SHA256 password
        password = Hashing.sha256()
                .hashString(password, StandardCharsets.UTF_8)
                .toString();

        Landlord landlord = new Landlord(username, password, fullname, email);
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.persist(landlord);
    }
}
