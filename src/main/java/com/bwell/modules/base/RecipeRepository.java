package com.bwell.modules.base;

import com.bwell.modules.eatwell.recipes.model.Recipe;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RecipeRepository extends JpaRepository<Recipe, Long> {
}
