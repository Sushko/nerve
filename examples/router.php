
<?php
    // "ловим" строку запроса, превращаем её в масив 
   $routeArray = explode('/', $_SERVER['REQUEST_URI']);
    // удаляем пустые элементы массива (элементы образованные начальным и конечным слэшами URI)
    // тут можно было обойтить array_shift и array_pop - но мне способ с foreach кажется более "универсальным"
    $route = array();
    foreach ($routeArray as $value) {
        if (!empty($value)) {
            $route[] = trim($value);
        }

    }
// вводим в адресную строку всякий бред, смотрим что нам показывают
echo "<pre>";
print_r($route);
echo "</pre>";
//"Классический" способ обработки в известных мне фреймворках: первый элемент массива — контроллер (или модуль), второй — action, последующие представляют собой пары ключ-значение.