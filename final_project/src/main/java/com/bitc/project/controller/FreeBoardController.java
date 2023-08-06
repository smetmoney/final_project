package com.bitc.project.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.validation.Valid;

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

import com.bitc.project.repository.FreeBoardRepository; 
import com.bitc.project.vo.FreeBoardVO; 

@Controller
public class FreeBoardController {
    @Autowired
    private FreeBoardRepository freeBoardVORepository; 

    @GetMapping("/freeboards")
    public String showFreeBoards(Model model) {
        List<FreeBoardVO> freeBoards = freeBoardVORepository.findAll(); 
        model.addAttribute("freeBoards", freeBoards);
        return "freeboard_list";
    }

    @GetMapping("/freeboards/{id}")
    public String showFreeBoard(@PathVariable Long id, Model model) {
        FreeBoardVO freeBoard = freeBoardVORepository.findById(id).orElse(null); // FreeBoard -> FreeBoardVO로 변경
        model.addAttribute("freeBoard", freeBoard);
        return "freeboard_detail";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("freeBoard", new FreeBoardVO());
        return "freeboard_form";
    }

    @PostMapping("/create")
    public String createFreeBoard(@ModelAttribute @Valid FreeBoardVO freeBoard, BindingResult bindingResult,
                                  @RequestParam("imageFile") MultipartFile imageFile) {
        if (bindingResult.hasErrors()) {
            return "freeboard_form";
        }
        try {
            String uploadDir = "#"; // 이미지 업로드 디렉토리 설정
            String fileName = UUID.randomUUID().toString() + "_" + imageFile.getOriginalFilename();
            Path filePath = Paths.get(uploadDir, fileName);
            Files.write(filePath, imageFile.getBytes());
            freeBoard.setImageUrl(fileName);
            freeBoardVORepository.save(freeBoard); 
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/freeboards";
    }
}
