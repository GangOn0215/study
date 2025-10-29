package com.example.hello.controller;

import com.example.hello.common.enums.PostsCategory;
import com.example.hello.entity.Posts;
import com.example.hello.service.PostsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/posts")
public class PostsController {
    private final PostsService postsService;

    @Autowired
    public PostsController(PostsService postsService) {
        this.postsService = postsService;
    }
    @GetMapping
    public List<Posts> getAll() {
        return postsService.getAll();
    }

    @GetMapping("/lists")
    public List<Posts> getAllWithUser() {
        return postsService.getAllWithUser();
    }

}
