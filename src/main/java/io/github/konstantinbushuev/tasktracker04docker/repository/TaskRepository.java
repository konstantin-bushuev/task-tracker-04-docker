package io.github.konstantinbushuev.tasktracker04docker.repository;

import io.github.konstantinbushuev.tasktracker04docker.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepository extends JpaRepository<Task, Long> {
}
