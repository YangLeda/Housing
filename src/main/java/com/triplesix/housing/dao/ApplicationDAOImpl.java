package com.triplesix.housing.dao;


import com.triplesix.housing.entity.Application;
import com.triplesix.housing.entity.House;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Repository
public class ApplicationDAOImpl implements ApplicationDAO {


    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public void addApplication(String name, String phone, String email, String message, Date time, Integer houseid, Integer studentid, Integer landlordid) {
        Application application = new Application(name, phone, email, message, time, houseid, studentid, landlordid, "Pending");
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.persist(application);
    }

    @Override
    @Transactional
    public List<Application> getApplicationsByStudentId(Integer studentid) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Application> q = currentSession.createQuery("Select a from Application a where a.studentid=:id", Application.class);
        q.setParameter("id", studentid);
        List<Application> applications = q.getResultList();
        return applications;
    }

    @Override
    @Transactional
    public List<Application> getAllApplications() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Application> q = currentSession.createQuery("from Application", Application.class);
        List<Application> applications = q.getResultList();
        return applications;
    }

    @Override
    @Transactional
    public List<Application> getApplicationsByLandlordId(Integer landlordid) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Application> q = currentSession.createQuery("Select a from Application a where a.landlordid=:id", Application.class);
        q.setParameter("id", landlordid);
        List<Application> applications = q.getResultList();
        return applications;
    }

    @Override
    @Transactional
    public void deleteApplicationById(Integer id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery("delete from Application where id=:id");
        query.setParameter("id", id);
        query.executeUpdate();
    }

    @Override
    @Transactional
    public void setStatusById(Integer applicationId, String status) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery("update Application set status=:status where id=:id");
        query.setParameter("id", applicationId);
        query.setParameter("status", status);
        query.executeUpdate();
    }

    @Override
    @Transactional
    public String getEmailById(Integer id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Application> q = currentSession.createQuery("Select a from Application a where a.id=:id", Application.class);
        q.setParameter("id", id);
        String email = q.getResultList().get(0).getEmail();

        return email;
    }

}
