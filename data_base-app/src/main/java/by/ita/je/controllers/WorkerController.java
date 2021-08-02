package by.ita.je.controllers;

import by.ita.je.dto.DetailDto;
import by.ita.je.dto.WorkerDto;
import by.ita.je.model.Detail;
import by.ita.je.model.Worker;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

@RestController
public class WorkerController {
    private final static ObjectMapper objectMapper=new ObjectMapper();

    @ResponseBody
    @PostMapping("/worker")
    public WorkerDto create(@RequestBody WorkerDto workerDto) {
        final Worker worker1 = objectMapper.convertValue(workerDto, Worker.class);
        return workerDto;
    }
    @GetMapping("/worker/{id}")
    public WorkerDto findById(@PathVariable("id") String id)
    {   WorkerDto workerDto=new WorkerDto();

        return workerDto;
    }

    @ResponseBody
    @PutMapping(value = "/worker")
    public WorkerDto update( @RequestParam(value = "name",required = false) String name,
                             @RequestBody WorkerDto workerDto){

        return workerDto;
    }



    @ResponseBody
    @GetMapping("/workers/list")
    public List<WorkerDto> findListByIds(@RequestBody List <Long> listIds){
        List<WorkerDto> listWorkerDto=new ArrayList<WorkerDto>();


        return listWorkerDto;

    }

    @ResponseBody
    @GetMapping("/workers")
    public  List<WorkerDto> findAll(){
        List<WorkerDto> listWorkerDto=new ArrayList<WorkerDto>();

        return listWorkerDto;

    }
    @ResponseBody
    @DeleteMapping("/worker/{id}")
    public void delleteById(@PathVariable("id") String id){ }

    @ResponseBody
    @DeleteMapping("/workers")
    public void delleteList(@RequestBody List<WorkerDto> list){    }
}
