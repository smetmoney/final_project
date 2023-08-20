package com.bitc.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.project.service.NoteService;
import com.bitc.project.util.SearchCriteria;
import com.bitc.project.vo.NoteVO;

@Controller
@RequestMapping("note")
public class NoteController {
	
	@Autowired
	private NoteService ns;

	@GetMapping("note")
    public String note(Model model, SearchCriteria cri) throws Exception {
        List<NoteVO> notes = ns.noteVOList(cri);
        model.addAttribute("notes", notes);
        return "note/note";
    }
	
	@GetMapping("noteWrite")
    public String createNoteForm() {
        return "note/notewrite";
    }

    @PostMapping("noteWrite")
    public String createNote(String fromId, String toId, String title, String content) {
        return "redirect:/note/note";
    }
    
    @GetMapping("notedetail")
    public String noteDetail(int noteId, Model model) throws Exception {
        NoteVO note = ns.read(noteId);
        model.addAttribute("note", note);
        return "note/notedetail";
    }

	
}
