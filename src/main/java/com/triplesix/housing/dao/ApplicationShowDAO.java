package com.triplesix.housing.dao;

import com.triplesix.housing.entity.Application;
import com.triplesix.housing.entity.ApplicationShow;

import java.util.List;

public interface ApplicationShowDAO {

    List<ApplicationShow> getApplicationShowsList(List<Application> applications);
}
