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
    7. Добавим массив с экземплярами структуры Reminder в extension с ключевым словом static 
    
## Section 4: Configure a collection as list
    Конфигурация  collection view будет создаваться при помощи compositional layout
    1. Соединим Main.storyboard и ViewController и переименуем название класса и суперкласса -> новоё имя добавим при помощи refactor->rename(mouse right click)
    2. В Main.storyboard справа во вкладке identity inspector назначим ReminderListViewController
    3. В ReminderListViewController создадим функцию listLayout()
    4. Убираем разделители(сепараторы) и цвет заднего фона ставим прозрачным
    5. Вернём в функции UICollectionViewCompositionalLayout с конфигурацией listConfiguration
    6. Во ViewDidLoad создадим экземпляр listLayout
    7. Присвоим collectionView - listLayout
    
## Section 5: Configure data source
   В этой секции сделаем регистрацию cell в collection view и добавим apperance(как будет выглядеть) к cell. Соединим data source и cell.
   
   Будет использован Diffable data source - позволяет делать update и анимацию интерфейса при его изменениях
   
   1. Создадим регистрацию новой ячейки cell 
   2. Получим данные Reminder для каждой ячейки
   3. Получим дизайн ячейки (Конфигурация контента ячейки по умолчанию)
   4. Добавим значения для content configuration 
   5. Добавим type alias для Diffable data source
   6. Добавим опциональное свойство DataSource
   7. Присвоим значение для data source
   8. Добавим регистрацию ячейки
   
## Section 6: Apply a snapshot
    Diffable data source управляет состоянием данных при помощи при помощи снэпшотов(snapshot). Snapshot представляет состояние ваших данных в определенный период времени. Чтобы отображать данные при помощи snapshot необходимо:
    1 - Создать snapshot
    2 - Заполняем snapshot данными, которые хотим отобразить
    3 - Применяем snapshot к пользоватеьлскому интерфейсу
    
    В этой секции сделаем шаги описанные выше.
    
    1. Добавим type alias для snapshot
    2. Создадим вариант Snapshot в методе viewDidLoad
    3. Добавим секции collectionView к snapshot
    4. Создадим новый массив, который содержит только reminder titles
    5. В этом шаге предлагается рассмотреть второй вариант кода, который будет короче, но выполнять те же действия, что и в шаге 4
    6. Применим snapshot к data source
    7. Передадим данные data source в collection view
    8. Запустим приложение
    
## Section 7: Displaying cell info
    1. В папке Models создадим файл Date+Today в котором создадим раширение для Date
    2. Добавим вычисляемое свойство для отображения текста дня и времени
    3. Создадим константу со строковым значением 
    4. Добавим if-else который будет проверять является ли дата из календаря текущей датой
    5. Добавим локализованную строку, чтобы любой пользоватеьл мог прочитать сообщение
    6. Вернём строку и применим timeFormat к timeText
    7. При помощи метода formatted() создадим строку с данными даты. Этот метод позволяет создать строковый формат времени с локализацией
    8. Создадим локализованную строку для отображения date time
    9. Вернём строку для второго условия
    10. Создадим еще одно вычисляемое свойство, которое будет показфывать строку если дата является текущей датой, если дата не является текущей, то вернём просто отформатированную дату при помощи formatted()
