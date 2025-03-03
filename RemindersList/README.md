#  Reminders List UIKit

Reminders app - приложение заметки на UIKit

## Section 1 
- creating project in Xcode

## Section 2 Add collection view controller
    1.Добавим ViewController к StoryBoard. ViewController служит связующим звеном между View и моделями данных. Каждый ViewController отвечает за управление иерархией View, обновление содержимого во View и реагирование на события в пользовательском интерфейсе.
    Будем использовать Interface Builder для создания CollectionViewController. В CollectionViewController могут отображаться ячейки в виде сеток, таблиц, столбцов, строк и т.д.
    
    Выбираем файл Main.storyboard и в появимшемся окне в левой панели(Document outline) удалим  View Controller Scene. Click on View Controller Scene and push Backspace button on keyboard.
    2. Добавим CollectionViewController взамен удаленного
    3. Перетаскиванием добавляем CollectionViewController на canvas
    4. Раскроем( in document outline) CollectinoViewController и удалим collection view cell
    5. В Document outline выбираем CollectionViewController -> в правой верхней части экрана выберем Attributes inspector -> поставить галочку в поле Is initial view controller
## Section 3: Create reminder model
    В этом приложении будет использованна структура(архитектура) MVC - Model View Controller
    1. Создадим новую папку Models
    (В Xcode 16 появилось дополнение, теперь в Project Navigator можно создавать как папки(Folder) так и группы(Groups) - в предыдцщих версиях Xcode  использовались группы - основное отличие в том, что группы можно располагать в каком угодно порядке, а папке располагаются только в алфавитном порядке. Использование групп удобнее, позволяет разместить файлы и папки в визуально удобном порядке)
    2. Создадим файл Reminder.swift в папке Models и создаим  в нём структуру Reminder
    3. В этой структуре обяъявим свойства title dueDate
    4. Добавим опциональное значение notes со значением по умолчанию nil
    5. isCompleded 
    6. Добавим раширение к структуре Reminder с аннотацией #if Debug -> #endif
    7. Добавим массив с экземплярами структуры Reminder в extension с ключевым словом static - 

