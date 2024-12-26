package com.sample.actions.sample.service;

import com.sample.actions.sample.model.Person;

import java.util.List;

public interface PersonService {
    Person addPerson(Person person);
    List<Person> getAllPersons();
}
