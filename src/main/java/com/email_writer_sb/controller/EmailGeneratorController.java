package com.email_writer_sb.controller;


import com.email_writer_sb.EmailRequest;
import com.email_writer_sb.service.EmailGenratorService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/email")
@AllArgsConstructor
@CrossOrigin(origins = "*")
public class EmailGeneratorController {


    private final EmailGenratorService emailGenratorService;


    @PostMapping("/generate")
    public ResponseEntity<String> generateEmail(@RequestBody EmailRequest emailRequest){
        String response = emailGenratorService.generateEmailReply(emailRequest);
        return ResponseEntity.ok(response);
    }
}
