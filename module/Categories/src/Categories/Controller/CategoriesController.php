<?php

namespace Categories\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Categories\Model\Categories;   
use Zend\View\Model\JsonModel;

class CategoriesController extends AbstractActionController
{
    protected $categoriesTable;
    
    
    public function indexAction()
    {
        $request = $this->getRequest();
        $viewmodel = new ViewModel();
        
        if($request->isXmlHttpRequest()) {
            $viewmodel->setTerminal(true);
            $record = $this->getCategoriesTable()->getCategories($_POST['path']);
            $result = new JsonModel(array(
                'title' => $record->title,
                'content' => $record->content
            ));
            return $result;
        }
        
        $data = $this->getCategoriesTable()->makeNavigation();
        $viewmodel->setVariables(array(
            'nav' => $data,
        ));
        return $viewmodel;
        
    }
    
    public function getCategoriesTable()
    {
        if (!$this->categoriesTable) {
            $sm = $this->getServiceLocator();
            $this->categoriesTable = $sm->get('Categories\Model\CategoriesTable');
        }
        return $this->categoriesTable;
    }
}