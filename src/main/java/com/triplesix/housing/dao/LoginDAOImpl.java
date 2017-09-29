package com.triplesix.housing.dao;


import com.google.common.hash.Hashing;
import com.triplesix.housing.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.nio.charset.StandardCharsets;
import java.util.List;


@Repository
public class LoginDAOImpl implements LoginDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public Integer checkLogin(String as, String username, String password) {

        // Create SHA256 password
        password = Hashing.sha256()
                .hashString(password, StandardCharsets.UTF_8)
                .toString();

        Session currentSession = sessionFactory.getCurrentSession();

        String SQL_QUERY = "from " + as + " as o where o.username=:username and o.password=:password";
        Query query = currentSession.createQuery(SQL_QUERY);
        query.setParameter("username", username);
        query.setParameter("password", password);

        List<User> list = query.list();

        if ((list != null) && (list.size() > 0)) {
            return list.get(0).getId();
        } else {
            return -1;
        }

    }
}
