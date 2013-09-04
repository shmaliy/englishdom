<?php

function multyDepthRoute($pos = 0)
{
    $url = parse_url($_SERVER['REQUEST_URI']);
    $url = explode('/', trim($url['path'], '/'));
    
    if (isset($url[$pos])) {
        if ($pos == 0) {
            $regex = '/(?<request_string_' . $pos . '>[a-zA-Z0-9-_\/]+)?';
        } else {
            $regex = '(?<request_string_' . $pos . '>[a-zA-Z0-9-_\/]+)?';
        }
        $route = array(
            'categories_' . $pos => array(
                'type'    => 'regex',
                'options' => array(
                    'regex'    => $regex,
                    'defaults' => array(
                        'controller' => 'Categories\Controller\Categories',
                        'action'     => 'index',
                    ),
                    'spec' => '/%request_string_' . $pos . '%',
                ),
                'may_terminate' => true,
                'child_routes' => multyDepthRoute($pos+1),
            )
        );
        
        if ($pos == count($url)-1) {
            unset($route['categories_' . $pos]['child_routes']);
        } 
    }
    return $route;
}

return array(
    'controllers' => array(
        'invokables' => array(
            'Categories\Controller\Categories' => 'Categories\Controller\CategoriesController',
        ),
    ),
    'router' => array(
        'routes' => multyDepthRoute(),
    ),

    'view_manager' => array(
        'display_not_found_reason' => true,
        'display_exceptions'       => true,
        'doctype'                  => 'HTML5',
        'not_found_template'       => 'error/404',
        'exception_template'       => 'error/index',
        'template_path_stack' => array(
            'application' => __DIR__ . '/../view',
        ),
        'strategies' => array(
            'ViewJsonStrategy',
        ),
    ),
);
