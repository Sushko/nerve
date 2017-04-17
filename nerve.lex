To backup:
"mysqldump -u user -p database > backup.sql"

To import:
"mysql -u user -p database < backup.sql"

[ideas / what next]
- make dump DB, fill history fields (from income_and_status and outcome), make date.cvs file from outcome, clear from income_and_status and outcome tables
- add in each class of mvc function/method info/set_data to model (for learning reasons)
- warning about empty fields in income_and_status table
- note for future development: planning script: task with deadline, default deadline - end of current year
- idea list
- phone voice notepad

[MVC]
/lib
--/controller
---- FrendCnt.php
--/model
---- Frend.php
---- FrendList.php
--/view
---- frendlist.php
---- frendone.php
/www
-- index.php
-- .htaccess
Вынесение каталога lib (содержащего движок нашего сайта) из веб-каталога даёт нам бОльшую защищённость, делая нашу систему недоступной для посягательств шаловливых ручонок взломщиков.
[code for dump DB]
PHP: генерация резервной копии базы данных MySQL в одну строку кода

Создание резервных копий баз данных очень важная задача, которую нужно время от времени выполнять. В данной заметке вы узнаете как с помощью PHP создать дамп базы данных в одну строчку.
Для решения данной задачи можете воспользоваться командой exec().
Заметка: выбирая между shell_exec() и exec(), советуем выбрать второе. В результате нам не будет выведен весь SQL код. Данные просто запишутся в файл.
Данная команду будет:

выполнять команду mysqldump с набором нужных параметров,
записывать данные в файл.
Пример:
    mysqldump --user=... --password=... --host=... DB_NAME > /path/to/output/file.sql
PHP код будет выглядеть так:
    exec('mysqldump --user=... --password=... --host=... DB_NAME > /path/to/output/file.sql');
Вместо знака ... необходимо подставить имя пользователя базы данных, пароль и хост.
Помимо этого, выполнение данного файла можно подсадить на крон, поэтому имя файла можно генерировать автоматически, используя функцию даты и времени.
    exec('mysqldump --user=... --password=... --host=... DB_NAME > /path/to/output/' . date('Y-m-d') . '.sql');

If you want to create a backup to download it via the browser, you also can do this without using a file.

The php function passthru() will directly redirect the output of mysqldump to the browser. In this example it also will be zipped.

Pro: You don't have to deal with temp files.

Con: Won't work on Windows. May have limits with huge datasets.

<?php

$DBUSER="user";
$DBPASSWD="password";
$DATABASE="user_db";

$filename = "backup-" . date("d-m-Y") . ".sql.gz";
$mime = "application/x-gzip";

header( "Content-Type: " . $mime );
header( 'Content-Disposition: attachment; filename="' . $filename . '"' );

$cmd = "mysqldump -u $DBUSER --password=$DBPASSWD $DATABASE | gzip --best";   

passthru( $cmd );

exit(0);
?>

[save outcome to log]
1. подготовить excel file
2. mechanism of exporting data to cvs by month
3. нажатие кнопки "прочитать из файла"
4. очищает все данные из таблици "outcome"
5. читает файл с именем указанным в поле "файл для экспорта"
6. импортирует в таблицу "outcome"
7. берет дату из первой стоки и парсит (год и месяц)
8. по нажатию кнопки "Export" экспортирует файл с именем (год и месяц) в cvs-формате 
/*----------------------------------------------------------*/
export mysql table csv php

Цель - заполнение таблици "history" и формирование архива файлов растраты за месяц

я копирую данные из исходных таблиц в таблицу в нужном формате
скрипт берет данные из таблици за указаный месяц и отображает его мне в черновом виде
по нажатию некоторой кнопки "сделаем это" данные из этой таблици записываются в таблицу "history" и создается некий файл с расходами за месяц (по дням) - по суди дамп таблици "outcome"



GENERAL:
    outcome_group   - done
    income_group    - done
GOALS:
    goals_in_time   - manually
    goals_name      - manually
PLANS:
    plans_in_time   - manually
    plans_name      - manually
HISTORY:
    history         - from "income_and_status" and "outcome" by script 
    extra_expense   - manually
CURRENT MONTH:
    income_and_status   - manually
    outcome         - script from excel



[TODO]
    1. make script that fills "outcome" and most of "income_and_status" from excel
    2. format excel table in appropriate form
    3. all unfilled fields of "income_and_status" should be filled manually before "history" 
    4. make script that takes corresponding fields from "income_and_status" and "outcome" and fill field in "history" according to year/month. and "dump" "outcome" table as archive.




    - заполнять таблици данными из excel
    - как конвертировать данные в БД из excel

    - написать скрипт заполнения БД (месяца, переноса в историю)
    - написать скрипт отображение БД
    - написать draft скрипт для отображения месяца

    - разобраться в MVC
    - распланировать стадии разработки ПО
    - построить модель ПО по MVC (модель ПО: что там должно быть, как работать, стадии выполнения, MVC, structure of files)


    /*---*/
    git на сервере "/var/www/html/"
    git на работе в папке "/opt/lampp/htdocs/nerve"
    git дома на Windows в папке где-то "/xampp/htdocs/nerve"
    git дома на Linux (установить xampp) где-то так же "/opt/lampp/htdocs/nerve"
    (git на флешке  "/projects/nerve/web/source/")
    основной репозиторий - git, дома, на работе, на сервере - можно скачать - удалить и т.п.
    делать дамп репозитория с какой-то регулярностью

    /*---*/
    создать папку отдельно для HW (bbb) - держать описание конфигурации, плано TODO, скрипты, может легкий код, build инструкции (ничего тяжелого?)
    продумать как держать данные для таблиц в git в файле 
    сделать скрипк, который делает дамп текущей БД (на всякий случай), дропает ее, и установливает ДБ из нового файла
    возможно потом можно сделать скрипт который будет апдейтить только поля в БД

# maybe in future set git repo on bbb

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#needed views in new budget
########################################################################################################################
#    NerVe Tables architecture v0.1                                                                                    #
#                                    (life goals + their costs; earning in years)                                      #
#                                                        -----                                                         #
#                                                       |GOALS|                                                        #
#                                                        -----                                                         #
#                                                          /\                                                          #
#                                                         /  \                                                         #
#                                         -------   /   -------------  \   -----                                       #
# (+summary of previous months, years)   |HISTORY| <   |CURRENT MONTH|  > |PLANS| (expences plan for next month, year) #
#                                         -------   \   -------------  /   -----                                       #
#                                                                                                                      #
#--------------------------------------------------------Notes---------------------------------------------------------#
#    Коммунальные расходы хранятся в общей таблице расходов с префиксом "utility_"                                     #
#    Делать дамп таблиц каждое N времени + резервное копирование                                                       #
#    Разобраться что такое "отображение" (VIEW) + хранимые процедуры. Добавлять некоторые поля/таблици как views       #
#    На будущее: Кнопка "формировать отчет за период" в разделе HISTORY                                                #
#    Круговая диаграмма отображает текущее состояние денег. Т.е. сколько осталось переходит с месяца в месяц           #
#    Т.е. хранится сумма денег, которая осталась на конец месяца. К ней суммируется доход и вычитаются траты           #
#    Нужно хранить переходной остаток.                                                                                 #
#    Возможна другая диаграмма с отображением плановых трат.                                                           #
#--------------------------------------------------------Tables--------------------------------------------------------#
#                                                        -------                                                       #
#                                                       |GENERAL|                                                      #
#                                                        -------                                                       #
# outcome_group: list of group names for outcome                                                                       #
# income_group:  list of group names for income                                                                        #
#                   outcome_group                            income_group                                              #
#        +--------------------------------+        +--------------------------------+                                  #
#        | group_id | title | colunm_name |        | group_id | title | colunm_name |                                  #
#        |----------+-------+-------------|        |----------+-------+-------------|                                  #
#        |          |       |             |        |          |       |             |                                  #
#        |          |       |             |        |          |       |             |                                  #
#                                                                                                                      #
#   colunm_name = поле с названием соответствующей колонки в History & Current month                                   #
#                                                                                                                      #
#                        income_group                                                                                  #
#        +----------------------------------------------------------+                                                  #
#        | group_id |       title        |       colunm_name        |                                                  #
#        |----------+--------------------+--------------------------|                                                  #
#        |          | Avtor (Лёша)       | lex_salary_avtor         |                                                  #
#        |          | Frog (Лёша)        | lex_salary_frog          |                                                  #
#        |          | GlobalLogic (Лёша) | lex_salary_globallogic   |                                                  #
#        |          | Mindshare (Youleek)| youleek_salary_mindshare |                                                  #
#        |          | Родители           | parents                  |                                                  #
#        |          | Продажи            | sales                    |                                                  #
#        |          | Подарки            | presented                |                                                  #
#        |          | Социальные выплаты | government               |                                                  #
#        |          | Другое             | other                    |                                                  #
#        |          |                    |                          |                                                  #
#   В графе income_group, если поле пустое - скрывать его                                                              #
#                         outcome_group                                                                                #
#        +--------------------------------------------------------------------+                                        #
#        | group_id |             title             |       colunm_name       |                                        #
#        |----------+-------------------------------+-------------------------|                                        #
#        |          | ОСББ                          | utilities_house_keeping |                                        #
#        |          | Гараж                         | utilities_garage        |                                        #
#        |          | Интернет                      | utilities_internet      |                                        #
#        |          | Свет                          | utilities_electricity   |                                        #
#        |          | Газ                           | utilities_gas           |                                        #
#        |          | Вода                          | utilities_water         |                                        #
#        |          | Питание                       | food                    |                                        #
#        |          | Хоз.товары и бытовые траты    | domestic                |                                        #
#        |          | Бензин/дорога                 | transportation          |                                        #
#        |          | Расходы на машину             | car_maintain            |                                        #
#        |          | Одежда                        | clothes                 |                                        #
#        |          | Здоровье                      | health                  |                                        #
#        |          | Вещи для дома/быта            | house_stuff             |                                        #
#        |          | Игрушки, др. вещи для ребёнка | kid_stuff               |                                        #
#        |          | Досуг                         | entertainment           |                                        #
#        |          | Подарки                       | presents                |                                        #
#        |          | Обучение, развитие            | study_development       |                                        #
#        |          | Телефон                       | phone                   |                                        #
#        |          | Сигареты                      | cigarette               |                                        #
#        |          |                               |                         |                                        #
#----------------------------------------------------------------------------------------------------------------------#
#                                                          -----                                                       #
#                                                         |GOALS|                                                      #
#                                                          -----                                                       #
#  goals_in_time: goal income/outcome/inv.amoutn for each month/year                                                   #
#  goals_name:    big goals with their costs                                                                           #
#                            goals_in_time                                     goals_name                              #
#        +-------------------------------------------------+        +--------------------------+                       #
#        | year | month | income | outcome | invest_amount |        | id | title | cost | year |                       #
#        |------+-------+--------+---------+---------------|        |----+-------+------+------|                       #
#        |      |       |        |         |               |        |    |       |      |      |                       #
#        |      |       |        |         |               |        |    |       |      |      |                       #
#                                                                                                                      #
#    Варьируя записидат в таблице можно будет перейти от планов по месяцам к планам по годам                           #
#   Конец года - 12.xx (декабрь n-года)                                                                                #
#   Выбирая записи декабря каждого года получим цели по годам                                                          #
#   Первые n лет цили расписаны по месяцам                                                                             #
#                                                                                                                      #
#    Отображение планов по годам:                                                                                      #
#    Invest amount = среднее invest_amount за год из таблици "goals_in_time"                                           #
#   Planned capital = за декабрь каждого года из таблици "goals_in_time"                                               #
#                        сумма с начала таблици средний за год invest_amount * 12 - сумма за год goals_name.cost       #
#    "Отпуск"" хранится в invest_amount как отрицательное значение                                                     #
#----------------------------------------------------------------------------------------------------------------------#
#                                                          -----                                                       #
#                                                         |PLANS|                                                      #
#                                                          -----                                                       #
#  plans_in_time: plans distribution by months                                                                         #
#  plans_name:    plans names with their costs                                                                         #
#                   plans_in_time                            plans_name                                                #
#            +----+------------------+        +---------------------------------------+                                #
#            | id | plan_id |  month |        | plan_id | title | out_group_id | cost |                                #
#            |----+---------+--------|        |---------+-------+--------------+------|                                #
#            |    |         |        |        |         |       |              |      |                                #
#            |    |         |        |        |         |       |              |      |                                #
#                                                                                                                      #
#   set value "some month" in column "month" for goal with no specific month                                           #
#                                                                                                                      #
#----------------------------------------------------------------------------------------------------------------------#
#                                                         -------                                                      #
#                                                        |HISTORY|                                                     #
#                                                         -------                                                      #
#  history:         summary of "money flow" for each month/year                                                        #
#  extra_expense:     big expenses (irregular) or extra loss of money for month/year                                   #
#                                                         history                                                      #
#        +-----------------------------------------------------------------------------------------------------+       #
#        | year | month | income_group | outcome_group | invest_amount | capital | balance | usd_ratio | notes |       #
#        |      |       |    <--9-->   |   <--19-->    |               |         |         |           |       |       #
#        |------+-------+--------------+---------------+---------------+---------+---------+-----------+-------|       #
#        |      |       |  |  |  |  |  |  |  |   |  |  |               |         |         |           |       |       #
#        |      |       |  |  |  |  |  |  |  |   |  |  |               |         |         |           |       |       #
# columns "income", "outcome" with prefixes "in_", "out_"                                                              #
#                                                                                                                      #
#                                                     extra_expense                                                    #
#                                +----------+-------+-------+---------------------+                                    #
#                                | extra_id |  year | month | title | type | cost |                                    #
#                                |----------+-------+-------+-------+------+------|                                    #
#                                |          |       |       |       |      |      |                                    #
#                                |          |       |       |       |      |      |                                    #
#    Column "type" - whether "big expense" or "extra loss"(usually out of budjet)                                      #
#    По кнопке "Save month/New month" добавляется запись в обе таблици (в "extra_expense" по необходимости)            #
#----------------------------------------------------------------------------------------------------------------------#
#                                                      -------------                                                   #
#                                                     |CURRENT MONTH|                                                  #
#                                                      -------------                                                   #
#  income_and_status:    data common for month: income, balance, invest amount                                         #
#  outcome:               expences for month per day and groupe                                                        #
#                                      income_and_status                                    outcome                    #
#        +--------------------------------------------------------------------+      +----------------------+          #
#        | date | income_group | invest_amount | balance | usd_ratio | notes  |      | date | outcome_group |          #
#        |      |    <--9-->   |               |         |           |        |      |      |   <--19-->    |          #
#        |------+--------------+---------------+---------+-----------+--------|      |------+---------------|          #
#        |      |  |  |  |  |  |               |         |           |        |      |      |  |  |   |  |  |          #
#        +-----------------------------------------------------------+--------+      |      |  |  |   |  |  |          #
#                                                                                                                      #
#    Field "balance" - current state of money (should be equal = prev.month balance-current month (outcome+inv.mount)) #
#    negative balance = debt                                                                                           #
#    Поле date из "income_and_status" используется как дата последнего заполнения + определение текущего месяца (?)    #
#    Расходы за месяц расчитываются как сумма всех полей по дням                                                       #
#    В конце месяца содержимое таблици "income_and_status" (кроме даты)                                                #
#    + Суммы по колонкам outcome_group из "outcome" переносятся в "history"                                            #
#    Кнопка "Save month/New month":                                                                                    #
#    + Инициализируется/очищается (подстройка дней 28-31) таблица для нового месяца ( по дням ), следующего за текущим #
#    + Добавляет запись в "history" (в "extra_expense" по необходимости) с инф. о месячных расходах/доходах и др.      #
#    + создает текстовый файл - дамп mysql таблици "outcome" о тратах текущего месяца по дням                          #
#    Сохранять с полем полная дата. При конвертации в таблицу его легко парсить и получить полную дату месяцам         #
#    При необходимости текстовый файл можно конвертировать в таблицу                                                   #
#     Хратить его как лог.                                                                                             #
#                                                                                                                      #
########################################################################################################################


current views:
#текущий месяц
1) расходы (общие, коммунальные, экстра - которые берутся с накоплений)
2) доходы
3) капиталовложения
4) соснояние накоплений
5) баланс = доход - расход - капиталовложения
#история
6) история доходов/расходов за весь период (можно сделать переменным)
7) история состояния накоплений (общее, по годам)
8) история экстра растрат / потерь (влияет на состояние накопления)
9) история курс доллара
#планы
A) плановые лимиты расходов по каждой статье на месяц 
    (высчитать исходя из предыдущих расходов. 
     Разделить на зоды зел/жел/кр. 
     зел - до лимита, жел - в 70-80% не превышалась, кр - больше)
B) плановые расходы на текущий месяц
C) плановые расходы на год 
#цели
D) фин цели




Хранение БД в git:
- у mysql есть опция "--skip-extended-insert", помогающая создать дамп удобного для контроля версий формата
- Храните в репозитории только структуру и миграции. Где есть возможность как накатить, так и откатить изменения (на случай появления ошибок) в БД.

[SQL setup]


run mysql console: 

sudo /opt/lampp/lampp startmysql
/opt/lampp/bin/mysql -u root

уроки JS
http://www.site-do.ru/js/js.php

http://www.site-do.ru/db/sql17.php
http://gahcep.github.io/blog/2013/01/05/mysql-utf8/
https://habrahabr.ru/post/115777/
http://www.bseu.by/it/tohod/lekcii4.htm
http://www.mysql.ru/docs/man/Introduction.html
https://www.youtube.com/results?search_query=%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0+%D1%81+%D0%91%D0%94+sql
https://www.youtube.com/watch?v=6wYk-0uA8B4


one-to-one
one-to-many
many-to-many




Какой функционал требуется от базы данных

Первый метод, используемый при планировании, это обычный мозговой штурм, делая записи на бумаге или как-то еще, в зависимости от того, что требуется хранить в базе данных, и что будет требоваться сайту. Старайтесь не думать об конкретных полях, таблицах, которые будут использоваться в конкретном случае — все специфичные моменты будут рассмотрены вами позже. Ваша цель на данном этапе состоит в том, чтобы получить общую и полную картину структуры базы данных, которую потом будете уточнять и делать более подробной. Зачастую в дальнейшем может быть более трудным добавить какие-то элементы в ваш план, нежели на первоначальном этапе.

Определение необходимых таблиц и полей

Следующий этап заключается в том, чтобы определить, какие именно таблицы и поля потребуются в базе данных. Это ядро разработки и самая сложная её часть. Использование правильных методов связки таблиц, определение структуры данных в каждой таблице, выявление необходимости разброса этих данных по разным таблицам, — все эти проблемы всплывают при непосредственном проектировании базы данных. Теперь вам необходимо определить список очевидно необходимых таблиц и полей, будьте как можно более конкретным. В ходе этого процесса, какие-то элементы могут быть перестроены либо реорганизованы в целях повышения эффективности и безопасности базы данных.


Используйте инструмент моделирования данных

Теперь, когда вы знаете, что сайт должен будет делать, самое время определить, какую конкретно информацию нужно будет хранить. Очень уместным здесь окажется инструмент для проектирования баз данных, особенно имеющий возможность создавать визуальные модели базы данных, например, MySQL Workbench либо DBDesigner4. Gliffy является отличным бесплатным он-лайн инструментом для создания различных блок-схем и моделей баз данных.


Может быть, наиболее важным этапом проектирования базы данных является само его начало и мозговой штурм. Это то, что позволяет любому разработчику получить всю необходимую информацию заранее и реализовывать задуманное по мере необходимости. Только имея всю необходимую информацию для проектирования, можно создать эффективную базу данных с правильно связанными таблицами.
Любая база данных должна быть эффективной и масштабируемой. Данные постоянно редактируются, добавляются, удаляются, поэтому важным будет содержать базу данных организованной таким образом, чтобы поддерживать этот постоянно изменяющийся набор данных. Убедитесь, чтобы в создаваемой базе данных удалялась только та информация, которая должна, не дублировались бы записи и можно было бы ссылаться на другие данных легко и просто.


The normal forms are guidelines for good database design. 
normalization has some significant advantages in terms of the efficiency and maintainability of your database.

-In a normalized database structure you can make complex data selections with relatively simple SQL queries.
-Data integrity. A normalized database allows for reliable data storage. 
-Database normalization avoids redundant (duplicate) storage of data. Data are always stored in only one location which makes it easy to insert, update or delete data. There is one exception to this rule. The keys themselves are stored in multiple locations, because they are copied as foreign keys to other tables. If you want to state it correctly you should say that logical data is not duplicated.
-Scalability is the ability of a system to deal with future growth. For a database this means that it must still be able to perform quickly when the number of users and the amount of data grows. Scalability is a very important characteristic of any database model and for database management systems.

These are some of the general tasks that are associated with database normalization.

-Ordering data in logical groups or sets.
-Finding relationships between sets of data. You have seen an examples of the one-to-many relationship and the many-to-many relationship in this tutorial.
-Minimizing data redundancy. In other words, making sure logical data is stored in only one location.

/*The first normal form (1NF)*/
The first normal form states that a database table is a representation of an entity in the system you are building. Each row in the database table represents one instance of an entity.
Primary key. Rule: each table has a primary key, consisting of the smallest possible number of fields.
Atomicity. Rule: fields are not duplicated in a row and each field contains only one value.
Row order should not matter. Rule: The order of rows in a table should not matter.

/*The second normal form (2NF)*/
In order for a database to be normalized according to the second normal form it must first be normalized according to the rules of the first normal form. The second normal deals with data redundancy.
Data redundancy. Rule: Non-primary key fields must be dependent on the primary key.
you must only store data in a table that is directly related and doesn't belong to another entity. 

/*The third normal form (3NF)*/
The third normal form deals with transitive dependencies. A transitive dependency between database fields exists when the value of a non-key field is determined by the value of another non-key field. For a database to be in the third normal form it must first be in the second normal form.
Transitive dependencies. Rule: there can be no transitive dependencies between fields in a table.
The third normal form basically says you should not store data that in fields that can be derived from other (non-key) fields in a table.
The third normal form is not always adhered to in database design. When designing a database you should always compare the advantages of a higher normal form to the work it takes to apply and mantain that normal form.
Storing derived data, like the result of a calculation that is based on existing data is usually a bad idea.
