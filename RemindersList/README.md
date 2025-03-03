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
    

