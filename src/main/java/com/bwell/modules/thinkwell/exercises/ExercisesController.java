package com.bwell.modules.thinkwell.exercises;

import com.bwell.modules.base.Entry;
import com.bwell.modules.thinkwell.exercises.model.Exercise;
import com.bwell.modules.thinkwell.exercises.service.ExerciseService;
import com.bwell.modules.thinkwell.exercises.service.IExerciseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@CrossOrigin("http://localhost:3000")
@RequestMapping("/api/v1/thinkwell/exercises")
public class ExercisesController {

    private final IExerciseService service;

    @Autowired
    public ExercisesController(ExerciseService service) {
        this.service = service;
    }

    @GetMapping("/")
    public List<Entry> getAllExercises() {
        return service.getAllExercises();
    }

    @GetMapping("/{id}")
    public Exercise getExercise(@PathVariable("id") Long id) {
        return service.getExercise(id);
    }

    @PostMapping("/")
    public Exercise addExercise(@RequestBody Exercise exercise) {
        return service.addExercise(exercise);
    }

    @DeleteMapping("/{id}")
    public boolean deleteExercise(@PathVariable("id") Long id) {
        return service.deleteExercise(id);
    }
}