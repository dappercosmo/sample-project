package com.sample.actions.sample.serviceImpl;

import com.sample.actions.sample.model.Person;
import com.sample.actions.sample.repository.PersonRepository;
import com.sample.actions.sample.service.PersonService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonServiceImpl implements PersonService {

    private final PersonRepository personRepository;

    public PersonServiceImpl(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    @Override
    public Person addPerson(Person person) {
        Person newPerson = new Person();
        newPerson.setName(person.getName());
        newPerson.setAge(person.getAge());
        return personRepository.save(newPerson);
    }

    @Override
    public List<Person> getAllPersons() {
        return personRepository.findAll();
    }
}
