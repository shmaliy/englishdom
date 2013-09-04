<?php
namespace Categories\Model;

use Zend\Db\TableGateway\TableGateway;


class CategoriesTable
{
    protected $tableGateway;
    
    public function __construct(TableGateway $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll()
    {
        $select = $this->tableGateway->getSql()->select()
                    ->order('parent_id')
                    ->order('priority');
        $resultSet = $this->tableGateway->selectWith($select);
        return $resultSet;
    }
    
    public function makeCatTree($parent = 0, $url = '/')
    {
        $data = $this->fetchAll();
        
        $tree = array();
        foreach ($data as $row) {
            if ($row->parent_id == $parent) {
                $pages = $this->makeCatTree($row->id, $url . $row->alias . '/');
                $current_uri = $url . $row->alias;
                $tree[] = array(
                    'label' => $row->title,
                    'id'    => $row->id,
                    'active' => false,
                    'uri' => $current_uri,
                    'pages' => $pages
                );
            }
        }
        return $tree;
    }
    
    public function makeNavigation()
    {
        $nav = new \Zend\Navigation\Navigation();
        $nav->setPages($this->makeCatTree());
        return $nav;
    }
    
    public function getCategories($path)
    {
        $path = explode('/', trim($path, '/'));
        $alias = end($path);
        
        $rowset = $this->tableGateway->select(array('alias' => $alias));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $alias");
        }
        return $row;
    }
    
}