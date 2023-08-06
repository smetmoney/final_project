package com.bitc.project.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.apache.taglibs.standard.extra.spath.Path;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bitc.project.vo.FreeBoardVO.Post;

@Controller
public class FreeBoardController {
    @Autowired
    private PostRepository postRepository;

    @GetMapping("/posts")
    public String showPosts(Model model) {
        List<Post> posts = postRepository.findAll();
        model.addAttribute("posts", posts);
        return "post_list";
    }

    @GetMapping("/posts/{id}")
    public String showPost(@PathVariable Long id, Model model) {
        Post post = postRepository.findById(id).orElse(null);
        model.addAttribute("post", post);
        return "post_detail";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("post", new Post());
        return "post_form";
    }

    @PostMapping("/create")
    public String createPost(@ModelAttribute @Valid Post post, BindingResult bindingResult,
                             @RequestParam("imageFile") MultipartFile imageFile) {
        if (bindingResult.hasErrors()) {
            return "post_form";
        }
        try {
            String uploadDir = "your_upload_directory"; // 이미지 업로드 디렉토리 설정
            String fileName = UUID.randomUUID().toString() + "_" + imageFile.getOriginalFilename();
            Path filePath = Paths.get(uploadDir, fileName);
            Files.write(filePath, imageFile.getBytes());
            post.setImageUrl(fileName);
            postRepository.save(post);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/posts";
    }
}


