<?php
namespace Categories\Model;

class Categories
{
    public $id;
    public $parent_id;
    public $title;
    public $alias;
    public $priority;
    public $content;
    
    protected $inputFilter; 
    
    public function exchangeArray($data)
    {
        $this->id     = (!empty($data['id'])) ? $data['id'] : null;
        $this->parent_id     = (!empty($data['parent_id'])) ? $data['parent_id'] : 0;
        $this->title  = (!empty($data['title'])) ? $data['title'] : null;
        $this->alias  = (!empty($data['alias'])) ? $data['alias'] : null;
        $this->priority  = (!empty($data['priority'])) ? $data['priority'] : 0;
        $this->content  = (!empty($data['content'])) ? $data['content'] : null;
    }
    
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}