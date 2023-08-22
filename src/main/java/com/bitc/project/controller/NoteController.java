package com.bitc.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.project.service.NoteService;
import com.bitc.project.util.Criteria;
import com.bitc.project.vo.NoteVO;

@Controller
@RequestMapping("note")
public class NoteController {
	
	@Autowired
	private NoteService ns;

	@GetMapping("note")
    public String note(Model model, Criteria cri) throws Exception {
        List<NoteVO> notes = ns.noteVOList(cri);
        model.addAttribute("notes", notes);
        return "note/note";
    }
	
	@GetMapping("noteWrite")
    public String createNoteForm() {
        return "note/noteWrite";
    }

    @PostMapping("noteWrite")
    public String createNote(
    		NoteVO vo,
    		RedirectAttributes rttr
    		) throws Exception{
       ns.createNote(vo);
       rttr.addAttribute("message","쪽지를 보냈습니다");
        
        return "redirect:/note/note";
    }
    
    @GetMapping("noteDetail")
    public String noteDetail(
    		@RequestParam("nno")
    		int nno, Model model
    		) throws Exception {
        NoteVO note = ns.read(nno);
        model.addAttribute("note", note);
        return "note/noteDetail";
    }

	
}
