### Описание  
Репозиторий с коллекцией [здесь](https://github.com/atasenko/my_own_collection)  
[Архив](https://github.com/atasenko/my_own_collection/blob/main/my_own_namespace-yandex_cloud_elk-1.0.0.tar.gz)  
Код модуля [здесь](https://github.com/atasenko/my_own_collection/blob/main/my_own_namespace/yandex_cloud_elk/plugins/modules/my_file_module.py)  
Проверяю модуль на исполняемость локально:  
![мама я погромист](img/ans6-4.png)  
Проверяю на идемпотентность двойным запуском playbook:  
![пришлось покодить](img/ans6-6.png)  
Установка коллекции из локального архива:  
![collection install](img/ans6-15.png)  
Запуск плейбука с ролью из коллекции:  
![idempotention ok](img/ans6-16.png)
[Плейбук](to_run/site.yml) и [результат](to_run/role_testfile.txt) его работы.
