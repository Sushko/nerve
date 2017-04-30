<?php

/*
Класс-маршрутизатор для определения запрашиваемой страницы.
> цепляет классы контроллеров и моделей;
> создает экземпляры контролеров страниц и вызывает действия этих контроллеров.
*/
class Route
{

    static function start()
    {
        $GLOBALS["home_path"] = 'nerve/';

        if(isset($_POST['logout']) && ($_POST['logout']=='logout'))
        {
            session_start();
            session_destroy();
            header('Location:/'.$GLOBALS["home_path"]);
        }

        // контроллер и действие по умолчанию
        $controller_name = 'Current_month';
        $action_name = 'index';

        session_start();

        /*
        Для простоты, в нашем случае, проверяется равенство сессионной переменной admin прописанному
        в коде значению — паролю. Такое решение не правильно с точки зрения безопасности.
        Пароль должен храниться в базе данных в захешированном виде, но пока оставим как есть.
        */
        if(isset($_SESSION['admin']) && ($_SESSION['admin']=='12345'))
        {

            //$GLOBALS["store_path"] = '/nerve/db/';
            //$GLOBALS["store_path"] = $path = str_replace('\\', '/', realpath(dirname(__FILE__))).'/';//'c:/xampp/htdocs/nerve/db/';
            $routes = explode('/', substr($_SERVER['REQUEST_URI'],strlen($GLOBALS["home_path"])));

            // получаем имя контроллера
            if ( !empty($routes[1]) )
            {
                $controller_name = $routes[1];
            }

            // получаем имя экшена
            if ( !empty($routes[2]) )
            {
                $action_name = $routes[2];
            }
        }
        else
        {
            session_destroy();
            // создаем контроллер
            $controller_name = 'Login';
        }

        // добавляем префиксы
        $model_name = 'Model_'.$controller_name;
        $controller_name = 'Controller_'.$controller_name;
        $action_name = 'action_'.$action_name;

        /*
        echo "Model: $model_name <br>";
        echo "Controller: $controller_name <br>";
        echo "Action: $action_name <br>";
        */

        // подцепляем файл с классом модели (файла модели может и не быть)

        $model_file = strtolower($model_name).'.php';
        $model_path = "application/models/".$model_file;
        if(file_exists($model_path))
        {
            include "application/models/".$model_file;
        }

        // подцепляем файл с классом контроллера
        $controller_file = strtolower($controller_name).'.php';
        $controller_path = "application/controllers/".$controller_file;
        if(file_exists($controller_path))
        {
            include "application/controllers/".$controller_file;
        }
        else
        {
            /*
            правильно было бы кинуть здесь исключение,
            но для упрощения сразу сделаем редирект на страницу 404
            */
            Route::ErrorPage404();
        }

        // создаем контроллер
        $controller = new $controller_name;
        $action = $action_name;

        if(method_exists($controller, $action))
        {
            // вызываем действие контроллера
            $controller->$action();
        }
        else
        {
            // здесь также разумнее было бы кинуть исключение
            Route::ErrorPage404();
        }

    }

    function ErrorPage404()
    {
        $host = 'http://'.$_SERVER['HTTP_HOST'].'/'.$GLOBALS["home_path"];
        header('HTTP/1.1 404 Not Found');
        header("Status: 404 Not Found");
        header('Location:'.$host.'404');
    }
}
